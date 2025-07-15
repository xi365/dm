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

    nPop = length(pop);       %计算pop有几个
    for i = 1:nPop          %初始化种群个体，支配个体集为空集and被支配数为0
        pop(i).DominationSet = [];
        pop(i).DominatedCount = 0;
    end
    
    F{1} = [];
    
    for i = 1:nPop          %两两进行比较，j设为i+1可以减少比较次数，因为1和2比与2和1比的结果是一样的
        for j = i+1:nPop    %如此，在记录结果的时候不光要记录pop(i)的还要记录pop(j)的
            p = pop(i);
            q = pop(j);
            
            if Dominates(p, q)      %支配关系
                p.DominationSet = [p.DominationSet j];
                q.DominatedCount = q.DominatedCount+1;
            end
            
            if Dominates(q.Cost, p.Cost)
                q.DominationSet = [q.DominationSet i];
                p.DominatedCount = p.DominatedCount+1;
            end
            
            pop(i) = p;     %因为改的都是p，q，而我们要的是pop里的个体更改，所以要赋值回去
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
        
        if isempty(Q)       %判断Q是否为空集，是就表示以及排序完了，可以退出
            break;
        end
        
        F{k+1} = Q; %#ok
        
        k = k+1;
        
    end
    

end