% Calcola i pesi delle formule di Newton-Cotes per i gradi da 1 a 7 e 9
n_values = [1:7, 9];

for n = n_values
    coef = calcolaCoefficientiGrado(n);
    fprintf('Grado %d: Pesi = [', n);
    for i = 1:length(coef)-1
        [num, den] = rat(coef(i), 1e-10); % Approssima il peso a un numero razionale
        fprintf('%d/%d, ', num, den);
    end
    [num, den] = rat(coef(end), 1e-10); % Approssima il peso a un numero razionale
    fprintf('%d/%d]\n', num, den);
end
