%La funzione
%f (x) = 1 + x2 + log(|3(1 − x) + 1|) / 80
%x ∈ [1, 5/3],
%ha un asintoto in x = 4/3, in cui tende a −∞.
%Graficarla in Matlab utilizzando%
% x = linspace(1, 5/3, 100001)
% (in modo che il floating di 4/3 sia contenuto in x) e vedere dove si ottiene il minimo. Commentare
% i risultati ottenuti.

clc, clearvars, close all
x = linspace(1,5/3, 100001); %genero centomilauno valori da 1 a 5/3
y = 1 + x.^2 + (log(abs(3*(1 - x) + 1))/80);
plot(x,y); %grafica i punti (x,y)
grid on;
xlabel('ascissa x');
ylabel('ordinata f(x)');
title('Grafico della funzione f(x)');
%[MinVal, I] = min(y); %restituisce il minimo valore e l'indice
%x_minVal = x(I);
[min_value, min_index] = min(y);
min_x = x(min_index);
disp(['Il minimo della funzione si verifica in x = ', num2str(min_x), ' con valore f(x) = ', num2str(min_value)]);

%calcoliamo il limite di questa funzione
% Calcolo dei limiti della funzione mentre x si avvicina a 4/3
x_right = 4/3 + 0.001;  % x si avvicina a 4/3 da destra
x_left = 4/3 - 0.001;   % x si avvicina a 4/3 da sinistra

lim_right = 1 + x_right^2 + log(abs(3*(1 - x_right) + 1))/80;
lim_left = 1 + x_left^2 + log(abs(3*(1 - x_left) + 1))/80;

disp(['Limite della funzione mentre x si avvicina a 4/3 da destra: ', num2str(lim_right)]);
disp(['Limite della funzione mentre x si avvicina a 4/3 da sinistra: ', num2str(lim_left)]);