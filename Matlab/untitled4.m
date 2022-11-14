clear all %Clears the Workspace
close all %Closes all figue/plot windows opened by MATLAB
clc %Clears the command window
[X, Fs] = audioread("F4.mp3");
X = X(:,1);
N = numel(X);
T  = 1/Fs;      % [s] sampling period       
t  = (0:N-1)*T; % [s] Time vector
deltaF = Fs/N;  % [1/min]) frequency intervalue of discrete signal
plot(t);
% compute the fast fourier transform
Y = fft(X);
% manually shifting the FFT
Y = abs(Y/N);
Amp = [Y(ceil(end/2)+1:end)' Y(1) Y(2:ceil(end/2))']';
if (mod(N,2) == 0)
sampleIndex = -N/2:1:N/2-1; %raw index for FFT plot
else
sampleIndex = -(N-1)/2:1:(N-1)/2; %raw index for FFT plot
end
AmpSquared = Amp.^2;
plot(deltaF*sampleIndex, AmpSquared);
hold on;
idx = find(AmpSquared > 15);
idx(sampleIndex(idx) < 0) = [];
plot(deltaF*sampleIndex(idx), AmpSquared(idx), '+');
xlabel('Frequency [Hz]');
ylabel('|FFT(Wave)|^2');
title('Power of FFT of Wave (Audible Range = 20-20\times10^4 Hz)');
xlim([20 2000]);