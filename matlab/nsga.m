clc;
clear;
close all;

state_total = 7;%状态的总数
strategy_amount = [2 6 6 2 2 4 4];
strategy_name = {};
S1 = {'d1 ','d2 '};
S2 = {'d3 ','d4 ','d5 ','d6 ','d7 ','d8 '};
S3 = {'d3 ','d4 ','d5 ','d6 ','d7 ','d8 '};
S4 = {'d9 ','d10 '};
S5 = {'d11 ','d12 '};
S6 = {'D11 ','D12 ','D13 ','D14 '};
S7 = {'d11 ','d12 ','d13 ','d14 '};
%strategy_name = [S1;S2];
strategy_name = {S1,S2,S3,S4,S5,S6,S7};
%strategy_name{2}{5}
final_F = {};
final_pop = {};
state_title = {'S1','S2','S3','S4','S5','S6','S7'};
% for state=1:state_total %从状态1开始循环  
for state=6:6 %从状态1开始循环  
%% Problem Definition
    CostFunction = @(x,s) MOP4(x,s);      % Cost Function

    %nVar = 2;             % Number of Decision Variables

    %VarSize = [1 nVar];   % Size of Decision Variables 
    VarSize = 1;                      %即第33行代码
    VarMin = 1;          % Lower Bound of Variables
    VarMax = 2^(strategy_amount(state))-1;          % Upper Bound of Variables，
    
    % Number of Objective Functions
    %nObj = numel(CostFunction(unifrnd(VarMin, VarMax, VarSize)));
    nObj = numel(CostFunction(randi(VarMin, VarMax, VarSize),state));

    %% NSGA-II Parameters

    MaxIt = 100;      

    nPop = 30;        

    pCrossover = 0.7;                        
    nCrossover = 2*round(pCrossover*nPop/2);  % Number of Parnets (Offsprings)

    pMutation = 0.4;                         
    nMutation = round(pMutation*nPop);        % Number of Mutants

    mu = 0.02;                    % Mutation Rate

    %sigma = 0.1*(VarMax-VarMin);  % Mutation Step



    %% Initialization

    empty_individual.Position = [];  
    empty_individual.Cost = [];     
    empty_individual.Rank = [];    
    empty_individual.DominationSet = [];     
    empty_individual.DominatedCount = [];    
    empty_individual.CrowdingDistance = [];    
    empty_individual.Strategy = [];
       
    bit_amount = strategy_amount(state);
    
    if VarMax < 100
        pop = repmat(empty_individual, VarMax, 1);
        for i = 1:VarMax
            %pop(i).Position = unifrnd(VarMin, VarMax, VarSize);     
            %pop(i).Position = randi(VarMin, VarMax, VarSize);
            %strategy_name = [S1;S2];
            pop(i).Position = i;

            for j = 1:bit_amount
                bit = bitget(pop(i).Position,j);
                if bit == 1
                    pop(i).Strategy = [pop(i).Strategy,strategy_name{state}{j}];
                end
            end
            pop(i).Cost = CostFunction(pop(i).Position,state)
        end
    else
        pop = repmat(empty_individual, nPop, 1);
        for i = 1:30
            %pop(i).Position = unifrnd(VarMin, VarMax, VarSize);     
            pop(i).Position = randi([VarMin, VarMax]);
            %pop(i).Position = unifrnd(VarMin, VarMax, VarSize);
            for j = 1:bit_amount
                bit = bitget(pop(i).Position,j);
                if bit == 1
                    pop(i).Strategy = [pop(i).Strategy,strategy_name{state}{j}];
                end
            end
            pop(i).Cost = CostFunction(pop(i).Position,state);
        end
    end
    % Non-Dominated Sorting

%     pop(3).Cost= [100 100 100]';
%     pop(5).Cost= [100 100 100]';
%     pop(8).Cost= [100 100 100]';
%     
    [pop, F] = NonDominatedSorting(pop);    
                                           
    % Calculate Crowding Distance
    pop = CalcCrowdingDistance(pop, F);     

    % Sort Population
    [pop, F, MaxRank] = SortPopulation(pop);        
                                            
    final_F = [final_F,{F}];
    final_pop = [final_pop,{pop}];
    %save(['pop', num2str(i), '.mat'], 'pop');
    %% NSGA-II Main Loop
    if VarMax > 100
        for it = 1:MaxIt

            % Crossover
            popc = repmat(empty_individual, nCrossover/2, 2);
            for k = 1:nCrossover/2

                i1 = randi([1 nPop]);
                p1 = pop(i1);

                i2 = randi([1 nPop]);
                p2 = pop(i2);
%                 p1.Position%测试用
%                 p2.Position%测试用
                [popc(k, 1).Position, popc(k, 2).Position] = Crossover(p1.Position, p2.Position,state);

                popc(k, 1).Cost = CostFunction(popc(k, 1).Position, state);
                popc(k, 2).Cost = CostFunction(popc(k, 2).Position, state);

            end
            popc = popc(:);

            % Mutation
            popm = repmat(empty_individual, nMutation, 1);
            for k = 1:nMutation

                i = randi([1 nPop]);
                p = pop(i);

                popm(k).Position = Mutate(p.Position, mu, state);

                popm(k).Cost = CostFunction(popm(k).Position, state);

            end

            % Merge
            pop = [pop
                 popc
                 popm]; %#ok

            % Non-Dominated Sorting
            [pop, F] = NonDominatedSorting(pop);

            % Calculate Crowding Distance
            pop = CalcCrowdingDistance(pop, F);

            % Sort Population
            pop = SortPopulation(pop);

            % Truncate
            pop = pop(1:nPop);  %要前50个最优的，相当于截断

            % Non-Dominated Sorting
            [pop, F] = NonDominatedSorting(pop);

            % Calculate Crowding Distance
            pop = CalcCrowdingDistance(pop, F);

            % Sort Population
            [pop, F] = SortPopulation(pop);

            % Store F1
            F1 = pop(F{1});

            % Show Iteration Information
            disp(['Iteration ' num2str(it) ': Number of F1 Members = ' num2str(numel(F1))]);



        end
    end
%     F1 = pop(F{1});
%     F2 = pop(F{2});
    figure(state);
    PlotCosts(pop(F{1}));
    PlotCosts(pop(F{2}));
%     PlotCosts(F2);
    legend('rank = 1','rank = 2');
    title(state_title{state});
    pause(0.01);
    
    figure;
    F=final_F{1};
    matrix_F = F{1};
    sname = {};
    S7 = [];
    totalp = numel(matrix_F);
    P = final_pop{1};
    for i=1:totalp
        loc = matrix_F(i);
        name = P(loc).Strategy;
        sname = [sname,name];
        S7 = [S7,P(loc).CrowdingDistance];
    end

    b5=bar(S7,0.5)
    set(gca, 'XTickLabel', sname, 'XTickLabelRotation', 45);
    xlabel('defense strategy with rank 1 in state s6','FontSize',15,'FontName','宋体');
    ylabel('crowding distance','FontSize',15,'FontName','宋体');
    ylim([0,1])
    for i = 1:totalp
    %     text(i-0.3,S6(i)+0.05,num2str(S6(i),'%.2f'),'fontsize',8);
        text(i-0.15,S7(i)+0.02,num2str(S7(i),'%.2f'),'fontsize',8);
    end
    

    
end
%% Results

