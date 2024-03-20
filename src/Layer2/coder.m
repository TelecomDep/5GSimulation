function encoded_bits = coder(input_bits)
    %input_bits = '1011'
	%encoded_bits = 8 бит
    
    numBits = length(input_bits);
    tmp_data = double(input_bits) - '0';
    start = [0, 0, 0, 0, 0, 0, 0];
    X_bits = zeros(1, numBits);
    Y_bits = zeros(1, numBits);
    for i = 1:numBits
        start = circshift(start, [0 1]);
        start(1) = tmp_data(i);
        X_bits(i) = xor(xor(xor(start(1), start(2)), xor(start(3), start(4))), start(7));
        Y_bits(i) = xor(xor(xor(start(1), start(3)), xor(start(4), start(6))), start(7));
    end
    result = zeros(1, numBits*2);
    for i = 1:numBits
        result(2*i - 1) = X_bits(i);
        result(2*i) = Y_bits(i);
    end
    encoded_bits = num2str(result);
    encoded_bits = strrep(encoded_bits, ' ', '');
end