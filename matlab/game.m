%%�������ʵ��
clc
clear all          %xxx:��������������б���
close all          %xxx:�ر����д򿪵�ͼ�δ���
%%%%  ���㵱ǰ���� 5��״̬�Ĺ�����Ϊ������� ���������෴  %%%%
%%%%  �����ڹ����������£������ɹ��ĸ���  %%%%
payoffM=attackdefensepay();       %xxx:�����Լ�д�Ĵ��룬����ο�attackdefensepay.m�ļ����õ��������͹����ɹ����ʾ���
% for i=1:2
%     for j =1:7
%         payoffM{i,j} = normalize(payoffM{i,j});
%     end
% end
% 
% %%  ����״̬ ת�Ƹ���  %%%%
% attP=cell(1,7); %��״̬�����ɹ��ĸ���   
% tranP=cell(7,12);  %5��״̬�µ�״̬ת�Ƹ���
% attP{1,1}=successP([1:2,17],1:3);
% attP{1,2}=successP([3:8,18:74],4:7);
% attP{1,3}=successP([3:8,18:74],4:7);
% attP{1,4}=successP([9:10,75],8:9);
% attP{1,5}=successP([11:12,76],10:11);
% attP{1,6}=successP([13:16,77:87],12:16);
% attP{1,7}=successP([13:16,77:87],12:16);
% for i=1:12     %��ʼ��״̬ת�Ƹ���
%     tranP{1,i}=zeros(3,3);
%     tranP{2,i}=zeros(63,4);
%     tranP{3,i}=zeros(63,4);
%     tranP{4,i}=zeros(3,2);
%     tranP{5,i}=zeros(3,2);
%     tranP{6,i}=zeros(15,5);
%     tranP{7,i}=zeros(15,5);
% end 
% [th,tl] = size(attP)
% tranP{1,2}(1:3,1)=attP{1,1}(1:3,1);
% tranP{1,3}(1:3,2:3)=attP{1,1}(1:3,2:3);
% tranP{2,4}(1:63,1)=attP{1,2}(1:63,1);
% tranP{2,5}(1:63,2)=attP{1,2}(1:63,2);
% tranP{2,6}(1:63,3)=attP{1,2}(1:63,3);
% tranP{2,7}(1:63,4)=attP{1,2}(1:63,4);
% tranP{3,4}(1:63,1)=attP{1,3}(1:63,1);
% tranP{3,5}(1:63,2)=attP{1,3}(1:63,2);
% tranP{3,6}(1:63,3)=attP{1,3}(1:63,3);
% tranP{3,7}(1:63,4)=attP{1,3}(1:63,4);
% tranP{4,10}=attP{1,4};%û�����������������Ϊʲôû��������
% tranP{5,8}=attP{1,5};%û�����������������Ϊʲôû��������
% tranP{6,9}(1:15,1)=attP{1,6}(1:15,1);
% tranP{6,11}(1:15,3:4)=attP{1,6}(1:15,3:4);
% tranP{6,12}(1:15,[2,5])=attP{1,6}(1:15,[2,5]);
% tranP{7,9}(1:15,1)=attP{1,7}(1:15,1);
% tranP{7,11}(1:15,3:4)=attP{1,7}(1:15,3:4);
% tranP{7,12}(1:15,[2,5])=attP{1,7}(1:15,[2,5]);
% 
% % attP=cell(1,7); %��״̬�����ɹ��ĸ��� .xxx:��Ϊֻ��ǰ�߸�״̬�¹����������ǿգ�����������1*7��С  
% % tranP=cell(7,12);  %״̬ת�Ƹ��ʡ�xxx:���ڹ���������״̬��7����ÿ��״̬����ת�������������ܵ�12��״̬��������7*12
% % attP{1,1}=successP(1:4,1:3);
% % attP{1,2}=successP(5:8,4:5);
% % attP{1,3}=successP(5:8,4:5);  %xxx:�ü���õ��Ĺ����ɹ����ʾ����ʼ�� �����ɹ����ʣ��������ֺ������������
% % attP{1,4}=successP(9:11,6:8);%��һλ���Ƿ����ֶΣ��ڶ�λ��������ǹ����ֶ�
% % attP{1,5}=successP([5,6],4);%����������9-11����������е㲻һ��
% % for i=1:8     %��ʼ��״̬ת�Ƹ���stochpM_attack��xxx:�����ǹ����ֶ�9����a9��Ҳ�����Ƿ����ֶ�12��Ҳ����d12
% %     tranP{1,i}=zeros(4,3);  %xxx:����zeros�ĵ�һλ���Ƿ����ֶΣ��ڶ�λ��������ǹ����ֶ�
% %     tranP{2,i}=zeros(4,2);
% %     tranP{3,i}=zeros(4,2);  %xxx:zeros����ֵ������attP{}=successP������successP��ֵ��ͬ��e.g.1:4,1:3,����4��3��5:8,4:5,����4,2
% %     tranP{4,i}=zeros(3,3);
% %     tranP{5,i}=zeros(2,1);
% %     
% % end
% % 
% % %�����ʽ���Ǹ��ݹ����ߵĲ���״̬ת��ͼ�ã�P129��ע�����ɹ�������������ת�䣬�����ǹ�������������䣬��ÿ��״̬��Ӧ�ķ������Ը������䣩
% % tranP{1,2}(1:4,1)=attP{1,1}(1:4,1);%��ʾ״̬һת�Ƶ�״̬���ĸ������ĸ��������Ժ�һ������a1��ɵ�
% % tranP{1,3}(1:4,2:3)=attP{1,1}(1:4,2:3);%��ʾ״̬һת�Ƶ�״̬���ĸ������ĸ��������Ժ���������a2,a3��ɵ�
% % tranP{2,4}(1:4,1)=attP{1,2}(1:4,1);%��ʾ״̬��ת�Ƶ�״̬�ĵĸ������ĸ��������Ժ�һ������a4��ɵ�
% % tranP{2,5}(1:4,2)=attP{1,2}(1:4,2);
% % tranP{3,4}(1:4,1)=attP{1,3}(1:4,1);
% % tranP{3,5}(1:4,2)=attP{1,2}(1:4,2);
% % tranP{4,6}(1:3,1)=attP{1,4}(1:3,1);
% % tranP{4,7}(1:3,2)=attP{1,4}(1:3,2);
% % tranP{4,8}(1:3,3)=attP{1,4}(1:3,3);
% % tranP{5,4}=attP{1,5};

%%  ��ʼ�� ���� ����  %%%%   xxx:����5�д����������Ϊ10����Ϊ�������õĵ�������������10��ÿ�д洢��ֵ��ÿ�ε�����ֵ��
nashEqbm=cell(10,7);  %��ϲ��Լ��ϣ�xxx:�˴���Ϊ5����Ϊ��5���ᱻ������״̬�����Զ�Ӧ5����ϲ���
value_attack=zeros(10,12);    %�����������棨������������
value_defense=zeros(10,12);    %�����������棨������������
stochpM_attack=cell(10,7);   %������ĸ�״̬������󣨹���������xxx:�˴���5��ָ5��״̬S1-S5����Ϊ��cell���ͣ�����ÿ����ʵ���ܴ�һ��value_attack
stochpM_defense=cell(10,7);   %������ĸ�״̬������󣨷�������

%value_attack(1,1:8)=[0,0,0,0,0,0,0,0];  
% value_attack(1,1:8)=zeros(1,8);
% value_defense(1,1:8)=[0,0,0,0,0,0,0,0];  

value_attack(1,1:12)=[0,0,0,0,0,0,0,0,0,0,0,0];  
value_defense(1,1:12)=[0,0,0,0,0,0,0,0,0,0,0,0];  
for j=1:10
    for i=1:7
        stochpM_attack{j,i}=payoffM{1,i};%������
        stochpM_defense{j,i}=payoffM{2,i};%������
    end
end

choose = 2;%1��������ģ�2�Ǿ�̬����

if choose ==1
    loop=1;  %������������֮һ

    %%%  ��ʼ����  %%%%
    while 1

        for j=1:7          %ÿһ��״̬
            for i=1:12       %�����״̬���������������
                stochpM_attack{loop,j}=stochpM_attack{loop,j}+0.9*tranP{j,i}*value_attack(loop,i);
                stochpM_defense{loop,j}=stochpM_defense{loop,j}+0.9*tranP{j,i}*value_defense(loop,i);
            end
            [value_attack(loop+1,j),value_defense(loop+1,j),nashEqbm{loop,j}]=nonzerogame(stochpM_attack{loop,j},stochpM_defense{loop,j});
        end                           

        if loop>9
            break;
        end

        loop=loop+1;

    end
else
    loop=10;
    for j=1:7           %ÿһ��״̬
        %stochpM_attack{loop,j}=stochpM_attack{loop,j}+0.9*tranP{j,i}*value_attack(loop,i);
        %stochpM_defense{loop,j}=stochpM_defense{loop,j}+0.9*tranP{j,i}*value_defense(loop,i);
        [value_attack(loop,j),value_defense(loop,j),nashEqbm{loop,j}]=nonzerogame(stochpM_attack{loop,j},stochpM_defense{loop,j});
    end                           
end

disp(loop);
% %%�ж����Ǽ�����Ľ������
% optM=stochpM_attack{5,1};optatt=nashEqbm{4,1}{2,1};optdef=nashEqbm{4,1}{1,1};
% optpay=value_attack(4,1);
% matt=zeros(3,100);mdef=zeros(4,100);mpay=zeros(1,100);
% Aimmpay=zeros(1,100);Dimmpay=zeros(1,100);
% for j=1:100
%     ma=rand(1,3);
%     md=rand(1,4);
%     na=0;
%     nd=0;
%    for i=1:3
%         na=na+ma(i);
%    end
%    for i=1:4
%         nd=nd+md(i);
%    end
%    for i=1:3
%         matt(i,j)=ma(i)/na;
%    end
%    for i=1:4
%         mdef(i,j)=md(i)/nd;
%    end
%    mpay(j)=optpay;
%    Aimmpay(j)=sum(sum((optdef*matt(:,j).').*optM))-2*rand(1);
%    Dimmpay(j)=sum(sum((mdef(:,j)*optatt.').*optM));
% end
% 
% i=1:100;
% plot(i,mpay,'LineWidth',1);
% grid on
% hold on
% plot(i,Dimmpay,'+r','LineWidth',1);
% plot(i,Aimmpay,'*b','LineWidth',1);
% 
% xlabel('test number','FontSize',14);
% ylabel('Value(S1)','FontSize',14);
% % 
% % ylim([10,18]);

%% ��������ͼʾ
S1=[nashEqbm{10,1}{1}];%�� nashEqbm{10,1} �л�ȡ���һ��Ԫ�أ������������� 0 ������������Ϊ�޲����Ĳ��Զ���0���ʣ�֮ǰ���ʱ��û���ǽ�ȥ������Ϊ�˻�ͼ����Ҫ��
S2=[nashEqbm{10,2}{1}];
S4=[nashEqbm{10,4}{1}];
S5=[nashEqbm{10,5}{1}];
S6=[nashEqbm{10,6}{1}];
% 
% subplot(2,3,1)
% b1=bar(S1,0.5)
% set(gca,'XTickLabel',{'d_1','d_2','{d1d2}'});%�� x ��̶ȱ�ǩ����Ϊ 'd_1'��'d_2'��'d_3'��'d_4' �� 'd_{12}'����Щ��ǩ���� x ���ϵĲ�ͬ״̬�����gca ��һ�����������ڻ�ȡ��ǰͼ�ε������ᣨaxis������
% xlabel('״̬S_1�ķ�������','FontSize',10,'FontName','����');
% ylabel('ѡ�з������Ը���','FontSize',10,'FontName','����');%���� y ���ǩΪ '����'�������СΪ 10����������Ϊ '����'��
% ylim([0,1])%������ y ��ķ�Χ�� 0 �� 1��ȷ�� y �Ḳ���˸��ʵķ�Χ��
% for i = 1:3
%     text(i-0.3,S1(i)+0.05,num2str(S1(i),'%.2f'),'fontsize',8);
%     %������ı���ע��
%     %�����ı�������ÿ�������Ϸ�����ʾ��S1��������ӦԪ�ص���ֵ����ȷ��С�������λ��
%     %fontsize �����������ı��������СΪ 8��
% end
% 
% %a= {'d_3','d_4','d_5','d_6','d_7','d_8','d3d4','d3d5','d3d6','d3d7','d3d8','d4d5','d4d6','d4d7','d4d8','d5d6','d5d7','d5d8','d6d7','d6d8','d7d8','d3d4d5','d3d4d6','d3d4d7','d3d4d8','d3d5d6','d3d5d7','d3d5d8','d3d6d7','d3d6d8','d3d7d8','d4d5d6','d4d5d7','d4d5d8','d4d6d7','d4d6d8','d4d7d8','d5d6d7','d5d6d8','d5d7d8','d6d7d8','d3d4d5d6','d3d4d5d7','d3d4d5d8','d3d4d6d7','d3d4d6d8','d3d4d7d8','d3d5d6d7','d3d5d6d8','d3d5d7d8','d3d6d7d8','d4d5d6d7','d4d5d6d8','d4d5d7d8','d4d6d7d8','d5d6d7d8','d3d4d5d6d7','d3d4d5d6d8','d3d4d5d7d8','d3d4d6d7d8','d3d5d6d7d8','d4d5d6d7d8','d3d4d5d6d7d8'}
% subplot(2,3,2)
% b2=bar(S2,0.5)
% set(gca,'XTickLabel',{'d_3','d_4','d_5','d_6','d_7','d_8','d3d4','d3d5','d3d6','d3d7','d3d8','d4d5','d4d6','d4d7','d4d8','d5d6','d5d7','d5d8','d6d7','d6d8','d7d8','d3d4d5','d3d4d6','d3d4d7','d3d4d8','d3d5d6','d3d5d7','d3d5d8','d3d6d7','d3d6d8','d3d7d8','d4d5d6','d4d5d7','d4d5d8','d4d6d7','d4d6d8','d4d7d8','d5d6d7','d5d6d8','d5d7d8','d6d7d8','d3d4d5d6','d3d4d5d7','d3d4d5d8','d3d4d6d7','d3d4d6d8','d3d4d7d8','d3d5d6d7','d3d5d6d8','d3d5d7d8','d3d6d7d8','d4d5d6d7','d4d5d6d8','d4d5d7d8','d4d6d7d8','d5d6d7d8','d3d4d5d6d7','d3d4d5d6d8','d3d4d5d7d8','d3d4d6d7d8','d3d5d6d7d8','d4d5d6d7d8','d3d4d5d6d7d8'});
% xlabel('״̬S_2��S_3�ķ�������','FontSize',10,'FontName','����');
% ylabel('ѡ�з������Ը���','FontSize',10,'FontName','����');
% ylim([0,1])
% for i = 1:63
%     text(i-0.3,S2(i)+0.05,num2str(S2(i),'%.2f'),'fontsize',8);
% end
% 
% subplot(2,3,3)
% b4=bar(S4,0.5)
% set(gca,'XTickLabel',{'d_{9}','d_{10}','d9d10'});
% xlabel('״̬S_4�ķ�������','FontSize',10,'FontName','����');
% ylabel('ѡ�з������Ը���','FontSize',10,'FontName','����');
% ylim([0,1])
% for i = 1:3
%     text(i-0.3,S4(i)+0.05,num2str(S4(i),'%.2f'),'fontsize',8);
% end
% 
% subplot(2,3,4)
% b5=bar(S5,0.5)
% set(gca,'XTickLabel',{'d_{11}','d_{12}','d11d12'});
% xlabel('״̬S_5�ķ�������','FontSize',10,'FontName','����');
% ylabel('ѡ�з������Ը���','FontSize',10,'FontName','����');
% ylim([0,1])
% for i = 1:2
%     text(i-0.3,S5(i)+0.05,num2str(S5(i),'%.2f'),'fontsize',8);
% end

%b = {'d_{13}','d_{14}','d_{15}','d_{16}','d13d14','d13d15','d13d16','d14d15','d14d16','d15d16','d13d14d15','d13d14d16','d13d15d16','d14d15d16','d13d14d15d16'}
% {'d_{13}','d_{14}','d_{15}','d_{16}','d13d14','d13d15','d13d16','d14d15','d14d16','d15d16','d13d14d15','d13d14d16','d13d15d16','d14d15d16','d13d14d15d16'}
% subplot(2,3,5)
% S6=[0;0.204081632653061;0;0.265306122448980;0.163265306122449;0;0;0;0.183673469387755;0;0;0;0;0.183673469387755;0;0];
% set(gca,'XTickLabel',{'d13d14d15d16','d13d14d15','d13d14d16','d13d15d16','d14d15d16','d13d14','d13d15','d13d16','d14d15','d14d16','d15d16','d13','d14','d15','d16'});
% xticklabels({'d13d14d15d16','d13d14d15','d13d14d16','d13d15d16','d14d15d16','d13d14','d13d15','d13d16','d14d15','d14d16','d15d16','d13','d14','d15','d16'});
totalp = 0;
% TNAME = {'{d13d14d15d16}','{d13d14d15}','{d13d14d16}','{d13d15d16}','{d14d15d16}','{d13d14}','{d13d15}','{d13d16}','{d14d15}','{d14d16}','{d15d16}','{d13}','{d14}','{d15}','{d16}'};
TNAME = {'{d13d14d15d16}','D_{11}D_{12}D_{13}','{d13d14d16}','{d13d15d16}','{d14d15d16}','D_{11}D_{12}','D_{11}D_{13}','D_{11}D_{14}','D_{12}D_{13}','{d14d16}','{d15d16}','D_{11}','D_{12}','D_{13}','D_{14}'};
% T = TNAME(1);
sname={};
S7 = [];
for i = 1:15
    if S6(i) > 0
        totalp = totalp+1;
        S7 = [S7,S6(i)];
        sname = [sname,TNAME(i)];
    end
end

b5=bar(S7,0.5)
set(gca, 'XTickLabel', sname);
xlabel('defense strategy in state s6','FontSize',15,'FontName','����');
ylabel('strategy selection probability','FontSize',15,'FontName','����');
ylim([0,1])
for i = 1:totalp
%     text(i-0.3,S6(i)+0.05,num2str(S6(i),'%.2f'),'fontsize',8);
    text(i-0.15,S7(i)+0.02,num2str(S7(i),'%.2f'),'fontsize',8);
end


% S1=[nashEqbm{10,1}{1};0];%�� nashEqbm{10,1} �л�ȡ���һ��Ԫ�أ������������� 0 ������������Ϊ�޲����Ĳ��Զ���0���ʣ�֮ǰ���ʱ��û���ǽ�ȥ������Ϊ�˻�ͼ����Ҫ��
% S2=[nashEqbm{10,2}{1};0];
% S4=[nashEqbm{10,4}{1};0];
% S5=[nashEqbm{10,5}{1};0];
% 
% subplot(2,2,1)
% b1=bar(S1,0.5)
% set(gca,'XTickLabel',{'d_1','d_2','d_3','d_4','d_{12}'});
% xlabel('״̬S_1�ķ�������','FontSize',10,'FontName','����');
% ylabel('����','FontSize',10,'FontName','����');
% ylim([0,1])
% for i = 1:5
%     text(i-0.3,S1(i)+0.05,num2str(S1(i),'%.2f'),'fontsize',8);
% end
% 
% subplot(2,2,2)
% b2=bar(S2,0.5)
% set(gca,'XTickLabel',{'d_5','d_6','d_7','d_8','d_{12}'});
% xlabel('״̬S_2��S_3�ķ�������','FontSize',10,'FontName','����');
% ylabel('����','FontSize',10,'FontName','����');
% ylim([0,1])
% for i = 1:5
%     text(i-0.3,S2(i)+0.05,num2str(S2(i),'%.2f'),'fontsize',8);
% end
% 
% subplot(2,2,3)
% b4=bar(S4,0.5)
% set(gca,'XTickLabel',{'d_{9}','d_{10}','d_{11}','d_{12}'});
% xlabel('״̬S_4�ķ�������','FontSize',10,'FontName','����');
% ylabel('����','FontSize',10,'FontName','����');
% ylim([0,1])
% for i = 1:4
%     text(i-0.3,S4(i)+0.05,num2str(S4(i),'%.2f'),'fontsize',8);
% end
% 
% subplot(2,2,4)
% b5=bar(S5,0.5)
% set(gca,'XTickLabel',{'d_5','d_6','d_{12}'});
% xlabel('״̬S_5�ķ�������','FontSize',10,'FontName','����');
% ylabel('����','FontSize',10,'FontName','����');
% ylim([0,1])
% for i = 1:3
%     text(i-0.3,S5(i)+0.05,num2str(S5(i),'%.2f'),'fontsize',8);
% end