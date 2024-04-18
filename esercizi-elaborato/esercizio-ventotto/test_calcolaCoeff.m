function test_calcolaCoeff()
    % Test caso di grado 1
    n = 1;
    coef_expected = [1/2; 1/2];
    coef_actual = calcolaCoeff(n);
    assert(isequal(coef_actual, coef_expected), 'Errore nel calcolo dei coefficienti per n = 1');

    % Test caso di grado pari maggiore di 1
    n = 4;
    coef_expected = [1; 4; 1];
    coef_actual = calcolaCoeff(n);
    assert(isequal(coef_actual, coef_expected), 'Errore nel calcolo dei coefficienti per n = 4');

    % Test caso di grado dispari maggiore di 1
    n = 3;
    coef_expected = [1; 3; 1];
    coef_actual = calcolaCoeff(n);
    assert(isequal(coef_actual, coef_expected), 'Errore nel calcolo dei coefficienti per n = 3');

    % Aggiungi ulteriori casi di test se necessario
end
