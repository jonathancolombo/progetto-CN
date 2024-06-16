% Definizione dei dati di prova
X = [1; 2; 3; 4];
Y = [1; 4; 9; 16];
XQ = [1.5; 2.5; 3.5];

% Calcolo dei valori interpolati
YQ = lagrange(X, Y, XQ);

% Visualizzazione dei risultati
disp('Ascisse di interpolazione:')
disp(XQ)
disp('Valori interpolati:')
disp(YQ)

% Plot della funzione originale e dei punti interpolati
figure;
plot(X, Y, 'o', XQ, YQ, 'x');
xlabel('X');
ylabel('Y');
title('Interpolazione di Lagrange');
legend('Dati originali', 'Interpolazione');
