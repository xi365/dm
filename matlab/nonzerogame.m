%%%%  ����Ͳ��� ��ϲ��� ��ʲ����  %%%%
function [Value_attack,Value_defense,nashEqbm]=nonzerogame(payoff_attack,payoff_defense)
    nashEqbm=LemkeHowson(payoff_defense,payoff_attack);
    A=nashEqbm{1};
    B=nashEqbm{2};
    Value_attack=sum(sum((A*B.').*payoff_attack));%sum(a)��ʾ����ÿ����͵õ���������
    Value_defense=sum(sum((A*B.').*payoff_defense));
end