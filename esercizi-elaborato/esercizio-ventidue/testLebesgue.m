% Script to plot Lebesgue constants for polynomial interpolation

% Define the intervals
intervals = [0 1; -5 8];

% Define the range of degrees
nn = 1:100;

% Preallocate space for Lebesgue constants
ll_equidistant = zeros(length(nn), 2);
ll_chebyshev = zeros(length(nn), 2);

% Calculate Lebesgue constants for each interval
for k = 1:2
    a = intervals(k, 1);
    b = intervals(k, 2);
    ll_equidistant(:, k) = lebesgue(a, b, nn, 0);
    ll_chebyshev(:, k) = lebesgue(a, b, nn, 1);
end

% Plot results for interval [0,1] with equidistant nodes
figure;
plot(nn, ll_equidistant(:, 1), 'b');
title('Lebesgue Constant for Interval [0,1] (Equidistant Nodes)');
xlabel('Degree of Polynomial (n)');
ylabel('Lebesgue Constant');
grid on;

% Plot results for interval [0,1] with Chebyshev nodes
figure;
plot(nn, ll_chebyshev(:, 1), 'r');
title('Lebesgue Constant for Interval [0,1] (Chebyshev Nodes)');
xlabel('Degree of Polynomial (n)');
ylabel('Lebesgue Constant');
grid on;

% Plot results for interval [-5,8] with equidistant nodes
figure;
plot(nn, ll_equidistant(:, 2), 'b');
title('Lebesgue Constant for Interval [-5,8] (Equidistant Nodes)');
xlabel('Degree of Polynomial (n)');
ylabel('Lebesgue Constant');
grid on;

% Plot results for interval [-5,8] with Chebyshev nodes
figure;
plot(nn, ll_chebyshev(:, 2), 'r');
title('Lebesgue Constant for Interval [-5,8] (Chebyshev Nodes)');
xlabel('Degree of Polynomial (n)');
ylabel('Lebesgue Constant');
grid on;

function ll = lebesgue(a, b, nn, type)
% function ll = lebesgue(a, b, nn, type)
% Input: a,b = inizio e fine intervallo, nn = vettore con specificato il grado dei polinomi,
% type = specifica che tipo di ascisse di interpolazione usare
% se 0 utilizza le ascisse equispaziate nell'intervallo [a,b] altrimenti se
% 1 utilizza le ascisse di Chebyshev.
% Output: ll = vettore delle costanti di Lebesgue per ogni grado specificato in input
if a >= b
    error('Errore: a deve essere minore di b.');
end
if any(mod(nn, 1) ~= 0) || any(nn < 0)
    error('Errore: nn deve contenere solo numeri interi non negativi.');
end
if type ~= 0 && type ~= 1
    error('Errore: type deve essere 0 o 1.');
end
ll = ones(numel(nn), 1);
xq = linspace(a, b, 10001);
for j = 1:numel(nn)
    if type == 0 % Ascisse equidistanti
        x = linspace(a, b, nn(j)+1);
    else % Ascisse di Chebyshev
        x = cheby(nn(j), a, b);
    end
    lin = lebesgue_function(x,xq);
    ll(j) = max(abs(lin));
end
end


function lin = lebesgue_function(x,xq)
n = length(x);
if length(unique(x)) ~= n
    error('Errore: Alcune ascisse sono uguali.');
end
lin = zeros(size(xq));
for j = 1:n
    L = ones(size(xq));
    for i = 1:n
        if i ~= j
            L = L .* (xq - x(i)) / (x(j) - x(i));
        end
    end
    lin = lin + abs(L);
end
end


function x =cheby(n,a,b)
% function x = cheby(n,a,b)
% Input: n: grado del polinomio interpolante, a,b: estremi dell'intervallo di interpolazione
% Output: x: ascisse di Chebyshev ricavate
% Ricava le ascisse di Chebyshev nell'intervallo [a,b] per un polinomio interpolante di grado n
if(n<0), error('Grado del polinomio interpolante non valido!'),end
if(a>=b), error('Intervallo definito in maniera non corretta!'),end
n=n+1;
x(n:-1:1)=(a+b)/2+((b-a)/2)*cos(((2*(1:n)-1)*pi)/(2*n));
end