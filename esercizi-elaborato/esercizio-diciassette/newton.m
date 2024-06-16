function YQ = newton(X,Y,XQ)
% function YQ = newton(X,Y,XQ)
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