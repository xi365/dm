% 将十进制数转换为固定位长的二进制编码，和bitget函数排序匹配上
%输入待转换的十进制数以及需要的位长，输出二进制数
function   binary_string = getbin(decimal_number, bit_amount)  
    %decimal_number = 24;bit_amount = 6;%测试用
    binary_encoding = dec2bin(decimal_number);
    binary_length = length(binary_encoding);
    binary_encoding = binary_encoding(binary_length:-1:1);
    string_length = length(binary_encoding);
    zero_adding = bit_amount - string_length;
    binary_string = [binary_encoding, repmat('0', 1, zero_adding)];
    %binary_string%测试用
end    