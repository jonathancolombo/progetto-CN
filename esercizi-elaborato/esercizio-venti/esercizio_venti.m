xi = [0; 2.5; 5]; % Ascisse per l'interpolazione
xx = linspace(0, 5, 100); % 100 punti per il grafico

% Definizione delle funzioni e valutazione di queste
f = @(x) exp(x / 2 + exp(-x)); % Funzione interpolanda
f1 = @(x) (1 / 2 - exp(-x)) .* exp(x / 2 + exp(-x)); % Derivata prima della funzione interpolanda
fi = f(xi);
f1i = f1(xi);

% Calcolo del polinomio interpolante di Hermite
yy = hermite(xi, fi, f1i, xx);

% Preparazione per calcolo della derivata del polinomio interpolante
n = length(xi);
y = zeros(1, 2 * n);
x = zeros(1, 2 * n);
for i = 1:n
    y(2 * i - 1:2 * i) = [fi(i); f1i(i)];
    x(2 * i - 1:2 * i) = [xi(i); xi(i)];
end

dd = diffdivher(x, y); % Differenze divise
dy = horner_modificato(x, dd, xx); % Calcolo della derivata prima del polinomio interpolante

% Grafico
figure;

subplot(2, 1, 1); % Primo subplot per le funzioni
hold on;
plot(xx, f(xx), 'b', 'LineWidth', 1.2); % Funzione interpolanda in blu
plot(xx, yy, 'g', 'LineWidth', 1.2); % Polinomio interpolante in verde
plot(xi, fi, 'ro'); % Punti di interpolazione
hold off;
xlabel('Ascisse');
ylabel('Ordinate');
title('Funzione interpolanda e polinomio interpolante');
legend('Funzione interpolanda', 'Polinomio interpolante', 'Punti di interpolazione', 'Location', 'best');

subplot(2, 1, 2); % Secondo subplot per le derivate
hold on;
plot(xx, f1(xx), 'c', 'LineWidth', 1.2); % Derivata della funzione interpolanda in ciano
plot(xx, dy, 'm', 'LineWidth', 1.2); % Derivata del polinomio interpolante in magenta
plot(xi, f1i, 'ro'); % Punti di interpolazione delle derivate
hold off;
xlabel('Ascisse');
ylabel('Ordinate');
title('Derivata della funzione interpolanda e del polinomio interpolante');
legend('Derivata funzione interpolanda', 'Derivata polinomio interpolante', 'Punti di interpolazione delle derivate', 'Location', 'best');

% Verifica grafica delle condizioni di interpolazione
figure;
hold on;
plot(xi, fi, 'ro', 'MarkerSize', 8, 'DisplayName', 'f(xi)'); % Condizioni p(xi) = f(xi)
plot(xi, f1i, 'bx', 'MarkerSize', 8, 'DisplayName', 'f''(xi)'); % Condizioni p'(xi) = f'(xi)
hold off;
xlabel('Ascisse');
ylabel('Ordinate');
title('Condizioni di interpolazione');
legend('Location', 'best');

