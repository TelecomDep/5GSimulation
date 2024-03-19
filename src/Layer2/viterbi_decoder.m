function decoded_bits = viterbi_decoder(encoded_bits)
% Витерби-декодер с кодом R = 1/2 и полиномом кодера [171oct, 133oct]
    % 171oct = 1111001bin
    % 133oct = 1011011bin 
    % ------------- 
    % 7 bits
    %encoded_bits = '11100010'; % Для теста
    trellis = poly2trellis(7,[171 133]);
    msg = double(encoded_bits) - '0';
    decoded_bits = num2str(vitdec(msg, trellis, length(msg)/2, 'trunc', 'hard'));
    decoded_bits = strrep(decoded_bits, ' ', '');
end

