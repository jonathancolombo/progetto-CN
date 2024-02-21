
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

disp(b);

% Richiamo della funzione mialu