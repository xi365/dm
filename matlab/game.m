%%随机博弈实验
clc
clear all          %xxx:清除工作区的所有变量
close all          %xxx:关闭所有打开的图形窗口
%%%%  计算当前问题 5个状态的攻击行为收益矩阵 防御与其相反  %%%%
%%%%  计算在攻防动作集下，攻击成功的概率  %%%%
payoffM=attackdefensepay();       %xxx:这是自己写的代码，详情参考attackdefensepay.m文件，得到收益矩阵和攻击成功概率矩阵
% for i=1:2
%     for j =1:7
%         payoffM{i,j} = normalize(payoffM{i,j});
%     end
% end
% 
% %%  计算状态 转移概率  %%%%
% attP=cell(1,7); %各状态攻击成功的概率   
% tranP=cell(7,12);  %5个状态下的状态转移概率
% attP{1,1}=successP([1:2,17],1:3);
% attP{1,2}=successP([3:8,18:74],4:7);
% attP{1,3}=successP([3:8,18:74],4:7);
% attP{1,4}=successP([9:10,75],8:9);
% attP{1,5}=successP([11:12,76],10:11);
% attP{1,6}=successP([13:16,77:87],12:16);
% attP{1,7}=successP([13:16,77:87],12:16);
% for i=1:12     %初始化状态转移概率
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
% tranP{4,10}=attP{1,4};%没明白这个参数，后面为什么没有行列了
% tranP{5,8}=attP{1,5};%没明白这个参数，后面为什么没有行列了
% tranP{6,9}(1:15,1)=attP{1,6}(1:15,1);
% tranP{6,11}(1:15,3:4)=attP{1,6}(1:15,3:4);
% tranP{6,12}(1:15,[2,5])=attP{1,6}(1:15,[2,5]);
% tranP{7,9}(1:15,1)=attP{1,7}(1:15,1);
% tranP{7,11}(1:15,3:4)=attP{1,7}(1:15,3:4);
% tranP{7,12}(1:15,[2,5])=attP{1,7}(1:15,[2,5]);
% 
% % attP=cell(1,7); %各状态攻击成功的概率 .xxx:因为只有前七个状态下攻击动作集非空，所以设置了1*7大小  
% % tranP=cell(7,12);  %状态转移概率。xxx:存在攻击动作的状态有7个，每个状态都能转变包含它自身可能的12种状态，所以是7*12
% % attP{1,1}=successP(1:4,1:3);
% % attP{1,2}=successP(5:8,4:5);
% % attP{1,3}=successP(5:8,4:5);  %xxx:用计算得到的攻击成功概率矩阵初始化 攻击成功概率，具体数字含义待定。。。
% % attP{1,4}=successP(9:11,6:8);%第一位数是防御手段，第二位数代表的是攻击手段
% % attP{1,5}=successP([5,6],4);%论文里面是9-11，和这里的有点不一样
% % for i=1:8     %初始化状态转移概率stochpM_attack，xxx:不考虑攻击手段9，即a9，也不考虑防御手段12，也就是d12
% %     tranP{1,i}=zeros(4,3);  %xxx:所以zeros的第一位数是防御手段，第二位数代表的是攻击手段
% %     tranP{2,i}=zeros(4,2);
% %     tranP{3,i}=zeros(4,2);  %xxx:zeros的数值与上面attP{}=successP（）的successP数值相同，e.g.1:4,1:3,就是4，3；5:8,4:5,就是4,2
% %     tranP{4,i}=zeros(3,3);
% %     tranP{5,i}=zeros(2,1);
% %     
% % end
% % 
% % %这里的式子是根据攻击者的博弈状态转移图得，P129（注：是由攻击策略引发的转变，所以是攻击策略数量会变，但每个状态对应的防御策略个数不变）
% % tranP{1,2}(1:4,1)=attP{1,1}(1:4,1);%表示状态一转移到状态二的概率是四个防御策略和一个攻击a1组成的
% % tranP{1,3}(1:4,2:3)=attP{1,1}(1:4,2:3);%表示状态一转移到状态三的概率是四个防御策略和两个攻击a2,a3组成的
% % tranP{2,4}(1:4,1)=attP{1,2}(1:4,1);%表示状态二转移到状态四的概率是四个防御策略和一个攻击a4组成的
% % tranP{2,5}(1:4,2)=attP{1,2}(1:4,2);
% % tranP{3,4}(1:4,1)=attP{1,3}(1:4,1);
% % tranP{3,5}(1:4,2)=attP{1,2}(1:4,2);
% % tranP{4,6}(1:3,1)=attP{1,4}(1:3,1);
% % tranP{4,7}(1:3,2)=attP{1,4}(1:3,2);
% % tranP{4,8}(1:3,3)=attP{1,4}(1:3,3);
% % tranP{5,4}=attP{1,5};

%%  初始化 迭代 参数  %%%%   xxx:下面5行代码的行设置为10，因为本文设置的迭代次数最大就是10，每行存储的值是每次迭代的值。
nashEqbm=cell(10,7);  %混合策略集合，xxx:此处列为5是因为有5个会被攻击的状态，所以对应5个混合策略
value_attack=zeros(10,12);    %博弈期望收益（攻击方）集合
value_defense=zeros(10,12);    %博弈期望收益（防御方）集合
stochpM_attack=cell(10,7);   %随机博弈各状态收益矩阵（攻击方），xxx:此处的5是指5个状态S1-S5，因为是cell类型，所以每个其实都能存一个value_attack
stochpM_defense=cell(10,7);   %随机博弈各状态收益矩阵（防御方）

%value_attack(1,1:8)=[0,0,0,0,0,0,0,0];  
% value_attack(1,1:8)=zeros(1,8);
% value_defense(1,1:8)=[0,0,0,0,0,0,0,0];  

value_attack(1,1:12)=[0,0,0,0,0,0,0,0,0,0,0,0];  
value_defense(1,1:12)=[0,0,0,0,0,0,0,0,0,0,0,0];  
for j=1:10
    for i=1:7
        stochpM_attack{j,i}=payoffM{1,i};%攻击方
        stochpM_defense{j,i}=payoffM{2,i};%防御方
    end
end

choose = 2;%1是随机博弈，2是静态博弈

if choose ==1
    loop=1;  %迭代结束条件之一

    %%%  开始迭代  %%%%
    while 1

        for j=1:7          %每一个状态
            for i=1:12       %计算各状态攻击方的收益矩阵
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
    for j=1:7           %每一个状态
        %stochpM_attack{loop,j}=stochpM_attack{loop,j}+0.9*tranP{j,i}*value_attack(loop,i);
        %stochpM_defense{loop,j}=stochpM_defense{loop,j}+0.9*tranP{j,i}*value_defense(loop,i);
        [value_attack(loop,j),value_defense(loop,j),nashEqbm{loop,j}]=nonzerogame(stochpM_attack{loop,j},stochpM_defense{loop,j});
    end                           
end

disp(loop);
% %%判断我们计算出的结果最优
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

%% 防御策略图示
S1=[nashEqbm{10,1}{1}];%从 nashEqbm{10,1} 中获取其第一个元素，并将它与数字 0 连接起来，因为无操作的策略都是0概率，之前求解时候没考虑进去，现在为了画图所以要加
S2=[nashEqbm{10,2}{1}];
S4=[nashEqbm{10,4}{1}];
S5=[nashEqbm{10,5}{1}];
S6=[nashEqbm{10,6}{1}];
% 
% subplot(2,3,1)
% b1=bar(S1,0.5)
% set(gca,'XTickLabel',{'d_1','d_2','{d1d2}'});%将 x 轴刻度标签设置为 'd_1'、'd_2'、'd_3'、'd_4' 和 'd_{12}'。这些标签代表 x 轴上的不同状态或类别。gca 是一个函数，用于获取当前图形的坐标轴（axis）对象
% xlabel('状态S_1的防御策略','FontSize',10,'FontName','宋体');
% ylabel('选中防御策略概率','FontSize',10,'FontName','宋体');%设置 y 轴标签为 '概率'，字体大小为 10，字体名称为 '宋体'。
% ylim([0,1])%设置了 y 轴的范围从 0 到 1，确保 y 轴覆盖了概率的范围。
% for i = 1:3
%     text(i-0.3,S1(i)+0.05,num2str(S1(i),'%.2f'),'fontsize',8);
%     %添加了文本标注。
%     %它将文本放置在每个柱子上方，显示了S1数组中相应元素的数值，精确到小数点后两位。
%     %fontsize 参数设置了文本的字体大小为 8。
% end
% 
% %a= {'d_3','d_4','d_5','d_6','d_7','d_8','d3d4','d3d5','d3d6','d3d7','d3d8','d4d5','d4d6','d4d7','d4d8','d5d6','d5d7','d5d8','d6d7','d6d8','d7d8','d3d4d5','d3d4d6','d3d4d7','d3d4d8','d3d5d6','d3d5d7','d3d5d8','d3d6d7','d3d6d8','d3d7d8','d4d5d6','d4d5d7','d4d5d8','d4d6d7','d4d6d8','d4d7d8','d5d6d7','d5d6d8','d5d7d8','d6d7d8','d3d4d5d6','d3d4d5d7','d3d4d5d8','d3d4d6d7','d3d4d6d8','d3d4d7d8','d3d5d6d7','d3d5d6d8','d3d5d7d8','d3d6d7d8','d4d5d6d7','d4d5d6d8','d4d5d7d8','d4d6d7d8','d5d6d7d8','d3d4d5d6d7','d3d4d5d6d8','d3d4d5d7d8','d3d4d6d7d8','d3d5d6d7d8','d4d5d6d7d8','d3d4d5d6d7d8'}
% subplot(2,3,2)
% b2=bar(S2,0.5)
% set(gca,'XTickLabel',{'d_3','d_4','d_5','d_6','d_7','d_8','d3d4','d3d5','d3d6','d3d7','d3d8','d4d5','d4d6','d4d7','d4d8','d5d6','d5d7','d5d8','d6d7','d6d8','d7d8','d3d4d5','d3d4d6','d3d4d7','d3d4d8','d3d5d6','d3d5d7','d3d5d8','d3d6d7','d3d6d8','d3d7d8','d4d5d6','d4d5d7','d4d5d8','d4d6d7','d4d6d8','d4d7d8','d5d6d7','d5d6d8','d5d7d8','d6d7d8','d3d4d5d6','d3d4d5d7','d3d4d5d8','d3d4d6d7','d3d4d6d8','d3d4d7d8','d3d5d6d7','d3d5d6d8','d3d5d7d8','d3d6d7d8','d4d5d6d7','d4d5d6d8','d4d5d7d8','d4d6d7d8','d5d6d7d8','d3d4d5d6d7','d3d4d5d6d8','d3d4d5d7d8','d3d4d6d7d8','d3d5d6d7d8','d4d5d6d7d8','d3d4d5d6d7d8'});
% xlabel('状态S_2和S_3的防御策略','FontSize',10,'FontName','宋体');
% ylabel('选中防御策略概率','FontSize',10,'FontName','宋体');
% ylim([0,1])
% for i = 1:63
%     text(i-0.3,S2(i)+0.05,num2str(S2(i),'%.2f'),'fontsize',8);
% end
% 
% subplot(2,3,3)
% b4=bar(S4,0.5)
% set(gca,'XTickLabel',{'d_{9}','d_{10}','d9d10'});
% xlabel('状态S_4的防御策略','FontSize',10,'FontName','宋体');
% ylabel('选中防御策略概率','FontSize',10,'FontName','宋体');
% ylim([0,1])
% for i = 1:3
%     text(i-0.3,S4(i)+0.05,num2str(S4(i),'%.2f'),'fontsize',8);
% end
% 
% subplot(2,3,4)
% b5=bar(S5,0.5)
% set(gca,'XTickLabel',{'d_{11}','d_{12}','d11d12'});
% xlabel('状态S_5的防御策略','FontSize',10,'FontName','宋体');
% ylabel('选中防御策略概率','FontSize',10,'FontName','宋体');
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
xlabel('defense strategy in state s6','FontSize',15,'FontName','宋体');
ylabel('strategy selection probability','FontSize',15,'FontName','宋体');
ylim([0,1])
for i = 1:totalp
%     text(i-0.3,S6(i)+0.05,num2str(S6(i),'%.2f'),'fontsize',8);
    text(i-0.15,S7(i)+0.02,num2str(S7(i),'%.2f'),'fontsize',8);
end


% S1=[nashEqbm{10,1}{1};0];%从 nashEqbm{10,1} 中获取其第一个元素，并将它与数字 0 连接起来，因为无操作的策略都是0概率，之前求解时候没考虑进去，现在为了画图所以要加
% S2=[nashEqbm{10,2}{1};0];
% S4=[nashEqbm{10,4}{1};0];
% S5=[nashEqbm{10,5}{1};0];
% 
% subplot(2,2,1)
% b1=bar(S1,0.5)
% set(gca,'XTickLabel',{'d_1','d_2','d_3','d_4','d_{12}'});
% xlabel('状态S_1的防御策略','FontSize',10,'FontName','宋体');
% ylabel('概率','FontSize',10,'FontName','宋体');
% ylim([0,1])
% for i = 1:5
%     text(i-0.3,S1(i)+0.05,num2str(S1(i),'%.2f'),'fontsize',8);
% end
% 
% subplot(2,2,2)
% b2=bar(S2,0.5)
% set(gca,'XTickLabel',{'d_5','d_6','d_7','d_8','d_{12}'});
% xlabel('状态S_2和S_3的防御策略','FontSize',10,'FontName','宋体');
% ylabel('概率','FontSize',10,'FontName','宋体');
% ylim([0,1])
% for i = 1:5
%     text(i-0.3,S2(i)+0.05,num2str(S2(i),'%.2f'),'fontsize',8);
% end
% 
% subplot(2,2,3)
% b4=bar(S4,0.5)
% set(gca,'XTickLabel',{'d_{9}','d_{10}','d_{11}','d_{12}'});
% xlabel('状态S_4的防御策略','FontSize',10,'FontName','宋体');
% ylabel('概率','FontSize',10,'FontName','宋体');
% ylim([0,1])
% for i = 1:4
%     text(i-0.3,S4(i)+0.05,num2str(S4(i),'%.2f'),'fontsize',8);
% end
% 
% subplot(2,2,4)
% b5=bar(S5,0.5)
% set(gca,'XTickLabel',{'d_5','d_6','d_{12}'});
% xlabel('状态S_5的防御策略','FontSize',10,'FontName','宋体');
% ylabel('概率','FontSize',10,'FontName','宋体');
% ylim([0,1])
% for i = 1:3
%     text(i-0.3,S5(i)+0.05,num2str(S5(i),'%.2f'),'fontsize',8);
% end