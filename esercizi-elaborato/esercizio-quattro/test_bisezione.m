% Definizione della funzione f(x) da testare f(x) = exp(x) - cos(x)
%f = @(x) exp(x) - cos(x);
f = @(x) exp(x) - cos(x) + sin(x) - x.*(x + 2);

% Intervallo iniziale [a, b]
a = -0.1;
b = 1;

% Tolleranza tolx
tolx = 1e-12;

% Chiamata alla funzione di bisezione
[x, it, count] = bisezione(a, b, f, tolx);

% Stampa del risultato
disp(['La radice trovata è: ', num2str(x)]);
disp(['Il numero di iterazioni è: ', num2str(it)]);
disp(['Il numero di valutazioni funzionali è: ', num2str(count)]);
