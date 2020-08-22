
% Name - Surag P
% Roll No. - 181EC248

% Experimment Two

%Find the even and odd parts and real and imaginary parts of the signals.

%Generating Sample Signals
clc
clear
t = 0:0.001:5;

x = sin(2*pi*t) + cos(pi*t + pi/2);
subplot(2,2,1)
plot(t,x)
xlabel('t');
ylabel('Amplitude')
title('Input Signal')

y = sin(2*pi*-t) + cos(pi*-t + pi/2);
subplot(2,2,2)
plot(t,y)
xlabel('t');
ylabel('Amplitude')
title('Input Signal with t = -t')

%Even Part of Signal
even=(x+y)/2;
subplot(2,2,3)
plot(t,even)
xlabel('t');
ylabel('Amplitude')
title('Even Part of Signal')

%Odd Part of Signal
odd=(x-y)/2;
subplot(2,2,4)
plot(t,odd)
xlabel('t');
ylabel('Amplitude');
title('Odd Part of Signal');

% Even and odd Parts of a sequence

seq_1=[2,4,8,1,-2,0,3];
n=-3:3;
rev_seq_1= fliplr(seq_1);
figure;
subplot(2,2,1);
stem(n,seq_1);
xlabel('n');
ylabel('Amplitude');
title('Input Sequence');

subplot(2,2,2);
stem(n,rev_seq_1);
xlabel('n');
ylabel('Amplitude');
title('Input Sequence with n = -n');

% Even Part of Sequence
even=.5*(seq_1+rev_seq_1);
subplot(2,2,3);
stem(n,even);
xlabel('n');
ylabel('Amplitude');
title('Even Part of Sequence');

% Odd Part of Sequence
odd=.5*(seq_1-rev_seq_1);
subplot(2,2,4);
stem(n,odd);
xlabel('n');
ylabel('Amplitude');
title('Odd Part of Sequence');

% Generating a Signal
Signal=sin(t)+1i*cos(t);
figure;
subplot(3,1,1);
plot(t,Signal); 
xlabel('t');
ylabel('Amplitude');
title('Input signal');

% Real Part Of Signal
subplot(3,1,2)
plot(t,real(Signal));
xlabel('Time');
ylabel('Amplitude');
title('Real Part of Signal');

%Imaginary Part of Signal
subplot(3,1,3)
plot(t,imag(Signal));
xlabel('Time');
ylabel('Amplitude');
title('Imaginary Part of Signal');