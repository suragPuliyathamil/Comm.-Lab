% Name - Surag P
% Roll No. - 181EC248

% Experimment four

%Simulation to verify the Wiener-Khinchin theorem.

% Generating Sample Input Signals
clc
clear

t=0:0.1:2*pi;
x=sin(2*t);
subplot(3,1,1);
plot(x);
xlabel('time');
ylabel('Amplitude');
title('Input signal');

%Autocorrelation of Input signal
xu=xcorr(x,x);

%fft of Autocorrelation Signal
y=fft(xu);
subplot(3,1,2);
plot(abs(y));
xlabel('f');
ylabel('Amplitude');
title('fft of Autocorrelation of Input Signal');

%Fourier Transform of Input Signal 
y1=fft(x);

%Power Spectral density Calculation
y2=(abs(y1)).^2;
subplot(3,1,3);
plot(y2);
xlabel('f');
ylabel('Magnitude'); 
title('PSD of Input Signal');