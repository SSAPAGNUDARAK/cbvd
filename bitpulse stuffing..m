# Experiment-6
 
# Name-Love Khakhar
# Roll No-J029
# Batch-2

# Aim: Write a MATLAB code of bit/pulse stuffing.

clc;
close all;
clear all;
# This script performs bit stuffing
# msg variable is created to store the input from the user.
msg = input('Please input binary bit stream: copy paste line 16');
# Input sample:
# [0 1 0 0 0 1 0 0 0 0 0 0 1 1 1 0 1]
 
[M,N] = size(msg);
stuffed = 2;
for i = 1:N-7
    j = i+stuffed;
    # Do bits i through i+7 match flag pattern?
  if msg(j)==1 && msg(j+1)==0 && msg(j+2)==0 && msg(j+3)==0 && msg(j+4)==0 && msg(j+5)==0 && msg(j+6)==0 && msg(j+7)==1
        
        msg = [msg(1:j+5) 1 msg(j+6:end)];
        stuffed = stuffed + 1;
  end
end
disp('msg after stuffing')
msg
  
# Output sample:
# [0 1 0 0 0 1 0 0 0 0 0 1 0 1 1 1 0 1]
 
# This script performs destuffing
msg = input('Please input binary bit stream: copy paste line 38 ');
# Input sample:
# [0 1 0 0 0 1 0 0 0 0 0 1 0 1 1 1 0 1]
 
[M,N] = size(msg);
destuffed = 0;
for i = 1:N-8
    j = i - destuffed;
    
  if msg(j)==1 && msg(j+1)==0 && msg(j+2)==0 && msg(j+3)==0 && msg(j+4)==0 && msg(j+5)==0 && msg(j+6)==1 && msg(j+7)==0 && msg(j+8)==1
        msg = [msg(1:j+5) msg(j+7:end)];
        destuffed = destuffed + 1;
  end
end
 disp('msg after destuffing')
msg
 
# Output sample:
# [0 1 0 0 0 1 0 0 0 0 0 0 1 1 1 0 1]