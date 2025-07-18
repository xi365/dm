%%%%  计算当前问题 5个状态的攻击行为收益矩阵 防御与其相反  %%%%
%%%%  计算在攻防动作集下，攻击成功的概率  %%%%
function payoffM = attackdefensepay()
    attackcost=[0.185,0,0.370,0.240,0.055,0.018,0.055,0.240,0.092,0.296,1,3,7,4,5,6];
    defensecost=[0.044,0.117,0.338,0.132,0.117,0.264,0.176,1,0.426,1,0,0.264,9,8.8,8.2,8.7,  0.15,0.22,0.22,0.32,  0.42,0.82,0.22,0.32,0.42,0.82,0.32,0.42,0.82,0.44,    0.84,0.86,0.24,0.34,0.44,0.86,0.34,0.44,0.86,0.46,    0.86,0.87,0.34,0.44,0.84,0.45,0.86,0.87,0.45,0.86,     0.87,0.88,0.36,0.46,0.86,0.47,0.86,0.88,0.47,0.87,      0.88,0.89,0.47,0.87,0.88,0.89,0.89,0.5,0.9,0.91,       0.92,0.92,0.92,0.93,0.9,1,8.8,8.6,8.8,8.7,        8.2,8.3,8.6,5,7,8,6];
    onema = ones(1,87);
    Risk = onema-defensecost;

%% 初始化参数
    defense_time = [0.11,0.12,0.20,0.21,0.22,0.45,0.50,1,0.60,2,2,1,0.140,0.120,0.135,0.125];
    attack_time = [0.11,0.12,0.20,0.21,0.22,0.45,0.50,1,0.60,2,2,1,0.140,0.120,0.135,0.125];
    defense_jiggle = [0.5,0.4,0.81,0.7,0.75,0.2,0.3,2,1.5,1,1,2,0.3,0.25,0.20,0.15];
    attack_jiggle = [0.5,0.4,0.81,0.7,0.75,0.2,0.3,2,1.5,1,1,2,0.3,0.25,0.20,0.15];

    calculate_time = 0;
    calculate_jiggle = 0;
    jiggle_ratio =  1;
%% S1
    calculate_time = defense_time(1)+defense_time(2);
    calculate_jiggle = jiggle_ratio*defense_jiggle(1)+jiggle_ratio*defense_jiggle(2);
    defense_time = [defense_time,calculate_time];
    defense_jiggle = [defense_jiggle,calculate_jiggle];
%% S2/S3
    temp_time = defense_time(3:8);
    temp_jiggle = defense_jiggle(3:8);

    sum_time = nchoosek(temp_time,2);
    sum_jiggle = nchoosek(temp_jiggle,2);
    defense_time = [defense_time,sum(sum_time,2)'];
    defense_jiggle = [defense_jiggle,sum(sum_jiggle,2)'];

    sum_time = nchoosek(temp_time,3);
    sum_jiggle = nchoosek(temp_jiggle,3);
    defense_time = [defense_time,sum(sum_time,2)'];
    defense_jiggle = [defense_jiggle,sum(sum_jiggle,2)'];

    sum_time= nchoosek(temp_time,4);
    sum_jiggle = nchoosek(temp_jiggle,4);
    defense_time = [defense_time,sum(sum_time,2)'];
    defense_jiggle = [defense_jiggle,sum(sum_jiggle,2)'];

    sum_time= nchoosek(temp_time,5);
    sum_jiggle = nchoosek(temp_jiggle,5);
    defense_time = [defense_time,sum(sum_time,2)'];
    defense_jiggle = [defense_jiggle,sum(sum_jiggle,2)'];

    sum_time= nchoosek(temp_time,6);
    sum_jiggle = nchoosek(temp_jiggle,6);
    defense_time = [defense_time,sum(sum_time,2)'];
    defense_jiggle = [defense_jiggle,sum(sum_jiggle,2)'];
%% S4
    calculate_time = defense_time(9)+defense_time(10);
    calculate_jiggle = jiggle_ratio*defense_jiggle(9)+jiggle_ratio*defense_jiggle(10);
    defense_time = [defense_time,calculate_time];
    defense_jiggle = [defense_jiggle,calculate_jiggle];
%% S5
    calculate_time = defense_time(11)+defense_time(12);
    calculate_jiggle = jiggle_ratio*defense_jiggle(11)+jiggle_ratio*defense_jiggle(12);
    defense_time = [defense_time,calculate_time];
    defense_jiggle = [defense_jiggle,calculate_jiggle];
%% S6/7
    temp_time = defense_time(13:16);
    temp_jiggle = defense_jiggle(13:16); 
    sum_time = nchoosek(temp_time,2);
    sum_jiggle = nchoosek(temp_jiggle,2);
    defense_time = [defense_time,sum(sum_time,2)'];
    defense_jiggle = [defense_jiggle,sum(sum_jiggle,2)'];
    
    sum_time = nchoosek(temp_time,3);
    sum_jiggle = nchoosek(temp_jiggle,3);
    defense_time = [defense_time,sum(sum_time,2)'];
    defense_jiggle = [defense_jiggle,sum(sum_jiggle,2)'];
    
    sum_time= nchoosek(temp_time,4);
    sum_jiggle = nchoosek(temp_jiggle,4);
    defense_time = [defense_time,sum(sum_time,2)'];
    defense_jiggle = [defense_jiggle,sum(sum_jiggle,2)'];   
    
    %归一化
    tmpMax = max(defense_time);
    tmpMin = min(defense_time);
    for i =1:87
        defense_time(i)=(defense_time(i)-tmpMin)/(tmpMax-tmpMin);%防御时间归一化
    end
    
    tmpMax = max(defense_jiggle);
    tmpMin = min(defense_jiggle);
    for i =1:87
        defense_jiggle(i)=(defense_jiggle(i)-tmpMin)/(tmpMax-tmpMin);%防御抖动归一化
    end
%%  计算攻击收益矩阵  
    A=[1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1];
    B=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];   

    attdefM_attack=[0.2,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,0.1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,1,1,1,1,1,1,        1,1,1,1,1,1,1;                        
                    1,0.1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,0.1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,1,1,1,1,1,1,        1,1,1,1,1,1,1;
                    1,0.1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,0.1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,1,1,1,1,1,1,        1,1,1,1,1,1,1;
                    1,1,1,1,0.1,1,0.1,0.1,1,1, 1,1,1,1,1,1,1,1,0.1,1,  0.2,0,0.2,1,0.2,0,0.2,0.2,0,0.2,   0,0,0.2,1,0.2,0,0.2,0.2,0,0.2,    0,0,0.2,0.2,0,0.2,0,0,0.2,0,     0,0,0.2,0.2,0,0.2,0,0,0.2,0,      0,0,0.2,0,0,0,0,0.2,0,0,       0,0,0,0,1,1,1,1,1,1,        1,1,1,1,1,1,1;
                    1,1,1,0.1,1,1,0.1,0.1,1,1, 1,1,1,1,1,1,1,0.1,1,1,  0.2,0,0.2,0.2,0.2,0,1,0.2,0,0.2,   0,0,0.2,0.2,0.2,0,1,0.2,0,0.2,    0,0,0.2,0.2,0,0.2,0,0,0.2,0,     0,0,0.2,0.2,0,0.2,0,0,0.2,0,      0,0,0.2,0,0,0,0,0.2,0,0,       0,0,0,0,1,1,1,1,1,1,        1,1,1,1,1,1,1;
                    1,1,0.1,1,1,1,0.1,0.1,1,1, 1,1,1,1,1,1,1,0.1,0.1,0.1,  0.2,0,1,1,0.2,0,1,0.2,0,0.2,   0,0,0.2,0.2,0.2,0,0.2,0.2,0,0.2,    0,0,1,0.2,0,0.2,0,0,0.2,0,     0,0,0.2,0.2,0,0.2,0,0,0.2,0,      0,0,0.2,0,0,0,0,0.2,0,0,       0,0,0,0,1,1,1,1,1,1,        1,1,1,1,1,1,1;
                    1,1,1,1,1,1,1,0.1,1,1, 1,1,1,1,1,1,1,1,1,0.1,  1,0,1,0.2,1,0,0.2,1,0,0.2,   0,0,1,0.2,1,0,0.2,1,0,0.2,    0,0,0.2,1,0,0.2,0,0,0.2,0,     0,0,0.2,1,0,0.2,0,0,0.2,0,      0,0,0.2,0,0,0,0,0.2,0,0,       0,0,0,0,1,1,1,1,1,1,        1,1,1,1,1,1,1;
                    1,1,1,1,1,1,1,1,0.1,0.1, 1,1,1,1,1,1,1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,0,1,1,1,1,1,        1,1,1,1,1,1,1;
                    1,1,1,1,1,1,1,1,0.1,0.1, 1,1,1,1,1,1,1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,0,1,1,1,1,1,        1,1,1,1,1,1,1;
                    1,1,1,1,1,1,1,1,1,1, 0.1,0.1,1,1,1,1,1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,1,0,1,1,1,1,        1,1,1,1,1,1,1;
                    1,1,1,1,1,1,1,1,1,1, 0.1,0.1,1,1,1,1,1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,1,0,1,1,1,1,        1,1,1,1,1,1,1;
                    1,1,1,1,1,1,1,1,1,1, 1,1,0.1,0.1,0.1,0.3,1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,1,1,0.1,0.2,0.1,0.1,        0.1,0.1,0.1,0.1,0.1,0.1,0.1;
                    1,1,1,1,1,1,1,1,1,1, 1,1,0.2,0.2,0.1,0.4,1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,1,1,0.1,0.2,0.1,0.1,        0.1,0.1,0.1,0.1,0.1,0.1,0.1;
                    1,1,1,1,1,1,1,1,1,1, 1,1,0.3,0.1,0.2,0.4,1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,1,1,0.1,0.2,0.1,0.1,        0.1,0.1,0.1,0.1,0.1,0.1,0.1;
                    1,1,1,1,1,1,1,1,1,1, 1,1,0.2,0.1,0.3,0.1,1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,1,1,0.1,0.2,0.1,0.1,        0.1,0.1,0.1,0.1,0.1,0.1,0.1;
                    1,1,1,1,1,1,1,1,1,1, 1,1,0.3,0.2,0.1,0.1,1,1,1,1,  1,1,1,1,1,1,1,1,1,1,   1,1,1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,1,1,     1,1,1,1,1,1,1,1,1,1,      1,1,1,1,1,1,1,1,1,1,       1,1,1,1,1,1,0.1,0.2,0.1,0.1,        0.1,0.1,0.1,0.1,0.1,0.1,0.1;
                    ];
    attdefM_attack = attdefM_attack';
    attdefM_defense = -1*attdefM_attack;    
    mask = attdefM_defense ~= 1;
    attdefM_defense(mask) = attdefM_defense(mask) + 1;
    attdefM_defense(attdefM_defense==0) = -1;
    successP=attdefM_attack;    
    successP_defense = attdefM_defense; 
    delay = defense_time.'*attack_time;
    Jitter = defense_jiggle.'*attack_jiggle;
    Time = delay+Jitter;
    Time_known = [    2.3500    1.7500    3.1500    0.1000    0.4500
    1.9500    1.0500    1.4500    1.3500    1.7500
    1.7500    1.1500    2.5500    2.4500    1.8500
    3.0000    0.1000    3.8000    1.7000    1.1000
    4.4500    0.1000    1.7500    1.1500    1.0500
    1.5500    0.1000    2.8500    3.2500    1.6500
    1.4500    1.8500    3.7500    1.1500    0.5500
    3.5000    1.9000    0.8000    0.2000    2.6000
    4.2500    0.1000    1.5500    3.4500    1.3500
    1.7000    2.1000    3.5000    2.9000    0.1000
    4.0500    0.9500    1.3500    0.7500    2.1500
    5.0000    4.0000    2.0000    6.0000    3.0000
    2.0000         0    4.0000    1.0000    3.0000
    1.0000    5.0000    2.0000    4.0000    3.0000
    7.0000    4.0000    6.0000    5.0000    3.0000];
    Time(13:16,12:16) = Time_known(1:4,:);
    Time(77:87,12:16) = Time_known(5:15,:);
    Risk_total = Risk'*B;
    Risk_known = [     8.4500   13.9500   10.4500   11.4000   10.9500
    6.3500   15.5500   11.0500   11.0500   10.5500
    8.0500   13.5500    7.0500   12.0500   12.5500
    8.3000   14.1000   10.3000    9.3000   12.8000
    8.3500   12.6000    9.8500   12.3500   11.3500
    8.7500   14.1000   10.2500   11.7500   10.2500
    7.3500   12.8500    9.8500   10.3500   13.8500
    8.8000   14.3000   10.3000   10.8000   11.3000
    6.5500   13.6000    8.0500   11.0500   13.0500
    7.6000   15.1000    9.6000   10.1000   11.8000
    7.7500   11.7500   10.2500   10.7500   13.2500
    7.3000   11.2000    9.1000    5.0000   11.9000
    6.8000   15.7000    7.6000   13.5000    9.4000
    8.3000   12.2000    8.1000    9.0000   11.9000
    4.8000    9.7000    7.6000    5.5000   10.4000];
    Risk_total(13:16,12:16) = Risk_known(1:4,:);
    Risk_total(77:87,12:16) = Risk_known(5:15,:);
    size(Time)
    payoff_attack=Risk_total + Time - A*attackcost;
    payoff_defense=Risk_total - defensecost.'*B-Time;

%% 7个状态的攻击、防御动作集 16,87  
    attackAct=cell(1,7);defendAct=cell(1,7);
    attackAct{1,1}=[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
    attackAct{1,2}=[0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0];
    attackAct{1,3}=[0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0];
    attackAct{1,4}=[0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0];
    attackAct{1,5}=[0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0];
    attackAct{1,6}=[0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1];
    attackAct{1,7}=[0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1];
    defendAct{1,1}=[1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    defendAct{1,2}=[0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
    defendAct{1,3}=[0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
    defendAct{1,4}=[0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0];
    defendAct{1,5}=[0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0];
    defendAct{1,6}=[0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1];
    defendAct{1,7}=[0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1];

%% 构造7个状态下的初始收益函数矩阵    
    payoffM=cell(2,7);temp=cell(2,7); %2*5,第一行为攻击收益，第二行为防御收益
    for i=1:7
        temp{1,i}=defendAct{1,i}.'*attackAct{1,i}.*payoff_attack;
        temp{2,i}=defendAct{1,i}.'*attackAct{1,i}.*payoff_defense;
    end
    %前面防御，后面攻击
    payoffM{1,1}=temp{1,1}([1:2,17],1:3);  %将状态与攻击动作集对应
    payoffM{1,2}=temp{1,2}([3:8,18:74],4:7);
    payoffM{1,3}=temp{1,3}([3:8,18:74],4:7);
    payoffM{1,4}=temp{1,4}([9:10,75],8:9);
    payoffM{1,5}=temp{1,5}([11:12,76],10:11);
    payoffM{1,6}=temp{1,6}([13:16,77:87],12:16);
    payoffM{1,7}=temp{1,7}([13:16,77:87],12:16);
    
    payoffM{2,1}=temp{2,1}([1:2,17],1:3);  %将状态与攻击动作集对应
    payoffM{2,2}=temp{2,2}([3:8,18:74],4:7);
    payoffM{2,3}=temp{2,3}([3:8,18:74],4:7);
    payoffM{2,4}=temp{2,4}([9:10,75],8:9);
    payoffM{2,5}=temp{2,5}([11:12,76],10:11);
    payoffM{2,6}=temp{2,6}([13:16,77:87],12:16);
    payoffM{2,7}=temp{2,7}([13:16,77:87],12:16);

end