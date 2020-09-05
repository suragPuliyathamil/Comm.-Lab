% Name - Surag P
% Roll No. - 181EC248

% Experimment Six

%Simulation of AM and FM schemes( modulation and demodulation in time
%domain and spectral domain)

clc; 
clear;

%Conventional AM 

%Generating Message Signal With Noise
figure;
T=[0:0.001:1.5];
smax=0.2;
smin=-0.2;
m_1=0.8*sin(2*pi*2.75*T)+(smax-smin)*rand(1,length(T)); 
subplot(2,1,1);
plot(m_1);
title('Message Signal');
fc_1=50;
c=sin(2*pi*fc_1*T);
subplot(2,1,2);
plot(c);
title('Carrier Signal');

MI_1=0.5; %Modulation Index For Under Modulation <1
output1=(1+(MI_1*m_1)).*c; 
figure;
subplot(3,1,1);
plot(output1);
title('Under Modulation');

MI_2=1; %Modulation Index For Perfect Modulation =1
output2=(1+(MI_2*m_1)).*c; 
subplot(3,1,2);
plot(output2); 
title('100% modulation');

MI_3=1.5; %Modulation Index For Under Modulation >1
output3=(1+(MI_3*m_1)).*c;
subplot(3,1,3);
plot(output3);
title('Over modulation');

recv_s=output2.*c; 
[x1,x2]=butter(5,0.1);
demod_s=filter(x1,x2,recv_s);
figure;
subplot(2,1,1)
plot(T,demod_s)
title('Demodulated Signal' );
% Using Median Filter to Smooth the output signal signal
demod_s = sgolayfilt(demod_s, 1, 25);
subplot(2,1,2);
plot(demod_s);
title('Demodulated Signal after Applying Filter' );


%DSBSC Modulation 
figure;
subplot(2,1,1); 
plot(T,m_1); 
title('Message Signal');
subplot(2,1,2); 
plot(T,c); 
title('Carrier Signal');

sig=m_1.*c;
figure;
subplot(2,1,1);
plot(T,sig);
title('DSBSC');

output1=sig.*c;
[x1,x2]=butter(5,0.1); 
output2=filter(x1,x2,output1);
subplot(2,1,2);
plot(T,output2);
title('Demodulated Signal');


% SSBSC Modulation 

figure;
subplot(2,1,1);
plot(T,m_1);
title('Message Signal');
subplot(2,1,2);
plot(T,sin(2*pi*fc_1*T));
title('Carrier Signal');

MI_1=m_1.*cos(2*pi*fc_1*T);
MI_2=hilbert(m_1).*(sin(2*pi*fc_1*T).*-1);
sig=MI_1+MI_2;
figure;
subplot(2,1,1);
plot(T,sig);
title('SSBSC');

output1=sig.*cos(2*pi*fc_1*T);
[x1,x2]=butter(5,0.1); 
output2=filter(x1,x2,output1);
subplot(2,1,2);
plot(T,output2);
title('Demodulated Signal');


%Frequency Modulation 
T=[0:0.001:5];
f1=1; 
m_2=0.8*sin(2*pi*f1*2.75*T) + (smax-smin)*rand(1,length(T)); 
figure;
subplot(2,1,1); 
plot(T,m_2); 
title('Message Signal');
fc_2=30; 
c=sin(2*pi*fc_2*T); 
subplot(2,1,2);
plot(T,c);
title('Carrier Signal');

x=sin(2*pi*f1*T);
accum_x = cumsum(x)/1000;
sig = cos(2*pi*fc_2*T + 2*pi*2*pi*accum_x);
figure;
subplot(2,1,1);
plot(T,sig);
title('Frequency Modulation');

output1=fmdemod(sig,fc_2,1000,2*pi,0);
subplot(2,1,2);
plot(output1);
title('Demodulated Signal');

%Phase Modulation 
figure; 
subplot(2,1,1);
plot(T,m_2);
title('Message Signal');
subplot(2,1,2);
plot(T,c);
title('Carrier Signal');

mf=20;
sig=sin((mf*sin(2*pi*f1*T))+(2*pi*fc_2*T));
figure;
subplot(2,1,1);
plot(T,sig);
title('Phase modulation');

[x1,x2]=butter(10,0.033);
output1=filter(x1,x2,abs(diff(sig)));
subplot(2,1,2);
plot(output1);
title('Demodulated Signal');

%Pre-Lab

%1. Why is modulation an essential process of the communication system?
%Ans- Modulation has a lot of advantages like no signal mixing occurs, communication range increases, Antenna size gets reduced ,etc all of which are essential to communication.

%2. Explain Block diagram of Communication system?
%Ans- Message signal is passed through Source encoder,channel encoder, Modulator and then transmitted by a medium and received at the receiver end by Detector ,Demodulator demodulates the recieved signal, which is then passed through Channel Decoder and Source decoder.

%3. Explain the need for modulation?
%Ans- Modulation decreases attenuation by transmitting a message signal using a high frequency carrier signal.

%4. Define Amplitude modulation?
%Ans- Amplitude modulation is a form of modulation technique where the amplitude of a carrier is made to vary depending on the message signal.

%5. How is the carrier different from the message?
%Ans- The Signal which contains the message which is to be transmitted is called message signal.The carrier signal is the high frequency signal on which modulation techniques are applied to transfer the message signal to reciever end.

%Post-Lab 

%1. What are the distortions that are likely to be present in the demodulated output when a diode detector is used?
%Ans- Diagonal clipping and Negative peak clipping are the types of distortion which are possible in the demodulated output.

%2. Explain how negative peak clipping occurs in the demodulated signal when a diode detector is used?
%Ans- Negative peak clipping occurs when modulation index on output side of detector is higher than that on the input side. So, at greater peaks of modulation of transmitted signal, overmodulation occurs at output of the detector.

%3. Explain under modulation, 100% modulation, over modulation?
%Ans- When Modulation index is less than 1, equal to 1 and greater than 1 its called under modulation ,100% modulation and Over modulation respectively.

%4. Explain High level modulation?
%Ans- In High Level Modulation, the message signal is passed through Wideband Power Amplifier and the Carrier signal is passed through Narrow band Power Amplifier before passing both the signals to High Level MOdulator Bloack 

%5. Write the formula to calculate practical modulation index?
%Ans- Modulation Index = Frequency Deviation / Modulation Frequency
