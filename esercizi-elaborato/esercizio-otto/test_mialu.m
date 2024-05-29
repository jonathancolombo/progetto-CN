% Definizione di una matrice dei coefficienti non singolare 3x3
A = [1 2 3; 2 5 4; 6 7 8];

% Definizione di un vettore dei termini noti b con tre elementi
b = [10; 20; 30];

disp('Matrice dei coefficienti:');
disp(A);
disp('Vettore dei termini noti:');
disp(b);

% Chiamata alla funzione mialu per calcolare la soluzione del sistema lineare Ax = b
x = mialu(A, b);

% Verifica della soluzione calcolata
disp('Soluzione calcolata:');
disp(x);

% Calcolo della soluzione esatta utilizzando la matrice inversa
x_esatto = A \ b;

% Verifica della soluzione esatta
disp('Soluzione esatta:');
disp(x_esatto);

% Verifica della correttezza della soluzione calcolata
if isequal(x, x_esatto) 
    disp('La soluzione calcolata è corretta.');
else
    disp('La soluzione calcolata non è corretta.');
end
