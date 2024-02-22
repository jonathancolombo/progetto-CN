% Definizione della matrice simmetrica definita positiva A e del vettore dei termini noti b
A = randi([-10,10], 5);
b = randi([-10,10], 5, 1);
disp('matrice A');
disp(A);
disp('vettore dei termini noti');
disp(b);

% Chiamata alla funzione mialdl per calcolare la soluzione del sistema lineare Ax = b
x = mialdlt(A, b);

% Verifica della soluzione calcolata
disp('Soluzione calcolata:');
disp(x);

% Calcolo della soluzione esatta 
x_esatto = A \ b;

% Verifica della soluzione esatta
disp('Soluzione esatta:');
disp(x_esatto);

% Verifica della correttezza della soluzione calcolata
if isequal(round(x, 10), round(x_esatto, 10))
    disp('La soluzione calcolata è corretta.');
else
    disp('La soluzione calcolata non è corretta.');
end