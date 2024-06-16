% Definizione della funzione f(x)
f = @(x) exp(x) - cos(x) + sin(x) - x.*(x + 2);

% Valore iniziale di x (x0)
x0 = 1;

% Valore iniziale di x1 (x0)
x1 = 0.9;

% Tolleranza tolx
tolx = 1e-9;

% Numero massimo di iterazioni (maxit)
maxIt = 100;

% Chiamata alla funzione di Secanti
[x, it, count] = secanti(f,x0,x1,maxIt,tolx);

% Stampa del risultato
if it > 0
    disp(['La radice trovata è: ', num2str(x)]);
    disp(['Numero di iterazioni richieste: ', num2str(it)]);
    disp(['Il numero di valutazioni funzionali è: ', num2str(count)]);
else
    disp('La tolleranza non è stata soddisfatta entro il numero massimo di iterazioni.');
end