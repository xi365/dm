%录入每个种群个体实际对应的安全策略
function  pop_strategy = getstrategy(binary_string, strategy_name, state)
    strategy_amount = [2 6 6 2 2 4 4];
    bit_amount = strategy_amount(state);
    for j = 1:bit_amount
        bit = bitget(binary_string,j);
        if bit == 1
            pop_strategy = [pop(i).Strategy,strategy_name{state}{j}];
        end
    end
end