# Experiment-7
 
# Name-Love Khakhar
# Roll No-J029
# Batch-2

# Aim: Write a program in octave to understand and analyze the different modulation techniques.

%% pskmod Code phase-shift keying
clear all; 
close all; 
clc;
pkg load communications
data= randi([0 1], 2^16 ,1);
j=1;
for i=6:1:9
            mod_data= pskmod(data,2^j);
        mod_data=reshape(mod_data,[2^i,((2^16)/(2^i))]);
        mod_data=ifft(mod_data,2^i);
        k=1;
        for l=0:1:40
            h=1/(sqrt(randn(1,1)+i*randn(1,1)));
            channel_rayleigh=h*mod_data;
            noise_gaussian=awgn(channel_rayleigh,l,'measured');
            rec_mod_data=inv(h)*noise_gaussian;
            rec_mod_data=fft(rec_mod_data,2^i);
            rec_mod_data=reshape(rec_mod_data,[2^16,1]);
            rec_demod_data=pskdemod(rec_mod_data,2^j);
            [number,ratio]=biterr(rec_demod_data,data);
            err(k)=ratio;
            k=k+1;    
        end
        m=0:1:40;
        semilogy(m,err);
        xlabel("SNR")
        ylabel("BER")
    end

%% pskmod Code
clear all;  clc;
figure()
data= randi([0 1], 2^16 ,1);
j=2;
for i=6:1:9
            mod_data= pskmod(data,2^j);
        mod_data=reshape(mod_data,[2^i,((2^16)/(2^i))]);
        mod_data=ifft(mod_data,2^i);
        k=1;
        for l=0:1:40
            h=1/(sqrt(randn(1,1)+i*randn(1,1)));
            channel_rayleigh=h*mod_data;
            noise_gaussian=awgn(channel_rayleigh,l,'measured');
            rec_mod_data=inv(h)*noise_gaussian;
            rec_mod_data=fft(rec_mod_data,2^i);
            rec_mod_data=reshape(rec_mod_data,[2^16,1]);
            rec_demod_data=pskdemod(rec_mod_data,2^j);
            [number,ratio]=biterr(rec_demod_data,data);
            err(k)=ratio;
            k=k+1;    
        end
        m=0:1:40;
        semilogy(m,err);
        xlabel("SNR")
        ylabel("BER")
    end
    
    
    
%% qammod16 Code
clear all;  clc;warning off;
figure()
data= randi([0 1], 2^16 ,1);

for i=6:1:9
            mod_data= qammod(data,16);
        mod_data=reshape(mod_data,[2^i,((2^16)/(2^i))]);
        mod_data=ifft(mod_data,2^i);
        k=1;
        for l=0:1:40
            h=1/(sqrt(randn(1,1)+i*randn(1,1)));
            channel_rayleigh=h*mod_data;
            noise_gaussian=awgn(channel_rayleigh,l,'measured');
            rec_mod_data=inv(h)*noise_gaussian;
            rec_mod_data=fft(rec_mod_data,2^i);
            rec_mod_data=reshape(rec_mod_data,[2^16,1]);
            rec_demod_data=qamdemod(rec_mod_data,16);
            [number,ratio]=biterr(rec_demod_data,data);
            err(k)=ratio;
            k=k+1;    
        end
        m=0:1:40;
        semilogy(m,err);
        xlabel("SNR")
        ylabel("BER")
    end


%% qammod16 Code  quadrature amplitude modulation
clear all;  clc;warning off;
figure()
data= randi([0 1], 2^16 ,1);

for i=6:1:9
            mod_data= qammod(data,64);
        mod_data=reshape(mod_data,[2^i,((2^16)/(2^i))]);
        mod_data=ifft(mod_data,2^i);
        k=1;
        for l=0:1:40
            h=1/(sqrt(randn(1,1)+i*randn(1,1)));
            channel_rayleigh=h*mod_data;
            noise_gaussian=awgn(channel_rayleigh,l,'measured');
            rec_mod_data=inv(h)*noise_gaussian;
            rec_mod_data=fft(rec_mod_data,2^i);
            rec_mod_data=reshape(rec_mod_data,[2^16,1]);
            rec_demod_data=qamdemod(rec_mod_data,64);
            [number,ratio]=biterr(rec_demod_data,data);
            err(k)=ratio;
            k=k+1;    
        end
        m=0:1:40;
        semilogy(m,err);
        xlabel("SNR")
        ylabel("BER")
        
    end

    
%% square QASK2 Code Quadrature amplitude-shift-keying 
clear all;  clc;warning off;
figure()
data= randi([0 1], 2^16 ,1);

for i=6:1:9

            mod_data = qaskenco (data, 2);
        mod_data=reshape(mod_data,[2^i,((2^16)/(2^i))]);
        mod_data=ifft(mod_data,2^i);
        k=1;
        for l=0:1:40
            h=1/(sqrt(randn(1,1)+i*randn(1,1)));
            channel_rayleigh=h*mod_data;
            noise_gaussian=awgn(channel_rayleigh,l,'measured');
            rec_mod_data=inv(h)*noise_gaussian;
            rec_mod_data=fft(rec_mod_data,2^i);
            rec_mod_data=reshape(rec_mod_data,[2^16,1]);
            rec_demod_data = qaskdeco (rec_mod_data, 2);
            [number,ratio]=biterr(rec_demod_data,data);
            err(k)=ratio;
            k=k+1;    
        end
        m=0:1:40;
        semilogy(m,err);
        xlabel("SNR")
        ylabel("BER")
        
    end


%% square QASK64 Code
clear all;  clc;warning off;
figure()
data= randi([0 1], 2^16 ,1);

for i=6:1:9

            mod_data = qaskenco (data, 64);
        mod_data=reshape(mod_data,[2^i,((2^16)/(2^i))]);
        mod_data=ifft(mod_data,2^i);
        k=1;
        for l=0:1:40
            h=1/(sqrt(randn(1,1)+i*randn(1,1)));
            channel_rayleigh=h*mod_data;
            noise_gaussian=awgn(channel_rayleigh,l,'measured');
            rec_mod_data=inv(h)*noise_gaussian;
            rec_mod_data=fft(rec_mod_data,2^i);
            rec_mod_data=reshape(rec_mod_data,[2^16,1]);
            rec_demod_data = qaskdeco (rec_mod_data, 64);
            [number,ratio]=biterr(rec_demod_data,data);
            err(k)=ratio;
            k=k+1;    
        end
        m=0:1:40;
        semilogy(m,err);
        xlabel("SNR")
        ylabel("BER")
        
    end


