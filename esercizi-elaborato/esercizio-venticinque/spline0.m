function yy = spline0(x, y, xq)
% yy = spline0(x, y, xq)
% funzione per il calcolo della spline cubica naturale nei punti di interpolazione x
% Input:
%   x - vettore delle coordinate x
%   y - valori della funzione alle coordinate x
%   xq - vettore dei punti in cui calcolare il polinomio
% Output:
%   yy - valori della spline nei punti xq
if any(size(x) ~= size(y)) || length(x) ~= length(unique(x))
    error("Dimensioni dei dati errate!");
end
n= length(x);
if length(y) ~= n
    error("Dati errati");
end
n=n-1;
h(1:n)= x(2:n+1) - x(1:n);
phi= h(2:n-1)./(h(2:n-1) + h(3:n));
csi= h(2:n-1)./(h(1:n-2) + h(2:n-1));
alpha(1:n-1) = 2;
df= y;
for j=1:2
    for i=n+1:-1:j+1
        df(i)=(df(i) - df(i-1))/(x(i) - x(i-j));
    end
end
df=df(1, 3:n+1);
df=6*df;
% valutazione della spline
m=tridia(alpha, phi, csi, df);
m=[0, m, 0];
yy = zeros(size(xq));
j = 1;
for i=2:n+1
    ri= y(i-1) - (h(i-1)^2)/6 * (m(i-1));
    qi= (y(i) - y(i-1))/h(i-1) - h(i-1)/6*(m(i) - m(i-1));
    while j<= length(xq) && xq(j) <= x(i)
        yy(j)= ((xq(j) - x(i-1))^3*m(i)+(x(i) -xq(j))^3*m(i-1))/ ...
            (6*h(i-1))+qi*(xq(j)-x(i -1))+ ri;
        j= j+1;
    end
end
return

function x= tridia(alpha, phi, csi, x)
n= length(alpha);
for i= 1:n-1
    phi(i)=phi(i)/alpha(i);
    alpha(i+1)=alpha(i+1)- phi(i)*csi(i);
    x(i+1)=x(i+1)- phi(i)*x(i);
end
x(n)= x(n)/alpha(n);
for i=n-1:-1:1
    x(i)=(x(i) - csi(i)*x(i+1))/alpha(i);
end
return