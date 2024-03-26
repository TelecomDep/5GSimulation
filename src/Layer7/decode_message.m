function result = Decoder(BinaryArr)
    result = '';
    power = 8;
    buffer = 0;
    for i =1:length(BinaryArr)
        power = power - 1;
        buffer = buffer + BinaryArr(i)*2^power;
        if power == 0
            power = 8;
            result = [result,char(buffer)];
            buffer = 0;
        end
    end
end