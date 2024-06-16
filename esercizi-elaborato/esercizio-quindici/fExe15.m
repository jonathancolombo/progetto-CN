format long;
n = 50;
x0 = zeros(n, 1);
tol = [1e-3, 1e-8, 1e-13];
colors = {'b', 'r', 'm'};
L = zeros(n, length(tol));

% Ciclo per le diverse tolleranze
for i = 1:length(tol)
    x = newton(@fun, x0, tol(i));
    figure;
    plot(1:n, x, 'Color', colors{i});
    title(['Tolleranza ', num2str(tol(i))]);
    xlabel('Indice radice');
    ylabel('Valore di x');
    L(:,i) = x;
end

disp('Soluzioni:');
disp(L);