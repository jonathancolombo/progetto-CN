% Definizione della funzione f(x) da testare (x^2 - 4)
f = @(x) x^2 - 4;

% Intervallo iniziale [a, b]
a = 0;
b = 4;

% Tolleranza tolx
tolx = 1e-6;

% Chiamata alla funzione di bisezione
x = bisezione(a, b, f, tolx);

% Stampa del risultato
disp(['La radice trovata è: ', num2str(x)]);


