function tests = testCheby
    tests = functiontests(localfunctions);
end

function testChebyInterval(testCase)
    % Definisci alcuni valori di test
    n = 5; % grado del polinomio interpolante
    a = 0; % estremo inferiore dell'intervallo
    b = 1; % estremo superiore dell'intervallo

    % Chiama la funzione cheby per ottenere le ascisse di Chebyshev
    x = cheby(n, a, b);

    % Verifica che l'intervallo delle ascisse sia corretto
    verifyGreaterThanOrEqual(testCase, x, a); % Verifica che tutte le ascisse siano maggiori o uguali a a
    verifyLessThanOrEqual(testCase, x, b); % Verifica che tutte le ascisse siano minori o uguali a b
end

function testChebyLength(testCase)
    % Definisci alcuni valori di test
    n = 5; % grado del polinomio interpolante
    a = 0; % estremo inferiore dell'intervallo
    b = 1; % estremo superiore dell'intervallo

    % Chiama la funzione cheby per ottenere le ascisse di Chebyshev
    x = cheby(n, a, b);

    % Verifica che il numero di ascisse generato sia corretto
    expected_length = n + 1; % ci aspettiamo di ottenere n + 1 ascisse
    verifyEqual(testCase, length(x), expected_length);
end
