function x = mialum(A, b)
%   x = mialum(A, b);
%
%   Risolve il sistema lineare Ax = b con fattorizzazione LU senza
%   pivoting parziale.
%
%   Input:
%       A - matrice dei coefficienti;
%       b - vettore dei termini noti.
%
%   Output:
%       x - soluzione del sistema lineare Ax = b.

% Controllo dimensioni matrice
[m, n] = size(A);
if m ~= n
    error('La matrice in input non è quadrata');
end
if n ~= length(b)
    error('Vettore b non compatibile con la matrice A');
end

% Fattorizzazione LU
for i = 1:n-1
    if A(i, i) == 0
        error('Matrice singolare');
    end
    for j = i+1:n
        A(j, i) = A(j, i) / A(i, i);
        A(j, i+1:n) = A(j, i+1:n) - A(j, i) * A(i, i+1:n);
    end
end

% Soluzione per L y = b
x = b(:);
for i = 2:n
    x(i:n) = x(i:n) - A(i:n, i-1) * x(i-1);
end

% Soluzione per U x = y
for i = n:-1:1
    x(i) = x(i) / A(i, i);
    x(1:i-1) = x(1:i-1) - A(1:i-1, i) * x(i);
end
end
