A = [6, 2, 1; 2, 5, 2; 1, 2, 4];

disp('Matrice A:');
disp(A);
% Lunghezza desiderata del vettore dei termini noti b
lunghezza_b = 3;

% Generazione del vettore dei termini noti b
b = rand(lunghezza_b, 1);
disp('vettore dei termini noti');
disp(b);

% Chiamata alla funzione mialdl per calcolare la soluzione del sistema lineare Ax = b
x = mialdl(A, b);

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
