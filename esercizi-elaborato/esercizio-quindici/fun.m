function [f, jacobian] = fun(x)
%
%   [f, jacobian] = fun(x);
%
%   Calcola il gradiente della funzione f(x) e la matrice Hessiana
%   di f(x).
%
%   Input:
%       x - vettore delle ascisse.
%
%   Output:
%       f - gradiente della funzione f(x);
%       jacobian - matrice Hessiana di f(x).
%

    % Forza x a essere un vettore colonna
    x = x(:);
    
    % Dimensione del vettore x
    n = length(x);
    
    % Costruzione della matrice Q
    Q = 4 * eye(n) + diag(ones(n-1, 1), 1) + diag(ones(n-1, 1), -1);
    
    % Vettore di tutti uno
    e = ones(n, 1);
    
    % Parametri alfa e beta
    alfa = 2;
    beta = -1.1;
    
    % Definizione del gradiente
    grad = @(x) Q * x - alfa * e .* sin(alfa * x) - beta * e .* exp(-x);
    
    % Definizione della matrice Hessiana (Jacobian del gradiente)
    Jac = @(x) Q - alfa^2 * diag(e .* cos(alfa * x)) + beta * diag(e .* exp(-x));
    
    % Calcolo del gradiente f(x)
    f = grad(x);
    
    % Calcolo della matrice Hessiana jacobian(x)
    jacobian = Jac(x);
    
end
