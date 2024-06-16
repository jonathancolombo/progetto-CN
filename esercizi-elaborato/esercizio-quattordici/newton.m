function [x, nit] = newton(fun, x0, tol, maxit)
%
%   [x, nit] = newton(fun, x0, tol, maxit);
%
%   Metodo di Newton per la risoluzione di sistemi di equazioni non lineari
%
%   Input:
%       fun - identificatore di una function che restituisce la coppia
%           [f, jacobian] dove f è il gradiente di una funzione f(x) di
%           cui vogliamo approssimare una radice, mentre jacobian
%           è la matrice Hessiana di f(x);
%       x0 - vettore valori iniziali;
%       tol - tolleranza (default = 1e-6);
%       maxit - numero massimo di iterazioni (default = 1000).
%
%   Output:
%       x - soluzione del sistema;
%       nit - numero di iterazioni eseguite.
%

    % Imposta i valori predefiniti per tol e maxit se non specificati
    if nargin < 2
        error('Numero di argomenti in ingresso errato');
    elseif nargin == 2
        tol = 1e-6;
        maxit = 1000;
    elseif nargin == 3
        maxit = 1000;
    elseif maxit <= 0 || tol <= 0
        error('Dati in ingresso errati');
    end

    % Forza x0 a essere un vettore colonna
    x0 = x0(:);
    
    % Inizializza il numero di iterazioni
    nit = maxit;

    % Loop iterativo del metodo di Newton
    for i = 1:maxit
        % Calcola il gradiente e la matrice Hessiana
        [f, jacobian] = fun(x0);
        
        % Risolvi il sistema lineare jacobian * delta = -f
        delta = mialum(jacobian, -f);
        
        % Aggiorna x
        x = x0 + delta;
        
        % Verifica la condizione di convergenza
        if norm(delta ./ (1 + abs(x0)), inf) <= tol
            nit = i;
            break
        end
        
        % Aggiorna x0 per la prossima iterazione
        x0 = x;
    end
end

% Funzione ausiliaria per la risoluzione di sistemi lineari (LU senza pivoting)
function x = mialum(A, b)
    % Fattorizzazione LU senza pivoting
    [L, U] = lu_no_pivot(A);
    
    % Risolvi il sistema Ly = b
    y = forward_substitution(L, b);
    
    % Risolvi il sistema Ux = y
    x = backward_substitution(U, y);
end

% Fattorizzazione LU senza pivoting
function [L, U] = lu_no_pivot(A)
    [n, ~] = size(A);
    L = eye(n);
    U = A;
    for i = 1:n-1
        if U(i, i) == 0
            error('Matrice singolare');
        end
        for j = i+1:n
            L(j, i) = U(j, i) / U(i, i);
            U(j, i:n) = U(j, i:n) - L(j, i) * U(i, i:n);
        end
    end
end

% Risoluzione del sistema triangolare inferiore Ly = b
function y = forward_substitution(L, b)
    n = length(b);
    y = zeros(n, 1);
    for i = 1:n
        y(i) = (b(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
    end
end

% Risoluzione del sistema triangolare superiore Ux = y
function x = backward_substitution(U, y)
    n = length(y);
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
    end
end
