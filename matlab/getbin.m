% ��ʮ������ת��Ϊ�̶�λ���Ķ����Ʊ��룬��bitget��������ƥ����
%�����ת����ʮ�������Լ���Ҫ��λ���������������
function   binary_string = getbin(decimal_number, bit_amount)  
    %decimal_number = 24;bit_amount = 6;%������
    binary_encoding = dec2bin(decimal_number);
    binary_length = length(binary_encoding);
    binary_encoding = binary_encoding(binary_length:-1:1);
    string_length = length(binary_encoding);
    zero_adding = bit_amount - string_length;
    binary_string = [binary_encoding, repmat('0', 1, zero_adding)];
    %binary_string%������
end    