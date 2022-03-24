##Experiment No. 3
##J029 Love Khakhar 
##AIM:- Write a MATLAB  code for line coding for the following
##1.	Unipolar - RZ and NRZ
##2.	Bipolar - RZ and NRZ
##3.	Manchester
##SOFTWARE USED:- MATLAB
##
##?	RZ Uni-Polar:-
##PROGRAM:-
%RZ Uni-Polar
##n = [1 0 1 0]
clc
clear all
n = randi([0 1], 1, 10)
 
%RZ Pulse Shaping
i = 1;
a = 0;
b = 0.5;
t = 0:0.01:length(n);
for j = 1: length(t)
    		if  t(j) >= a && t(j)<=b
        		y(j) = n(i);
    		elseif t(j)>b && t(j)<i
        		y(j)=0;
    		else
        		i = i+1;
        		a = a+1;
        		b = b+1;
    		end
end

plot(t(1:length(t)-1),y);
axis ([0 length(n) -1 2]);
##axis ([0 length(n) -1 2]);
##
####OUTPUT:-
#### 
####
####?	NRZ Uni-Polar:-
####PROGRAM:-
##	%NRZ Uni-Polar
##%n = [1 0 1 0 1]
n = randi([0 1], 1, 10)
 
%Mapping
for m = 1: length(n)
    if n(m) == 1
        nn(m)= 3;
    else
        nn(m)= -3;
    end
end
 
%NRZ Pulse shaping
i = 1;
t = 0:0.01:length(n);
for j = 1: length(t)
    if t(j) <= i
        y(j) = nn(i);
    else
        y(j) = nn(i);
        i=i+1;
    end
end
 figure
 plot(t,y);
axis([0 length(n) -5 5]);
##
####OUTPUT:-
####
#### 
####?	RZ BiPolar:-
####PROGRAM:-
##%RZ bi-Polar
##%n = [1 0 1 0]
%clc
clear all
n = randi([0 1], 1, 10)
 
%Mapping
f=1;
for m = 1:length(n)
    if n(m)== 1
        if f == 1
            nn(m) = 1;
            f = -1;
        else
            nn(m) = -1;
            f = 1;
        end
    else
        nn(m) = 0;
    end
end
 
%RZ Pulse Shaping
i = 1;
a = 0;
b = 0.5;
%t = 0:0.01:length(n)-0.01;
t = 0:0.01:length(n);
for j = 1: length(t)
    if  t(j) >= a && t(j)<=b
        y(j) = n(i);
    elseif t(j)>b && t(j)<i
        y(j)=0;
    else
        i = i+1;
        a = a+1;
        b = b+1;
    end
end
figure
plot(t(1:length(t)-1),y);
axis ([0 length(n) -2 2]);

##
####OUTPUT:-
#### 
####?	NRZ-Bipolar:-
####PROGRAM:-
##%NRZ_Bipolar
n = randi([0 1], 1, 10)
 
%Bipolar Mapping
f=1;
for m = 1:length(n)
    if n(m)== 1
        if f == 1
            nn(m) = 1;
            f = -1;
        else
            nn(m) = -1;
            f = 1;
        end
    else
        nn(m) = 0;
    end
end
 
%NRZ Pulse shaping
i = 1;
t = 0:0.01:length(n);
for j = 1: length(t)
    if t(j) <= i
        y(j) = nn(i);
    else
        y(j) = nn(i);
        i=i+1;
    end
end
 
figure
plot(t,y);
axis([0 length(n) -2 2]);

####OUTPUT:-
#### 
####
####?	MANCHESTER:-
####PROGRAM:-
%clc;
clear all;
##close all;
%b=[1 0 1 0 0 1 1 1 0 0 1]
b = randi([0 1], 1, 10)
l=length(b);
b(l+1)=0;
n=1;
figure
 while n<=l
    t=(n-1):.001:n;
    if b(n)==1
        if b(n+1)==0
            y=(t<(n-0.5))+(-1)*(t>=n-0.5&t<=n);
        else
            y=(t<(n-0.5)|t==n)+(-1)*(t>=n-0.5&t<n);
        end
    else
        if b(n+1)==1
            y=(-1)*(t<(n-0.5))+(t>=n-0.5&t<=n);
        else
             y=(-1)*(t<(n-0.5)|t==n)+(t>=n-0.5&t<n);
        end
    end
    plot(t,y)
    hold on;
    axis([0 l -1.5 1.5]);
    n=n+1;
 end
title('Manchester');
xlabel('Time');
ylabel('Amplitude');

 
