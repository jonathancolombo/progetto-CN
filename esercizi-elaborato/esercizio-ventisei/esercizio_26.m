f = @(x) 1 ./ (1 + x.^ 2);
a = 0;
b = 10;
xq = linspace(a, b, 10001); % Ascisse sulle quali calcolare il valore
fxq = f(xq);
e_nat = zeros(1, 200); % Matrice degli errori spline naturale
e_nak = zeros(1, 200); % Matrice degli errori spline not-a-knot
h = zeros(1, 200); % Distanze h
index = 1;
for n = 4:4:800
    xi = linspace(a, b, n+1); % Ascisse equidistanti
    fi = f(xi); % Valori della funzione sulle ascisse
    % Genera la spline naturale usando spline0
    s_ni = spline0(xi, fi, xq);
    % Genera la spline not-a-knot usando spline
    s_naki = spline(xi, fi, xq);
    % Calcola l'errore massimo per entrambe le spline
    e_nat(index) = max(abs(fxq - s_ni));
    e_nak(index) = max(abs(fxq - s_naki));
    % Calcola la distanza h
    h(index) = 10 / n;
    index = index + 1;
end

% Plot
figure;
loglog(h, e_nat, 'r', h, e_nak, 'b');
xlabel('Distanza h');
ylabel('Errore massimo');
title('Errore massimo di interpolazione con spline naturale e not-a-knot');
legend('Naturale', 'Not-A-Knot');
grid on;
