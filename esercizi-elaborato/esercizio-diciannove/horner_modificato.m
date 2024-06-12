function p1 = horner_modificato(x, a, xq)
%   p1 = horner_derivata_prima(x, a, xq);
%   Calcola la derivata prima di un polinomio p(x), con coefficienti 'a'
%   rappresentato nella base di Newton.
%   Input:
%       x - vettore delle ascisse per i polinomi di base di Newton;
%       a - coefficienti del polinomio;
%       xq - vettore delle ascisse in cui valutare la derivata prima del
%           polinomio.
%   Output:
%       p1 - derivata prima del polinomio valutata nelle ascisse xq.
if nargin < 3
    error('Numero di parametri insufficienti');
end
n = length(x);
if n ~= length(a)
    error('Parametri in ingresso errati');
end
p = a(n);
p1 = 0;
for i = n-1:-1:1
    p1 = p + (xq - x(i)) .* p1;
    p = a(i) + (xq - x(i)) .* p;
end
return
