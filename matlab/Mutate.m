%�������
%x����Ⱥ�����positionֵ��s��״̬
%y1,y2Ҳ����Ⱥ�����positionֵ
function y = Mutate(x, mu, s)
    strategy_amount = [2 6 6 2 2 4 4];
    %x=3;mu = 0.2;s=2;%������
    bit_amount = strategy_amount(s);
    pop_binary = getbin(x, bit_amount);
    offspring = pop_binary;
    for j = 1:bit_amount
        if rand() < mu
            % Flip the bit
            if offspring(j) == '1'
                offspring(j) = '0';
            else
                offspring(j) = '1';
            end
        end
    end
    y = getdec(offspring,bit_amount);
end

% 
% function y = Mutate(x, mu, sigma)
% 
%     nVar = numel(x);
%     
%     nMu = ceil(mu*nVar);
% 
%     j = randsample(nVar, nMu);
%     if numel(sigma)>1
%         sigma = sigma(j);
%     end
%     
%     y = x;
%     
%     y(j) = x(j)+sigma.*randn(size(j));
% 
% end