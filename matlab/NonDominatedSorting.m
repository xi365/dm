%
% Copyright (c) 2015, Mostapha Kalami Heris & Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "LICENSE" file for license terms.
%
% Project Code: YPEA120
% Project Title: Non-dominated Sorting Genetic Algorithm II (NSGA-II)
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Cite as:
% Mostapha Kalami Heris, NSGA-II in MATLAB (URL: https://yarpiz.com/56/ypea120-nsga2), Yarpiz, 2015.
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [pop, F] = NonDominatedSorting(pop)

    nPop = length(pop);       %����pop�м���
    for i = 1:nPop          %��ʼ����Ⱥ���壬֧����弯Ϊ�ռ�and��֧����Ϊ0
        pop(i).DominationSet = [];
        pop(i).DominatedCount = 0;
    end
    
    F{1} = [];
    
    for i = 1:nPop          %�������бȽϣ�j��Ϊi+1���Լ��ٱȽϴ�������Ϊ1��2����2��1�ȵĽ����һ����
        for j = i+1:nPop    %��ˣ��ڼ�¼�����ʱ�򲻹�Ҫ��¼pop(i)�Ļ�Ҫ��¼pop(j)��
            p = pop(i);
            q = pop(j);
            
            if Dominates(p, q)      %֧���ϵ
                p.DominationSet = [p.DominationSet j];
                q.DominatedCount = q.DominatedCount+1;
            end
            
            if Dominates(q.Cost, p.Cost)
                q.DominationSet = [q.DominationSet i];
                p.DominatedCount = p.DominatedCount+1;
            end
            
            pop(i) = p;     %��Ϊ�ĵĶ���p��q��������Ҫ����pop��ĸ�����ģ�����Ҫ��ֵ��ȥ
            pop(j) = q;
        end
        
        if pop(i).DominatedCount == 0
            F{1} = [F{1} i];
            pop(i).Rank = 1;
        end
    end
    
    k = 1;
    
    while true
        
        Q = [];
        
        for i = F{k}
            p = pop(i);
            
            for j = p.DominationSet
                q = pop(j);
                
                q.DominatedCount = q.DominatedCount-1;
                
                if q.DominatedCount == 0
                    Q = [Q j]; %#ok
                    q.Rank = k+1;
                end
                
                pop(j) = q;
            end
        end
        
        if isempty(Q)       %�ж�Q�Ƿ�Ϊ�ռ����Ǿͱ�ʾ�Լ��������ˣ������˳�
            break;
        end
        
        F{k+1} = Q; %#ok
        
        k = k+1;
        
    end
    

end