%������������㽻��
%x1,x2����Ⱥ�����positionֵ��s��״̬
%y1,y2Ҳ����Ⱥ�����positionֵ
function [y1, y2] = Crossover(x1, x2, s)
    %x1 = 3;x2 = 4;s = 2;%������
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
% % ��ʮ������ת��Ϊ�����Ʊ�ʾ
% % ��ʮ������ת��Ϊ6λ���ȵĶ����Ʊ�ʾ
% decimal_number = 10;
% binary_representation = dec2bin(decimal_number);
% % ��ȡ�����Ʊ�ʾ�ĳ���
% binary_length = numel(binary_representation);
% % �������С��6λ�������������㣬ʹ��ﵽ6λ����
% if binary_length < 6
%     padded_binary = [repmat('0' ,1, 6 - binary_length), binary_representation];
% else
%     padded_binary = binary_representation;
% end
% number = bin2dec(padded_binary);
% % ������ִ����Ĳ���������Զ�����������λ���㡢�߼�������
% % ���ַ�����Ķ����Ʊ�ʾת��Ϊ��ֵ����
% binary_array = double(padded_binary) - '0';
% % �Զ�����������λȡ������
% flipped_binary_array = ~binary_array;
% % ��ȡ�������ֵ����ת�����ַ�����
% flipped_binary = char(flipped_binary_array + '0');
% disp(['ȡ�����6λ�����Ʊ�ʾΪ: ', flipped_binary]);
% % ���磬������λȡ��
% disp(['ʮ������ ', num2str(decimal_number), ' ת��Ϊ6λ�����ƺ�Ϊ: ', padded_binary]);
% disp(['ȡ�����6λ�����Ʊ�ʾΪ: ', flipped_binary]);
% end