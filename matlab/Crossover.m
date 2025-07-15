%交叉操作、单点交叉
%x1,x2是种群个体的position值，s是状态
%y1,y2也是种群个体的position值
function [y1, y2] = Crossover(x1, x2, s)
    %x1 = 3;x2 = 4;s = 2;%测试用
    strategy_amount = [2 6 6 2 2 4 4];
    bit_amount = strategy_amount(s);
    x1
    x2
    s
    pop1_binary = getbin(x1, bit_amount);
    pop2_binary = getbin(x2, bit_amount);
    %offspring1 = repmat('0', 1, bit_amount);
    %offspring2 = repmat('0', 1, bit_amount);
    pop1_binary
    pop2_binary
    crossover_point = randi(bit_amount - 1);
    offspring1 = [pop1_binary(1:crossover_point), pop2_binary(crossover_point+1:end)];
    offspring2 = [pop2_binary(1:crossover_point), pop1_binary(crossover_point+1:end)];
    y1 = getdec(offspring1,bit_amount);
    y2 = getdec(offspring2,bit_amount);
end
% function [y1, y2] = Crossover(x1, x2)
%     x1=8;
%     alpha = randi(x1);
%     
%     y1 = alpha.*x1+(1-alpha).*x2;
%     y2 = alpha.*x2+(1-alpha).*x1;
% % 将十进制数转换为二进制表示
% % 将十进制数转换为6位长度的二进制表示
% decimal_number = 10;
% binary_representation = dec2bin(decimal_number);
% % 获取二进制表示的长度
% binary_length = numel(binary_representation);
% % 如果长度小于6位，则在左侧填充零，使其达到6位长度
% if binary_length < 6
%     padded_binary = [repmat('0' ,1, 6 - binary_length), binary_representation];
% else
%     padded_binary = binary_representation;
% end
% number = bin2dec(padded_binary);
% % 在这里执行你的操作，例如对二进制数进行位运算、逻辑操作等
% % 将字符数组的二进制表示转换为数值数组
% binary_array = double(padded_binary) - '0';
% % 对二进制数进行位取反操作
% flipped_binary_array = ~binary_array;
% % 将取反后的数值数组转换回字符数组
% flipped_binary = char(flipped_binary_array + '0');
% disp(['取反后的6位二进制表示为: ', flipped_binary]);
% % 例如，将所有位取反
% disp(['十进制数 ', num2str(decimal_number), ' 转换为6位二进制后为: ', padded_binary]);
% disp(['取反后的6位二进制表示为: ', flipped_binary]);
% end