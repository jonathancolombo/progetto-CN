% Definizione della funzione integranda
fun = @(x) exp(3 * x);

% Estremi dell'intervallo di integrazione
a = 0;
b = 1;

% Valore esatto dell'integrale
I_exact = (1/3) * (exp(3) - 1);

% Valori di k e n
k_values = [1, 2, 3, 6];
n = 12;

% Preallocazione delle variabili per memorizzare i risultati
If_values = zeros(size(k_values));
err_estimated = zeros(size(k_values));
err_actual = zeros(size(k_values));

% Ciclo sui valori di k
for i = 1:length(k_values)
    k = k_values(i);
    [If, err] = composita(fun, a, b, k, n);
    If_values(i) = If;
    err_estimated(i) = err;
    err_actual(i) = abs(I_exact - If);
end

% Tabulazione dei risultati
fprintf('k\tIntegrale approssimato\t\tErrore stimato\t\tErrore reale\n');
for i = 1:length(k_values)
    fprintf('%d\t%.10f\t\t%.10f\t\t%.10f\n', k_values(i), If_values(i), err_estimated(i), err_actual(i));
end
