function [ofdm_symb_cp, ofdm_spector, control] = ofdmModulator(input, refSignalConfig);

%rs_step = 7;
%rs_numbers = ceil(length(input) / rs_step);
rs_cs = refSignalConfig.scInx; %rs_sc(1, :) = 1 : rs_step + 1 : length(input) + rs_numbers;
rs_val = refSignalConfig.val; %rs_val = ones(1, rs_numbers) * complex(sqrt(2)/2, sqrt(2)/2);
rs_numbers = length(rs_sc);
guard_band = zeros(1, 20);
cp_size = 20;
k = 0;
for i = 1 : length(input) + rs_numbers
    if ( sum(i == rs_sc) == 0)
        k = k + 1;
        data_sc(1, k) = i;
    end;
end;

Mux(1, data_sc) = input;
Mux(1, rs_sc) = rs_val;

half = floor(length(Mux)/2);

ofdm_spector = [guard_band Mux(1:half) zeros(1, 1) Mux(half+1:end) guard_band];
ofdm_symb = ifft(ofdm_spector);
ofdm_symb_cp = [ofdm_symb(end - cp_size + 1:end) ofdm_symb];

control.half = half;
control.cp_size = cp_size;
control.rs_sc = rs_sc;
control.rs_val = rs_val;
control.data_sc = data_sc;
control.rs_step = rs_step;


