% Definizione della matrice A e del vettore dei termini noti b
A = [1,2,3; 0,0,0; 7,8,9];
b = [1,4,7];
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

% Calcolo della soluzione esatta utilizzando l'operatore di divisione a sinistra
x_esatto = A \ b;

% Calcolo della norma euclidea del vettore residuo
nr_esatta = norm(b - A * x_esatto);

% Verifica della soluzione esatta
disp('Soluzione esatta:');
disp(x_esatto);

% Verifica della norma euclidea del vettore residuo esatta
disp('Norma euclidea del vettore residuo esatta:');
disp(nr_esatta);

% Verifica della correttezza della soluzione calcolata
if isequal(round(x, 10), round(x_esatto, 10)) && round(nr, 10) == round(nr_esatta, 10)
    disp('La soluzione calcolata è corretta.');
else
    disp('La soluzione calcolata non è corretta.');
end
