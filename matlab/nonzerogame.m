%%%%  非零和博弈 混合策略 纳什均衡  %%%%
function [Value_attack,Value_defense,nashEqbm]=nonzerogame(payoff_attack,payoff_defense)
    nashEqbm=LemkeHowson(payoff_defense,payoff_attack);
    A=nashEqbm{1};
    B=nashEqbm{2};
    Value_attack=sum(sum((A*B.').*payoff_attack));%sum(a)表示矩阵每列求和得到的行向量
    Value_defense=sum(sum((A*B.').*payoff_defense));
end