% 将固定位长的二进制编码转换为十进制数，和bitget函数排序匹配上
%输入待转换的二进制数，输出十进制数
function   decimal_number = getdec(binary_encoding,bit_amount)  
    binary_encoding = binary_encoding(bit_amount:-1:1);
    decimal_number = bin2dec(binary_encoding);
end    
% x=16;
% for i = 1:4
%     bit = bitget(x,i)
% end