function [risk,P_simple]=risk_caculation
    N=18;
    dag=zeros(N,N);
    V1=1;V2=2;AH1=3;AH2=4;V3=5;V4=6;
    ES=7;HMI=8;CC=9;FC=10;PC=11;V5=12;
    VA2=13;IS=14;VA1=15;FS=16;VA3=17;PS=18;


    dag(V1,[AH1,AH2])=1;
    dag(V2,AH2)=1;
    dag([AH1,AH2],[ES,HMI])=1;
    dag(V3,ES)=1;dag(V4,HMI)=1;
    dag([ES,HMI],[CC,FC,PC])=1;
    dag(CC,[VA2,IS])=1;dag(FC,[VA1,FS])=1;dag(PC,[VA3,PS])=1;
    dag(V5,[IS,FS,PS])=1;

    discrete_nodes=1:N;
    node_sizes=2*ones(1,N);
    bnet=mk_bnet(dag,node_sizes,'names',{'V1','V2','AH1','AH2','V3','V4','ES','HMI','CC','FC','PC','V5','VA2','IS','VA1','FS','VA3','PS'},'discrete',discrete_nodes);%���屴Ҷ˹���� 

%% ÿ���ڵ������������ʷֲ���CPD������ÿ���ڵ��ڸ����丸�ڵ������µ���������   
    bnet.CPD{V1}=tabular_CPD(bnet,V1,[0.61 0.39]);
    bnet.CPD{V2}=tabular_CPD(bnet,V2,[0.7 0.3]);
    bnet.CPD{V3}=tabular_CPD(bnet,V3,[0.66 0.34]);bnet.CPD{V4}=tabular_CPD(bnet,V4,[0.73 0.27]);
    bnet.CPD{V5}=tabular_CPD(bnet,V5,[0.7 0.3]);
    bnet.CPD{AH1}=tabular_CPD(bnet,AH1,[0.9 0.05 0.1 0.95]);
    bnet.CPD{AH2}=tabular_CPD(bnet,AH2,[0.9 0.05 0.05 0.02 0.1 0.95 0.95 0.98]);
    bnet.CPD{ES}=tabular_CPD(bnet,ES,[0.99 0.7 0.7 0.5 0.3 0.2 0.2 0.02 0.01 0.3 0.3 0.5 0.7 0.8 0.8 0.98]);
    bnet.CPD{HMI}=tabular_CPD(bnet,HMI,[0.99 0.7 0.7 0.5 0.3 0.2 0.2 0.02 0.01 0.3 0.3 0.5 0.7 0.8 0.8 0.98]);
    bnet.CPD{CC}=tabular_CPD(bnet,CC,[0.99 0.85 0.85 0.6 0.01 0.15 0.15 0.4]);
    bnet.CPD{FC}=tabular_CPD(bnet,FC,[0.99 0.85 0.85 0.6 0.01 0.15 0.15 0.4]);
    bnet.CPD{PC}=tabular_CPD(bnet,PC,[0.99 0.85 0.85 0.6 0.01 0.15 0.15 0.4]);
    bnet.CPD{VA2}=tabular_CPD(bnet,VA2,[0.98 0.5 0.02 0.5]);
    bnet.CPD{VA1}=tabular_CPD(bnet,VA1,[0.98 0.5 0.02 0.5]);
    bnet.CPD{VA3}=tabular_CPD(bnet,VA3,[0.98 0.5 0.02 0.5]);
    bnet.CPD{IS}=tabular_CPD(bnet,IS,[0.98 0.6 0.5 0.1 0.02 0.4 0.5 0.9]);
    bnet.CPD{FS}=tabular_CPD(bnet,FS,[0.98 0.6 0.5 0.1 0.02 0.4 0.5 0.9]);
    bnet.CPD{PS}=tabular_CPD(bnet,PS,[0.98 0.6 0.5 0.1 0.02 0.4 0.5 0.9]);


    %�ʲ�ֵ
    asset=asset_caculation();
    tmpMax = max(asset);
    tmpMin = min(asset);
    for i =1:length(asset)
        asset_norm(i)=1+4*(asset(i)-tmpMin)/(tmpMax-tmpMin);%��һ��
    end


    %%%%  ������Ҷ˹��  %%%%

    need_node={AH1,AH2,ES,HMI,CC,FC,PC,IS,PS,FS,VA1,VA2,VA3}; %��Ҫ������豸�б�
    engine = jtree_inf_engine(bnet);    %������������
    
    N=8;
    P=zeros(N,13);
    P_simple=zeros(N,7);
    risk=zeros(1,N);
    for j=1:N
        evidence = cell(1,18);
        if j==1   
            %a1�������������ĸ���
            evidence{V1}=2;
            evidence{AH1}=2;
        end

        if j==2
            %a2�������������ĸ���
            evidence{V1}=2;
            evidence{AH2}=2;
        end

        if j==3
            %a3�������������ĸ���
            evidence{V2}=2;
            evidence{AH2}=2;
        end

        if j==4
            %a4�������������ĸ���
            evidence{V3}=2;
            evidence{ES}=2;
        end

        if j==5
            %a5�������������ĸ���
            evidence{V4}=2;
            evidence{HMI}=2;
        end
        
        if j==6
            %a6�������������ĸ���
            evidence{V5}=2;
            evidence{IS}=2;
        end
 
         if j==7
            %a7�������������ĸ���
            evidence{V5}=2;
            evidence{FS}=2;
        end
        
        if j==8
            %a8�������������ĸ���
            evidence{V5}=2;
            evidence{PS}=2;
        end        
        
        [engine,loglik]=enter_evidence(engine,evidence);%��֤���������������У��������������豸�ڵ�ĸ��ʡ�
        
        %�����豸�ĸ���
        for i = 1:13
            m=marginal_nodes(engine,need_node{i});
            if length(m.T())==1 && evidence{need_node{i}}==1
                P(j,i)=0;
            elseif length(m.T())==1 && evidence{need_node{i}}==2
                P(j,i)=1;
            else
                P(j,i)=m.T(2);
            end
        end

        P_simple(j,:)=[P(j,1:4),P(j,8:10)];
        asset_norm_simple=[asset_norm(1:4),asset_norm(8:10)];
        risk(1,j)=P_simple(j,:)*asset_norm_simple';%�����˷���ֵ����ÿ���豸�ڵ�ĸ��������Ӧ���ʲ�ֵ��ͨ����һ������ʲ�ֵ���ļ�Ȩ���
        
%         risk(1,j)=P(j,:)*asset_norm';
%         risk(1,j)=P(j,:)*asset';
        % disp(P_simple)
    end
end
