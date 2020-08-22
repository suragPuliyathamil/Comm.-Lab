% Name - Surag P
% Roll No. - 181EC248

% Experimment three

%Verification of signal sampling and reconstruction and 
%study the effects of aliasing.

% Generating Sample Input Signals
clear 
clc
t=-5:0.01:5;
T=4;
fm=1/T;
X=sin(2*pi*fm*t);
figure;
plot(t,X);
xlabel('t');
ylabel('Amplitude');
title('Input Signal');

%Under Sampling , fs<2fm
fs1=1.6*fm;
n1=-4:1:4;
x1=cos(2*pi*fm/fs1*n1);
figure;
stem(n1,x1);
xlabel('n');
ylabel('Amplitude');
hold on;
plot(n1,x1);
xlabel('t');
ylabel('Amplitude');
title('Undersampling , Fs<2Fm');

%Perfect Sampling , fs=2fm
fs2=2*fm;
n2=-5:1:5;
x2=cos(2*pi*fm/fs2*n2);
figure;
stem(n2,x2);
xlabel('n');
ylabel('Amplitude');
hold on;
plot(n2,x2);
xlabel('t');
ylabel('Amplitude');
title('Perfect Sampling , Fs=2Fm');

%Over Sampling , fs>2fm
fs3=8*fm;
n3=-20:1:20;
x3=cos(2*pi*fm/fs3*n3);
figure
stem(n3,x3);
hold on;
plot(n3,x3);
xlabel('n');
ylabel('Amplitude');
xlabel('t');
ylabel('Amplitude');
grid;
title('Over Sampling , Fs>2Fm');