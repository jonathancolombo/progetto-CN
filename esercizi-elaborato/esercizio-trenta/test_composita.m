% Script di test per la funzione composita
clc;
clear;

% Definizione della funzione da integrare
fun = @(x) exp(3 * x);

% Intervallo di integrazione
a = 0;
b = 1;

% Valori di k e n
k_values = [1, 2, 3, 6];
n = 12;

% Valore esatto dell'integrale
I_exact = (1/3) * (exp(3) - 1);

% Tabella dei risultati
fprintf('k\tn\t\tIf\t\t\terr\t\t\tErrore vero\n');
fprintf('-------------------------------------------------------------\n');

for k = k_values
    [If, err] = composita(fun, a, b, k, n);
    errore_vero = abs(If - I_exact);
    fprintf('%d\t%d\t%.6e\t%.6e\t%.6e\n', k, n, If, err, errore_vero);
end
