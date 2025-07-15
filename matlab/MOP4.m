%定义自己的函数，输入变量x、s，x是策略数，s是第几个状态
%输出变量z是cost
function z = MOP4(x,s)

    strategy_amount = [2 6 6 2 2 4 4];
    defense_cost = [0.044,0.117,0.338,0.132,0.117,0.264,0.176,1,0.426,1,0,0.264,6,8,7,5];
    accident_value = [0.714,0.572,0.151,1.010,0.725,0.319,0.467,0.779,0.763,1.142,1.142,15,13,14,16,12;];
    risk_assessment = [7 7 8 8 8 5 4 1 3 1 3 3 13 10 15 14];

    if s==1
        usedc = defense_cost(1:2);
        useav = accident_value(1:2);
        usera = risk_assessment(1:2);
    elseif s==2
        usedc = defense_cost(3:8);
        useav = accident_value(3:8);
        usera = risk_assessment(3:8);
    elseif s==3
        usedc = defense_cost(3:8);
        useav = accident_value(3:8);
        usera = risk_assessment(3:8);
    elseif s==4
        usedc = defense_cost(9:10);
        useav = accident_value(9:10);
        usera = risk_assessment(9:10);
    elseif s==5
        usedc = [defense_cost(11),defense_cost(12)];
        useav = [accident_value(11),accident_value(12)];
        usera = [risk_assessment(11),risk_assessment(12)];
    elseif s==6
        usedc = defense_cost(13:16);
        useav = accident_value(13:16);

        usera = [8.7	8	6.35	8.1	7.05	8.35	6.8	8	8.3	8.75	8.1	8.2	7.6	8.45	7];
    elseif s==7
        usedc = defense_cost(13:16);
        useav = accident_value(13:16);
        usera = [8.8	8	6.35	7.6	7.05	8.35	6.8	7.75	8.3	8.75	8.1	7.35	7.8	8.45	7];%暂定这一版

    end
    z1 = 0;
    z2 = 0;
    z3 = 0;

    bit_amount = strategy_amount(s);

    for i = 1:bit_amount
        bit = bitget(x,i);
        if bit == 1
            z1 = z1 + usedc(i);
            z2 = z2 + useav(i);

        end
    end

    z3 = usera(x);
    if x ==2^bit_amount 
        z1 = Inf;
        z2 = Inf;
        z3 = Inf;
    end
    if x == 0
        z1 = Inf;
        z2 = Inf;
        z3 = Inf;
    end

    mindc = min(usedc);
    minav = min(usedc);
    z1 = (z1-mindc)/(usedc(1)+usedc(2)+usedc(3)+usedc(4));
    z2 = (z2-minav)/(useav(1)+useav(2)+useav(3)+useav(4));
    minra = min(usera);
    maxra = max(usera);
    z3 = (z3-minra)/(maxra-minra);

    z = [z1 z2 z3]';
end

