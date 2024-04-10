function [Signal] = Rice(ofdm_symb, f, distance, c)
    Gain = c/(4 * pi * distance * f);
    %Gain = TxPower + PL;
    Mas = [0, 0; 177, -11; 363, -13; 315, -19; 459, -8; 184, -12; 163, -15; 263, -14; 410, -1; 59, -17];
    %disp(size(Mas, 1));
    numSignal = numel(ofdm_symb); 
    Signal = 0;%zeros(size(Mas, 1), numSignal);
    B = [];
    
    for i = 1:size(Mas, 1)
        Mas(i,1) = fix(Mas(i,1)/50);
        zerosMas = zeros(1, numSignal);
        B = circshift(ofdm_symb, Mas(i,1));
        for j = 1:Mas(i,1)
            B(j) = B(j)*0;
        end
        Signal = Signal + ((zerosMas + B) * (Gain + Mas(i,2)));
    end
end