% Name - Surag P
% Roll No. - 181EC248

% Experimment Seven

%Simulation of data-reformatting by line coding techniques

clear
clc

[SQNR,a_quant,~]=Quantisation(8);
disp("The SQNR when N=8 is ")
SQNR
a=a_quant;

[SQNR,a_quant,~]=Quantisation(16);
disp("The SQNR when N=16 is ")
SQNR
b=a_quant;

figure;
plot(a);
hold on
plot(b);
grid on
legend("N=8","N=16")
title("Quantisation of Sine wave for N= 8 and 16")

function [SQNR,a_quan,bin_quant]=Quantisation(n)
    t=0.1:0.1:6.5;
    %m=length(t);
    a=sin(t);
    figure;
    grid on
    plot(a)
    hold on
    amax=max(abs(a));
    b=a+amax;
    c=b*(n-1)/(2*amax);
    d=round(c);
    a_quan=2*amax*d/(n-1)-amax;
    a_error=a-a_quan;
    S=sum(a.*a);
    N=sum(a_error.*a_error);
    bin_quant=dec2bin(a_quan);
    SQNR = 10*log(S/N);
    plot(a_quan)
    grid on
    title(["Quantisation level N =",num2str(n)])
    legend("Original Signal","Quantised Signal")
    
    figure
    subplot(2,2,1)
    plot(a)
    title("Input Signal")
    subplot(2,2,2)
    plot(b)
    title("Amp. Shifted Signal")
    subplot(2,2,3)
    plot(c)
    title("Scaled Signal")
    subplot(2,2,4)
    plot(d)
    title(["Quantised Signal, N =",num2str(n)])
    
end

