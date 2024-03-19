function binary_message = encode_message()

    % Ввод сообщения с клавиатуры
    message = input('Введите сообщение: ', 's');
    
    % Разрядность кодового слова
    num_bits = 8;
    % Преобразование сообщения в двоичные биты
    binary_message = '';
    for i = 1:numel(message)
        % Получение ascii кода символа
        ascii_code = uint8(message(i));
        % Преобразование ASCII кода в двоичную строку
        binary_code = dec2bin(ascii_code, num_bits);
        % Добавление двоичного кода символа к битовому сообщению
        binary_message = [binary_message, binary_code];
    end
    
    disp(['Битовое сообщение: ', binary_message]);

end
