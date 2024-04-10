function tests = testLebesgue
    tests = functiontests(localfunctions);
end

function testLebesgueErrorConditions(testCase)
    % Test per verificare il comportamento della funzione con input errati
    % Verifica che venga generato un errore quando a >= b
    verifyError(testCase, @() lebesgue(2, 1, [1, 2], 0), 'MATLAB:assertion:Failed');

    % Verifica che venga generato un errore quando nn contiene numeri non interi non negativi
    verifyError(testCase, @() lebesgue(0, 1, [1.5, 2], 0), 'MATLAB:assertion:Failed');

    % Verifica che venga generato un errore quando type non è 0 o 1
    verifyError(testCase, @() lebesgue(0, 1, [1, 2], 2), 'MATLAB:assertion:Failed');
end

function testLebesgueOutput(testCase)
    % Test per verificare l'output della funzione con input corretti

    % Verifica che l'output sia una matrice con le dimensioni corrette
    a = 0; b = 1; nn = [1, 2, 3]; type = 0;
    ll = lebesgue(a, b, nn, type);
    verifySize(testCase, ll, [3, 1]); % Verifica che ll sia una matrice 3x1

    % Verifica che i valori dell'output siano corretti
    expected_ll = [2, 3, 4]'; % Valori attesi per nn = [1, 2, 3]
    verifyEqual(testCase, ll, expected_ll, 'AbsTol', 1e-10);
end
