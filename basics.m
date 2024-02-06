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
x.^2; %elevare tutti gli elementi alla seconda
A = ones(3); % vettori di 1
A = ones(3,1); %tutti a unooo
B = zeros(2,8); % tutti a zeroo
X = eye(3); %matrice identità
x = 1:1:10;

A = [5 3 4.2; 8 9 0];

A(2,2);

A(2,3) + A(2,2);

A = linspace(220,900);
B = 1:5:980;
B(end);

%Equations

%Example problem 
clc, clearvars, close all

x = linspace(0,5); %genero 100 valori da 0 a 5
y = (-(x-3).^2) + 10;

%plot(x,y,'*'); grafica i punti (x,y)
[MaxVal, I] = max(y); %restituisce il massimo valore e l'indice

x_maxVal = x(I);

%Plotting