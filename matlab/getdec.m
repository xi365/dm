% ���̶�λ���Ķ����Ʊ���ת��Ϊʮ����������bitget��������ƥ����
%�����ת���Ķ������������ʮ������
function   decimal_number = getdec(binary_encoding,bit_amount)  
    binary_encoding = binary_encoding(bit_amount:-1:1);
    decimal_number = bin2dec(binary_encoding);
end    
% x=16;
% for i = 1:4
%     bit = bitget(x,i)
% end