% Definizione della funzione
funzione = @(x) [x(1)^2 + x(2)^2 - 1; x(1) - x(2)];
[parametro1, parametro2] = nomeFunzione(){
    
}

% Approssimazione iniziale
x0 = [0.5; 0.5];

% Tolleranza
toleranza = 1e-6;

% Numero massimo di iterazioni
max_iterazioni = 100;

% Chiamata alla funzione newton
[x, iterazioni] = newton(funzione, x0, toleranza, max_iterazioni);

% Visualizzazione dei risultati
fprintf('Soluzione trovata: x = [%f, %f]\n', x(1), x(2));
fprintf('Numero di iterazioni: %d\n', iterazioni);
