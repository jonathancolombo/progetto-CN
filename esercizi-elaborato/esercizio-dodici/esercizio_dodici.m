% Generazione del sistema lineare An
n = 10; % dimensione della matrice
A = -1 * ones(n); % inizializza una matrice di uno

for i = 1:n
    for j = 1:i
        if i == j && A(i,j) == -1 %se mi trovo sull'elemento diagonale e il valore è -1
            A(i,j) = i; %faccio l'assegnazione del valore n-esimo sull'elemento diagonale
        end
    end
end

disp(A);

%Generazione del vettore dei termini noti
b = rand(n, 1); % Genera numeri casuali nell'intervallo [0, 1]
b = b * 10; % Moltiplica per un fattore per ottenere numeri positivi nel range desiderato, ad esempio [0, 10]


disp(b); % visualizza il vettore generato
b = b.'; % vettore b trasposto

% Richiamo della funzione mialu
x = mialdlt(A,b);

% Stampa del risultato
disp(x);
plot(x);