% Definizione della matrice A e del vettore dei termini noti b

% Definisci la matrice dei coefficienti
A = [1, 2, 3;  % Puoi modificare i valori qui
                4, 5, 6;  
                7, 8, 9];

% Definisci il vettore dei termini noti
b = [10;  % Puoi modificare i valori qui
                11;
                12];

disp('matrice dei coefficienti');
disp(A);
disp('vettore dei termini noti');
disp(b);

% Chiamata alla funzione miaqr per calcolare la fattorizzazione QR del sistema sovradimensionato Ax = b
[x, nr] = miaqr(A, b);

% Verifica della soluzione calcolata
disp('Soluzione calcolata:');
disp(x);

% Verifica della norma euclidea del vettore residuo
disp('Norma euclidea del vettore residuo:');
disp(nr);
