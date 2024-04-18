function test_composita()
    % Test caso corretto
    fun = @(x) x.^2; % Funzione integranda
    a = 0; % Estremo sinistro
    b = 1; % Estremo destro
    k = 2; % Grado della formula di quadratura composita
    n = 4; % Numero di sottointervalli
    [If, err] = composita(fun, a, b, k, n);
    If_expected = 1/3; % Integrale esatto di x^2 da 0 a 1
    err_expected = 0; % Errore atteso
    assert(abs(If - If_expected) < 1e-3, 'Errore nell''approssimazione dell''integrale');
    assert(abs(err - err_expected) < 1e-3, 'Errore nella stima dell''errore di quadratura');

    % Aggiungi ulteriori casi di test se necessario
end
