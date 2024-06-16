%Utilizzare la function miaqr per risolvere, nel senso dei minimi quadrati, il sistema
%lineare sovradeterminato
% Definizione della matrice A e del vettore dei termini noti b
A = [7,2,1; 8,7,8; 7,0,7; 4,3,3; 7,0,10];
b = [1,2,3,4,5];
disp('matrice dei coefficienti');
disp(A);
disp('vettore dei termini noti');
disp(b);

b = [1; 2; 3; 4; 5];

% Definizione dei pesi omega
omega = [0.5; 0.5; 0.75; 0.25; 0.25];
omega = omega ./ 2.25; % normalizzo i pesi in modo che la loro somma sia 1.

B = eye(5) .* sqrt(omega);
A = B * A;
b = B * b;

[x, pw] = miaqr(A, b);

disp('La soluzione x: ');
disp(x);
fprintf('La norma pesata del residuo: %.10f\n', pw);