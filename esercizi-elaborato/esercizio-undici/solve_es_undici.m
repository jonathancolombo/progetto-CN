% Generazione del sistema lineare An
n = 15; % dimensione della matrice
A = ones(n); % inizializza una matrice di uno

% Genera la matrice desiderata
for i = 1:n
    for j = 1:i
        A(i, j) = 10^(i-j); % assegna il valore 10^(i-j) alla posizione (i, j)
    end
end

disp(A); % visualizza la matrice generata

%Generazione del vettore dei termini noti
b = zeros(1, n);
for i = 1:n
    b(i) = n - i + ((10^(i) - 1 )/9);
end

disp(b); % visualizza il vettore generato
b = b.'; % vettore b trasposto
% Richiamo della funzione mialu
x = mialu(A,b);

% Stampa del risultato
disp(x);

% Calcolo del numero di condizionamento usando la norma 2
condizionamento_2 = cond(A);  
disp(['Numero di condizionamento (norma 2): ', num2str(condizionamento_2)]);

% Calcolo del vettore errore
e = b - A * x;
disp('Vettore errore:');
disp(e);