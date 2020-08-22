
% Name - Surag P
% Roll No. - 181EC248

% Experimment one 

%Perform basic signal operations.
%Plot the magnitude and phase responses of a continuous time signal.

% Generating Sample Input Signals
clc
clear
t = 0:0.001:5;
signal1 = sin(2*pi*t);
signal2 = cos(pi*t + pi/2);
subplot(2,1,1);
plot(t,signal1)
xlabel('Time');
ylabel('Amplitude');
title('Signal 1');
subplot(2,1,2);
plot(t,signal2)
xlabel('Time');
ylabel('Amplitude');
title('Signal 2');

%Performing Basic Operations on Signals 
%Operation 1 : Addition
sum_sig = signal1 + signal2;
figure;
plot(t,sum_sig)
xlabel('Time');
ylabel('Amplitude');
title('Sum Of Signals');

%Operation 2 : Multiplicaiton 
mul_sig =  signal1 .* signal2;
figure;
plot(t,mul_sig)
xlabel('Time');
ylabel('Amplitude');
title('Product Of Signals');

%Operation 3 : Folded Signal (of Sum of input Signals)
rev_sig = fliplr(sum_sig);
figure;
subplot(2,1,1);
plot(t,sum_sig)
xlabel('Time');
ylabel('Amplitude');
title('Input Signal')
subplot(2,1,2);
plot(t,rev_sig)
xlabel('Time');
ylabel('Amplitude');
title('Folded Signal ');

%Operation 4 : Scaling Signal (Amp. scaling of sum of input Signals)
scal_sig = 5 * (mul_sig);
figure;
subplot(2,1,1);
plot(t,sum_sig)
xlabel('Time');
ylabel('Amplitude');
title('Input Signal')
subplot(2,1,2);
plot(t,scal_sig)
xlabel('Time');
ylabel('Amplitude');
title('Amplitude scaling of Sum of input signals');

%Operation 5 : Shifting Signal (Shifting the sum of input Signals )
figure;
subplot(3,1,1);
plot(t,sum_sig)
xlabel('Time');
ylabel('Amplitude');
title('Input Signal')
subplot(3,1,2);
plot(t+2,sum_sig);
xlabel('t+2');
ylabel('Amplitude');
title('Right Shifted signal');
subplot(3,1,3);
plot(t-2,sum_sig);
xlabel('t-2');
ylabel('Amplitude');
title('Left shifted signal');

%Oeration 6 :Energy And Power Of Signal
Z1 = signal1.^2;
E1=sum(abs(Z1).^2);
disp('Energy of the Signal is');
disp(E1);
P1=(sum(abs(Z1).^2))/length(Z1);
disp('Power of Signal is');
disp(P1);

%%Generating Sample Sequences
X1=1:1:9;
seq_1=[1 3 6 8 0 2 4 5 1];
figure;
subplot(2,2,1);
stem(X1,seq_1);
xlabel('X1');
ylabel('Amplitude');
title('Input Sequence1');
seq_2=[3 6 8 4 2 3 0 1 3];
subplot(2,2,2);
stem(X1,seq_2);
xlabel('X1');
ylabel('Amplitude');
title('Input Sequence2');

%Operations on Sequences
%Operation 1: Addition of sequences
sum_seq=seq_1+seq_2;
subplot(2,2,3);
stem(X1,sum_seq);
xlabel('X1');
ylabel('Amplitude');
title('Sum Of Sequences ');

%Operation 2: Multiplication of sequences
prod_seq=seq_1.*seq_2;
subplot(2,2,4);
stem(X1,prod_seq);
xlabel('X1');
ylabel('Amplitude');
title('Product Of Sequences');

%Operation 3 : Energy and Power Of Sequences 
Z2=seq_1;
E2=sum(abs(Z2).^2);
disp('Energy Of Sequence is ');
disp(E2);
% program for power of a seq
P2=(sum(abs(Z1).^2))/length(Z1);
disp('Power of Sequence is');
disp(P1);


%Calculating Phase and Magnitude responses(sequence 1)
x=seq_1
N=length(x);
n=0:1:N-1;
y=fft(x,N)
subplot(2,1,1);
stem(n,x);
title('Input Sequence'); 
xlabel('n'); 
ylabel('Amplitude x[n]'); 
subplot(2,1,2);
stem(n,y);
title('Output Sequence');
xlabel(' Frequency K');
ylabel('Amplitude X[k]');
x=[1,1,1,1,zeros(1,4)];
N=8;
X=fft(x,N); 
magX=abs(X);
phase=angle(X)*180/pi;
subplot(2,1,1)
plot(magX);
xlabel('K')
ylabel('X(K)')
title('Magnitude Spectrum');
subplot(2,1,2)
plot(phase);
xlabel('K');
ylabel('Degrees');
title('Phase Spectrum');
