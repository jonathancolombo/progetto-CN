% Script di test per la funzione composita

% Definizione delle funzioni di test
fun1 = @(x) x.^2;            % Funzione semplice: integrale di x^2
fun2 = @(x) sin(x);          % Funzione trigonometica: integrale di sin(x)
fun3 = @(x) exp(x);          % Funzione esponenziale: integrale di exp(x)
fun4 = @(x) 1./(1+x.^2);     % Funzione razionale: integrale di 1/(1+x^2)

% Intervalli di integrazione
a = 0;
b = 1;

% Grado della formula di quadratura
k = 2;

% Numero di sottointervalli
n = 4;

% Funzione NewtonWeights (inserisci la definizione della funzione qui)
function w = NewtonWeights(k)
    if k == 1
        w = [1, 1];
    elseif k == 2
        w = [1, 4, 1] / 3;
    elseif k == 3
        w = [1, 3, 3, 1] / 8;
    elseif k == 4
        w = [7, 32, 12, 32, 7] / 45;
    else
        error('Grado k non supportato');
    end
end

% Esecuzione dei test
fprintf('Test 1: Integrale di x^2 su [0, 1]\n');
[If, err] = composita(fun1, a, b, k, n);
fprintf('Risultato ottenuto: If = %.6f, err = %.6f\n', If, err);
fprintf('Risultato atteso:   If = %.6f\n\n', integral(fun1, a, b));

fprintf('Test 2: Integrale di sin(x) su [0, 1]\n');
[If, err] = composita(fun2, a, b, k, n);
fprintf('Risultato ottenuto: If = %.6f, err = %.6f\n', If, err);
fprintf('Risultato atteso:   If = %.6f\n\n', integral(fun2, a, b));

fprintf('Test 3: Integrale di exp(x) su [0, 1]\n');
[If, err] = composita(fun3, a, b, k, n);
fprintf('Risultato ottenuto: If = %.6f, err = %.6f\n', If, err);
fprintf('Risultato atteso:   If = %.6f\n\n', integral(fun3, a, b));

fprintf('Test 4: Integrale di 1/(1+x^2) su [0, 1]\n');
[If, err] = composita(fun4, a, b, k, n);
fprintf('Risultato ottenuto: If = %.6f, err = %.6f\n', If, err);
fprintf('Risultato atteso:   If = %.6f\n\n', integral(fun4, a, b));

fprintf('Test di correttezza completati.\n');
