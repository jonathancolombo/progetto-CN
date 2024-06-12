% Test per la funzione horner_derivata_prima

% Definizione dei parametri di ingresso
x = [0, 1, 2, 3];        % Ascisse per i polinomi di base di Newton
a = [1, 2, 3, 4];        % Coefficienti del polinomio
xq = [0, 1, 2, 3];       % Ascisse in cui valutare la derivata prima

% Valutazione della derivata prima con la funzione horner_derivata_prima
p1_calcolata = horner_derivata_prima(x, a, xq);

% Valutazione della derivata prima attesa
% La derivata del polinomio di esempio è:
% p'(x) = 2 + 6(x - 0) + 12(x - 0)(x - 1)
p1_attesa = [2, 14, 38, 74]; 

% Confronto dei risultati
tolleranza = 1e-10;
differenza = abs(p1_calcolata - p1_attesa);

if all(differenza < tolleranza)
    disp('Test superato: la derivata prima calcolata coincide con quella attesa.');
else
    disp('Test fallito: la derivata prima calcolata non coincide con quella attesa.');
    fprintf('Derivata calcolata: %s\n', mat2str(p1_calcolata));
    fprintf('Derivata attesa: %s\n', mat2str(p1_attesa));
    fprintf('Differenza: %s\n', mat2str(differenza));
end
