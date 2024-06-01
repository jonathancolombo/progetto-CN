% Definizione della funzione di Runge
f = @(x) 1 ./ (1 + x.^2);

% Generare i punti di valutazione equispaziati nell'intervallo [-5, 5]
XQ = linspace(-5, 5, 10001)';

% Valori esatti della funzione di Runge nei punti di valutazione
YQ_exact = f(XQ);

% Preallocazione del vettore per l'errore
error_lagrange = zeros(1, 50);
error_newton = zeros(1, 50);

% Calcolo dell'errore di interpolazione per i gradi n=2:2:100
for k = 1:50
    n = 2 * k;
    
    % Ascisse di Chebyshev
    X = cheby(n, -5, 5)';
    
    % Valori della funzione di Runge nelle ascisse di Chebyshev
    Y = f(X);
    
    % Interpolazione con polinomio di Lagrange
    YQ_lagrange = lagrange(X, Y, XQ);
    
    % Interpolazione con polinomio di Newton
    YQ_newton = newton(X, Y, XQ);
    
    % Calcolo dell'errore massimo in valore assoluto
    error_lagrange(k) = max(abs(YQ_lagrange - YQ_exact));
    error_newton(k) = max(abs(YQ_newton - YQ_exact));
end

% Graficare l'andamento dell'errore in scala semilogaritmica
figure;
semilogy(2:2:100, error_lagrange, 'b-o', 'DisplayName', 'Lagrange');
hold on;
semilogy(2:2:100, error_newton, 'r-+', 'DisplayName', 'Newton');
hold off;
xlabel('Grado del polinomio');
ylabel('Errore massimo di interpolazione');
title('Andamento errore di interpolazione per la funzione di Runge');
legend('Location', 'NorthEast');
grid on;


function x =cheby(n,a,b)
% function x = cheby(n,a,b)
% Input: n: grado del polinomio interpolante, a,b: estremi dell'intervallo di interpolazione
% Output: x: ascisse di Chebyshev ricavate
% Ricava le ascisse di Chebyshev nell'intervallo [a,b] per un polinomio interpolante di grado n
if(n<0), error('Grado del polinomio interpolante non valido!'),end
if(a>=b), error('Intervallo definito in maniera non corretta!'),end
n=n+1;
x(n:-1:1)=(a+b)/2+((b-a)/2)*cos(((2*(1:n)-1)*pi)/(2*n));
end

function YQ = lagrange(X,Y,XQ)
% Input: X: Vettore colonna contenente le ascisse d'interpolazione che
% devono essere distinte.
% Y: Vettore colonna contenente i valori della funzione nelle ascisse
% d'interpolazione.
% XQ: Vettore colonna contenente le ascisse di cui vogliamo approssimare la funzione
%
% Output:
% YQ: Valori approssimati della funzione con il polinomio interpolante in
% forma di Lagrange.
% Calcola i valori approssimati della funzione(di cui conosciamo i valori Y che assume nelle ascisse X)
% calcolati attraverso il polinomio interpolante in forma di Lagrange nelle ascisse XQ.
if(length(X)~=length(Y)), error('Numero di ascisse di interpolazione e di valori della funzione sono diversi!'),
end
if (length(X) ~= length(unique(X))), error('Ascisse di interpolazione non distinte!'),
end % unique per restituire un vettore con x distinte
if(isempty(XQ)), error('Il vettore contenente le ascisse in cui interpolare la funzione non contiene nessun elemento!'),
end
if(size(X,2)>1||size(Y,2)>1||size(XQ,2)>1),error('Inserire vettori colonna!'),
end
n=size(X,1);
L=ones(size(XQ,1),n);
for i=1:n
    for j=1:n
        if (i~=j)
            L(:,i)=L(:,i).*((XQ-X(j))/(X(i)-X(j))); %calcolo i polinomi di base di lagrange Lin(x)
        end
    end
end
YQ=zeros(size(XQ));
for i=1:n
    YQ=YQ+Y(i).*L(:,i); %calcolo la sommatoria dei prodotti fi*Lin(x) (con i=0,...,n))
end
end

function YQ = newton(X,Y,XQ)
% function YQ=newton(X,Y,XQ)
% Implementa in modo vettoriale la forma di Newton del polinomio interpolante una funzione.
% Input:
% X: Vettore colonna contenente le ascisse d'interpolazione che
% devono essere distinte.
% Y: Vettore colonna contenente i valori della funzione nelle ascisse d'interpolazione
% XQ: Vettore contenente le ascisse di cui vogliamo approssimare la
% funzione.
% Output: YQ: Valori approssimati della funzione con il polinomio interpolante in forma di Newton
% Calcola i valori approssimati della funzione(di cui conosciamo i valori Y che assume nelle ascisse X)
% calcolati attraverso il polinomio interpolante in forma di Newton nelle ascisse XQ.

if(length(X)~=length(Y)), error('Numero di ascisse di interpolazione e di valori della funzione non uguale!'),
end
if (length(X) ~= length(unique(X))), error('Ascisse di interpolazione non distinte!'),
end %uso la function unique che restuisce un vettore contenente i valori di x distinte
if(isempty(XQ)), error('Il vettore contenente le ascisse in cui interpolare la funzione non ha elementi!'),
end
if(size(X,2)>1||size(Y,2)>1),error("Inserire vettori colonna!"),
end
df=divdif(X,Y);
n=length(df)-1;
YQ=df(n+1)*ones(size(XQ));
for i=n:-1:1 %algoritmo di horner
    YQ=YQ.*(XQ-X(i))+df(i);
end
return
end
function df=divdif(x,f)
%function per il calcolo delle differenze divise per il polinomio interpolante in forma di newton
n=size(x);
if(n~=length(f)), error('Dati errati!'), end
df=f;
n=n-1;
for i=1:n
    for j=n+1:-1:i+1
        df(j)=(df(j)-df(j-1))/(x(j)-x(j-i));
    end
end
return;
end