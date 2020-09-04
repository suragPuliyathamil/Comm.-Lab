% Name - Surag P
% Roll No. - 181EC248

% Experimment Six

%Simulation of AM and FM schemes( modulation and demodulation in time
%domain and spectral domain)

%Pre-Lab

%1. Why is modulation an essential process of the communication system?
%Ans- Modulation allows us to transmit the message over long distances with minimum attenuation and hence is vital to communication systems.

%2. Explain Block diagram of Communication system?
%Ans- The transmitter system involves a Source encoder->channel encoder -> modulator
%This is then passed transmitted via medium and received at the receiver module
%The receiver system has a Detector -> Demodulator -> Channel Decoder -> Source Decoder

%3. Explain the need for modulation?
%Ans- Modulation allows us to reduce attenuation by sending the message signal using a high power carrier signal.

%4. Define Amplitude modulation?
%Ans- Amplitude modulation is a form of modulation where the message signal is encoded into the carrier signal by changing the amplitude levels of the carrier signal.

%5. How is the carrier different from the message?
%Ans- The message signal is the signal containing the information we intend to transmit.
%The carrier signal on the other hand is a high frequency signal which is used for the transmission of the message signal as it has lower attenuation in the medium.

%6_1_a
clc;
clear all;
close all;
t=[0:0.001:2];
f1=5;
m=sin(2*pi*f1*t);
subplot(5,2,[1,2]);
plot(t,m);
title('message');
f2=100;
c=sin(2*pi*f2*t);
subplot(5,2,[3,4]);
plot(t,c);
title('carrier');
m1=0.5;
s1=(1+(m1*m)).*c;
subplot(5,2,5);
plot(t,s1);
title('under modulation');
s5=s1.*c;
[b,a]=butter(5,0.1); s4=filter(b,a,s5);
subplot(5,2,6);
plot(t,s4);
title('demodulation 1' );
m2=1;
s2=(1+(m2*m)).*c;
subplot(5,2,7);
plot(t,s2);
title('100% modulation');
s6=s2.*c;
[b,a]=butter(5,0.1); s7=filter(b,a,s6);
subplot(5,2,8);
plot(t,s7);
title('demodulation 2' );
m3=1.5;
s3=(1+(m3*m)).*c;
subplot(5,2,9);
plot(t,s3);
title('over modulation');
s9=s3.*c;
[b,a]=butter(5,0.1); s10=filter(b,a,s9);
subplot(5,2,10);
plot(t,s10);
title('demodulation 3' );


%6_1_b
%DSB-SC MODULATION USING BALANCED MODULATOR 
clc;
clear all;
close all;
t=[0:0.001:1];
f1=3;
m=sin(2*pi*f1*t)+2*cos(2*pi*f1*t); 
subplot(4,2,[1,2]);
plot(t,m);
title('message');
f2=90;
c=sin(2*pi*f2*t);
subplot(4,2,[3,4]);
plot(t,c);
title('carrier');
s=m.*c;
subplot(4,2,[5,6]);
plot(t,s);
title('DSBSC');
s1=s.*c;
[b,a]=butter(5,6/90);
s2=filter(b,a,s1);
subplot(4,2,[7,8]);
plot(t,s2);
title('demodulation');

%6_1_c
%DSB-SC MODULATION USING RING MODULATOR clc;
clear all;
close all;
t=0:0.01:(4-0.01);
T=8;
f=1/T; a=2*sin(2*pi*f*t)-0.75*cos(4*pi*f*t); 
subplot(3,2,1);
axis([0 (4-0.01) -4.5 4.5]);
hold on;
plot(t,a);
xlabel('t-->');
ylabel('m(t)-->');
title('signal');
pulses=[ones(1,10) -ones(1,10)];
pul=repmat(pulses,1,20);
subplot(3,2,3);
axis([0 (4-0.01) -4.5 4.5]);
hold on;
plot(t,pul);
xlabel('t-->');
ylabel('p(t)-->');
title('pulses');
subplot(3,2,5);
a1=pul.*a;
axis([0 (4-0.01) -4.5 4.5]);
hold on;
plot(t,a1);
xlabel('t-->');
ylabel('g(t)=m(t)p(t)-->');
title('modulated signal');
%%%%%%%%%%%%%%%%FFT%%%%%%%%%
s1 = abs(fftshift((fft(a))));
subplot(3,2,2)
pt=20;
f=-199:200;
%f=-99:100;
%axis([0 (4-0.01) -4.5 4.5]);
%hold on;
%s1=s1(-99:100);
plot(f,s1);
xlabel('f-->');
ylabel('M(f)-->');
title('signal in F-domain'); s2=fftshift(abs(fft(pul))); subplot(3,2,4);
plot(f,s2);
xlabel('f-->');
ylabel('P(f)-->');
title('pulses in F-domain');
s3=fftshift(abs(fft(a1)));
subplot(3,2,6);
f=-199:200;
plot(f,s3);
xlabel('f-->');
ylabel('G(f)-->');
title('modulated in F-domain');

%FREQUENCY MODULATION AND DEODULATION 
clc;
clear all;
close all;
t=[0:0.001:4];
f1=1;
m=cos(2*pi*f1*t);
subplot(4,2,[1,2]);
plot(t,m);
title('message signal');
f2=30;
c=cos(2*pi*f2*t);
subplot(4,2,[3,4]);
plot(t,c);
title('carrier signal');
mf=20; s=cos((2*pi*f2*t)+(mf*sin(2*pi*f1*t)));
subplot(4,2,[5,6]);
plot(t,s);
title('fm');
x=diff(s);
y=abs(x);
[b,a]=butter(10,1/30); s1=filter(b,a,y);
subplot(6,2,[11,12]);
plot(s1);
title('demodulation');

%Post-Lab

%1. What are the distortions that are likely to be present in the demodulated output when a diode detector is used?
%Ans- The nonlinearity of the diode, the cut off voltages as well as its low sensitivity all can contribute to distortion of the demodulated signal. Another form of distortion that occurs is selective fading in certain frequency bands.

%2. Explain how negative peak clipping occurs in the demodulated signal when a diode detector is used?
%Ans- Due to the turn on voltage of the diode, the output signal is produced only after the input rises by a certain amount. This results in the clippin of the signal.

%3. Explain under modulation, 100% modulation, over modulation?
%Ans- When the modulation index is less than 1 , the signal is said to be under modulated. When it is exactly equal to 1, it is said to be 100% modulated. The original message signal can be extracted from such a signal fully without loss. When the modulation index is greater than 1, the signal is said to be over modulated.

%4. Explain High level modulation?
%Ans- When both the modulating and carrier signals are amplified before modulation and the resultant signal is of high power, it is called high level modulation.

%5. Write the formula to calculate practical modulation index?
%Ans- Modulation index = Frequency deviation / modulation frequency