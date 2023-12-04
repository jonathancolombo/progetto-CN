clc
clearvars
x = 10;
y = x + 7;
w = x + y;
clearvars

%Comments
x = 10;
y = 10 + x; % in-line
%Very useful

%Matrices and Vectors
clc, clearvars

x = 1:10;
x';
x = linspace(20,50); % 100 values between 20 and 50
x = linspace(20,100,20); % 20 values between 20 and 100

y = [12 50 -8 -100]; % va bene usare anche le virgole come separatori

A = [1 3; 2 -10; 88 99];
A + 2;
A * 8;
%A * A;
A * A';

x = linspace(0,100,101);
x.^2;
A = ones(3);
A = ones(3,1);
B = zeros(2,8);
X = eye(3);
x = 1:1:10;