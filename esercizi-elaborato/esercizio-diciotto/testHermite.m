function tests = testHermite
    tests = functiontests(localfunctions);
end

function testHermiteInterpolation(testCase)
    % Definisci alcuni valori di test
    xi = [1; 2; 3];
    fi = [3; 2; 4];
    f1i = [1; 2; 1];
    xx = [1.5; 2.5]; % ascisse in cui vogliamo valutare la funzione

    % Chiama la funzione hermite
    yy = hermite(xi, fi, f1i, xx);

    % Verifica i risultati
    expected_yy = [2.75; 3.25]; % Valori attesi per xx = [1.5; 2.5]
    tolerance = 1e-10; % Tolleranza per la verifica delle uguaglianze
    verifyEqual(testCase, yy, expected_yy, 'AbsTol', tolerance);
end
