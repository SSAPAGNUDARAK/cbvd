#Love Khakhar J029
#Experiment 2
#Aim : Write a program on Octave for multiplexing of Analog signals 
clc;
clear all;
close all;
pkg load signal
%Matlab program for Multiplexing 4 analog signals
%Message Signal Generation
fs=2000; %Sampling frequency
t=0:1/fs:1; %time
%Message signal 1;
am1=2;%Message Signal 1 Amplitude
fm1=4;%Message Signal 1 Frequency
m1=am1*cos(2*pi*fm1*t);%Message signal 1
 
%Message signal 2;
am2=2;%Message Signal 2 Amplitude
fm2=5;%Message Signal 2 Frequency
m2=am2*cos(2*pi*fm2*t);%Message signal 2
 
%Message signal 3;
am3=2;%Message Signal 3 Amplitude
fm3=6;%Message Signal 3 Frequency
m3=am3*cos(2*pi*fm3*t);%Message signal 3
 
%Message signal 4;
am4=2;%Message Signal 4 Amplitude
fm4=7;%Message Signal 4 Frequency
m4=am4*cos(2*pi*fm4*t);%Message signal 4
 
%Carrier signal 1;
ac1=2;%Carrier Signal 1 Amplitude
fc1=50;%Carrier Signal 1 Frequency
c1=ac1*cos(2*pi*fc1*t);%Carrier signal 1
 
%Carrier signal 2;
ac2=2;%Carrier Signal 2 Amplitude
fc2=150;%Carrier Signal 2 Frequency
c2=ac2*cos(2*pi*fc2*t);%Carrier signal 2
 
%Carrier signal 3;
ac3=2;%Carrier Signal 3 Amplitude
fc3=250;%Carrier Signal 3 Frequency
c3=ac3*cos(2*pi*fc3*t);%Carrier signal 3
 
%Carrier signal 4;
ac4=2;%Carrier Signal 4 Amplitude
fc4=350;%Carrier Signal 4 Frequency
c4=ac4*cos(2*pi*fc4*t);%Carrier signal 4
%Composite signal
x=m1.*c1+m2.*c2+m3.*c3+m4.*c4;
subplot(5,2,1);
plot(t,x);
xlabel('Time');
ylabel('Amplitude');
title('Composite signal')
N=length(x);
X=fftshift(fft(x,N));
f=fs*[-N/2:N/2-1]/N;
subplot(5,2,2);
plot(f,abs(X));
xlabel('Absolute Frequency');
ylabel('DFT Values');
title('Spectrum of Composite Signal');
%Recovered message signal
%Bandpass filtering
[num den]=butter(5,[(fc1-fm1)*2/fs (fc1+fm1)*4/fs]);
bpf_1=filter(num,den,x);
%Mixing
z1=2*bpf_1.*c1;
%Low pass filtering
[num den]=butter(5,fm1*4/fs);
rec1=filter(num,den,z1);
subplot(5,2,3);
plot(t,rec1);
xlabel('Time')
ylabel('Amplitude');
title('Recovered signal 1');
N=length(rec1);
R1=fftshift(fft(rec1,N));
subplot(5,2,4);
plot(f,abs(R1));
xlabel('Absolute Frequency')
ylabel('DFT Values');
title('Spectrum of Recovered signal 1');
 
%Recovered message signal2
%Bandpass filtering
[num den]=butter(5,[(fc2-fm2)*2/fs (fc2+fm2)*4/fs]);
bpf_2=filter(num,den,x);
%Mixing
z2=2*bpf_2.*c2;
%Low pass filtering
[num den]=butter(5,fm2*4/fs);
rec2=filter(num,den,z2);
subplot(5,2,5);
plot(t,rec2);
xlabel('Time')
ylabel('Amplitude');
title('Recovered signal 2');
N=length(rec2);
R2=fftshift(fft(rec2,N));
subplot(5,2,6);
plot(f,abs(R2));
xlabel('Absolute Frequency')
ylabel('DFT Values');
title('Spectrum of Recovered signal 2');
 
%Recovered message signal 3
%Bandpass filtering
[num den]=butter(5,[(fc3-fm3)*2/fs (fc3+fm3)*4/fs]);
bpf_3=filter(num,den,x);
%Mixing
z3=2*bpf_3.*c1;
%Low pass filtering
[num den]=butter(5,fm3*4/fs);
rec3=filter(num,den,z3);
subplot(5,2,7);
plot(t,rec3);
xlabel('Time')
ylabel('Amplitude');
title('Recovered signal 3');
N=length(rec3);
R3=fftshift(fft(rec3,N));
subplot(5,2,8);
plot(f,abs(R3));
xlabel('Absolute Frequency')
ylabel('DFT Values');
title('Spectrum of Recovered signal 3');
 
%Recovered message signal 4
%Bandpass filtering
[num den]=butter(5,[(fc4-fm4)*2/fs (fc4+fm4)*4/fs]);
bpf_4=filter(num,den,x);
%Mixing
z4=2*bpf_4.*c4;
%Low pass filtering
[num den]=butter(5,fm4*4/fs);
rec4=filter(num,den,z4);
subplot(5,2,9);
plot(t,rec4);
xlabel('Time')
ylabel('Amplitude');
title('Recovered signal 4');
N=length(rec4);
R4=fftshift(fft(rec4,N));
subplot(5,2,10);
plot(f,abs(R4));
xlabel('Absolute Frequency')
ylabel('DFT Values');
title('Spectrum of Recovered signal 4');


