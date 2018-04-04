close all; clc;

Fs = 10000000;            % Sampling frequency
T = 1/Fs;                % Sampling period 
t = (0:T:0.005)';        % 0 até 1 mili segundo
f = 10000;               % Frequencia seno


%y = sin(2*pi*f*t);
y = u100;
figure
plot(t,y)

                    
      
L = length(t);             % Length of signal

Y = fft(y);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
figure;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
%ylabel('|P1(f)|')
ylabel('Densidade de Potência do Espectro (V²)')

% [Pxx,F] = periodogram(y,rectwin(length(y)),length(y),Fs);
% pband = bandpower(Pxx,F,[10000 100000],'psd'); % Using the PSD estimate, determine the percentage of the total power in the frequency interval between 50 Hz and 150 Hz.
% ptot = bandpower(Pxx,F,'psd');
% per_power = 100*(pband/ptot)

pband = bandpower(y,Fs,[10000 100000]);
ptot = bandpower(y,Fs,[0 Fs/10]);
per_power = 100*(pband/ptot)