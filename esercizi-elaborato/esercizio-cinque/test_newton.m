% Definizione della funzione f(x)
%f = @(x) exp(x) - cos(x);
f = @(x) exp(x) - cos(x) + sin(x) - x.*(x + 2);

% Definizione della derivata di f(x)
f1 = @(x) exp(x) + sin(x) + cos(x) - 2*x - 2;

% Valore iniziale di x (x0)
x0 = 1;
e
% Tolleranza tolx
tolx = 1e-3;

% Numero massimo di iterazioni (maxit)
maxit = 500;

% Chiamata alla funzione di Newton
[x, it, count] = newton(f, f1, x0, tolx, maxit);

% Stampa del risultato
    disp(['La radice trovata è: ', num2str(x)]);
    disp(['Numero di iterazioni richieste: ', num2str(it)]);
    disp(['Il numero di valutazioni funzionali è: ', num2str(count)]);