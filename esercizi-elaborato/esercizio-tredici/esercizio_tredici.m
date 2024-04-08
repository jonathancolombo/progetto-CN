%Utilizzare la function miaqr per risolvere, nel senso dei minimi quadrati, il sistema
%lineare sovradeterminato
% Definizione della matrice A e del vettore dei termini noti b
A = [7,2,1; 8,7,8; 7,0,7; 4,3,3; 7,0,10];
b = [1,2,3,4,5];
disp('matrice dei coefficienti');
disp(A);
disp('vettore dei termini noti');
disp(b);


% Chiamata alla funzione miaqr per calcolare la fattorizzazione QR del sistema sovradimensionato Ax = b
[x, nr] = miaqr(A, b.');

% Verifica della soluzione calcolata
disp('Soluzione calcolata:');
disp(x);
disp('Norma calcolata: ');
disp(nr);