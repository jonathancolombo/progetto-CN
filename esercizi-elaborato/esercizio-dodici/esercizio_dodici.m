% Generazione del sistema lineare An
n = 100; % dimensione della matrice
listA = cell(n,1);% genero una lista di 100 elementi eterogenei

for i = 1:n
    A = -1 * ones(i);
    for j= 1:i
        A(j,j) = i; %faccio l'assegnazione del valore n-esimo sull'elemento diagonale
    end
listA{i} = A;
end

listResults = cell(n,1);
listDiag = cell(n,1);

for i = 1:n
    listResults{i} = mialdlt(listA{i});
    listDiag{i} = diag(listResults{i});
end

x = 1;
y = listDiag{1};
plot(x,y, "*");
hold on; %crea una sola finestra graficando tutte le curve
for i=2:n
    x = 1:i;
    y = listDiag{i};
    plot(x,y, "*");
end

hold off;% fa si che il grafico sia completato in un unica finestra