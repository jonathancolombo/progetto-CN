function YQ = spline0(X, Y, XQ)
% YQ=spline=(X,Y,XQ)
% Calcola i valori approssimati della funzione calcolati attraverso una funzione spline
% cubica naturale interpolante la funzione.
%Input
% X: Vettore colonna contenente le ascisse di interpolazione,
% Y: Vettore colonna contenente i valori che la funzione assume nelle ascisse di interpolazione
% XQ: Vettore contenente le ascisse di cui vogliamo approssimare la funzione
%Output
% YQ: Valori approssimati della funzione interpolata attraverso una funzione spline cubica naturale
%
if(length(X)~=length(Y))
    error('Lunghezza dei dati in ingresso non valida!');
end
if (length(X) ~= length(unique(X)))
    error('Ascisse di interpolazione non distinte!');
end
if(isempty(XQ))
    error('Il vettore contenente le ascisse in cui interpolare la funzione non contiene elementi!');
end
if(size(X,2)>1||size(Y,2)>1)
    error('Inserire vettori colonna!');
end
n=length(X)-1;
eps=zeros(n-1,1);
p=zeros(n-1,1);
for i = 1 : n - 1
    p(i)=(X(i+1)-X(i))/(X(i+2)-X(i));
    eps(i)=(X(i+2)-X(i+1))/(X(i+2)-X(i));
end
dif = diffdivspline(X, Y);
m = tridia(2*ones(n-1,1), p, eps,dif*6);
m=[0;m;0];
YQ = calcolapuntixq(X, Y, m, XQ);
end

function[ df ] = diffdivspline(x, f)
% Calcola le differenze divise fermandosi
% per ottenere le differenze divise tra tre punti per calcolare m
n=size(x);
df=f;
n=n-1;
for j=1:2
    for i=n+1:-1:j+1
        df(i)=(df(i)-df(i-1))/(x(i)-x(i-j));
    end
end
df=df(3:n+1);
return;
end

function x=tridia(a,b,c,x)
% Calcola il sistema tridiagonale in cui il vettore a
% contiene solo 2 mentre i vettori b e c rispettivamente i valori p ed eps
% mentre x vettore delle differenze divise per ricavare il vettore
% contenente i valori m
n=length(a);
for i=1:n-1 % fattorizzazione LU
    b(i)=b(i)/a(i);
    a(i+1)=a(i+1)-b(i)*c(i);
    x(i+1)=x(i+1)-b(i)*x(i);
end
x(n)=x(n)/a(n); %risoluzione LU
for i=n-1:-1:1
    x(i)=(x(i)-c(i)*x(i+1))/a(i);
end
return
end

function s = calcolapuntixq( xi, fi, m, XQ)
%s = calcolapuntixq( xi, fi, m, XQ)
%Calcola i valori della spline precedentemente ricavata grazie ai valori m
%nei punti XQ anche se essi si trovano al di fuori dell' intervallo di interpolazione
n = length(xi)-1;
z=length(XQ);
s=zeros(z,1);
[xi,p]=sort(xi); %ordino i vettori delle ascisse in modo che formino una partizione vera e propria
%e ordino anche il vettore dei corrispondenti valori della funzione in tali ascisse
fi=fi(p);
for j=1:z
    for i=2:n+1
        if((XQ(j)>=xi(i-1)&& XQ(j)<=xi(i))||XQ(j)<xi(1))
            hi=xi(i)-xi(i-1);
            ri=fi(i-1)-hi^2/6*m(i-1);
            qi=(fi(i)-fi(i-1))/hi-hi/6*(m(i)-m(i-1));
            s(j) =((XQ(j)-xi(i-1))^3*m(i)+(xi(i)-XQ(j))^3*m(i-1))/(6*hi)+qi*(XQ(j)-xi(i-1))+ri;
            break
        elseif(XQ(j)>xi(n+1))
            hi=xi(n+1)-xi(n);
            ri=fi(n)-hi^2/6*m(n);
            qi=(fi(n+1)-fi(n))/hi-hi/6*(m(n+1)-m(n));
            s(j) =((XQ(j)-xi(n))^3*m(n+1)+(xi(n+1)-XQ(j))^3*m(n))/(6*hi)+qi*(XQ(j)-xi(n))+ri;
            break
        end
    end
end
end