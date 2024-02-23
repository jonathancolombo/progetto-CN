% Definizione della funzione e della sua jacobiana
fun = @(x) [x(1)^2 + x(2)^2 - 1; x(1)^2 - x(2)];
jacobian = @(x) [2*x(1), 2*x(2); 2*x(1), -1];

% Approssimazioni iniziali e parametri
x0 = [0.5; 0.5];
tol = 1e-6;
maxit = 100;

% Chiamata alla funzione di Newton
[x, nit] = newton(fun, jacobian, x0, tol, maxit);

% Visualizzazione dei risultati
disp('Soluzione trovata:');
disp(x);
disp(['Numero di iterazioni: ', num2str(nit)]);
