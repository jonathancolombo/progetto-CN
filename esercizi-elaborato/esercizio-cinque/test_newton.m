% Definizione della funzione f(x)
f = @(x) x^2 - 4;

% Definizione della derivata di f(x)
f1 = @(x) 2*x;

% Valore iniziale di x (x0)
x0 = 2;

% Tolleranza tolx
tolx = 1e-6;

% Numero massimo di iterazioni (maxit)
maxit = 100;

% Chiamata alla funzione di Newton
[x, flag] = newton(f, f1, x0, tolx, maxit);

% Stampa del risultato
if flag > 0
    disp(['La radice trovata è: ', num2str(x)]);
    disp(['Numero di iterazioni richieste: ', num2str(flag)]);
else
    disp('La tolleranza non è stata soddisfatta entro il numero massimo di iterazioni.');
end

% Esegui il test della bisezione
test_newton();