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
% Contact Info: hsm.kalami@gmail.com, info@yarpiz.com
%

function [pop, F, MaxRank] = SortPopulation(pop)

    % Sort Based on Crowding Distance
    %[~, CDSO] = sort([pop.CrowdingDistance], 'descend');    %将降序排序后的索引存储在 CDSO 中
    [~, CDSO] = sort([pop.CrowdingDistance]);
    pop = pop(CDSO);        %将原始数组中的元素重新排列为按照 CrowdingDistance 字段降序排列的顺序
    
    % Sort Based on Rank
    [~, RSO] = sort([pop.Rank]);    %将升序排序后的索引存储在 RSO 中
    pop = pop(RSO);
    
    % Update Fronts
    Ranks = [pop.Rank];
    MaxRank = max(Ranks);
    F = cell(MaxRank, 1);
    for r = 1:MaxRank
        F{r} = find(Ranks == r);
    end

end