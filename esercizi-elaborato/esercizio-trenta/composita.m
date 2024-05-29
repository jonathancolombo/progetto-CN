function [If , err] = composita (fun, a, b, k, n)
%[If , err] = composita (fun, a, b, k, n)
%Input: 
% fun: funzione integranda, a,b: estremi sinistro e destro dell'intervallo di integrazione
% k: grado della formula di quadratura composita di Newton-Cotes
% n: numero di sottointervalli in cui suddividere l'intervallo di integrazione
%Output: 
% If: approssimazione dell'integrale ottenuta, 
% err: stima dell'errore di quadratura.
if k<1
error("grado k errato");
end
if a > b
error ('Estremi intervallo di integrazione errati');
end
if(mod(n, k) ~= 0 || mod(n/2, 2)~= 0)
error("n non e' un multiplo pari di k");
end
tol = 1e-3;
mu = 1 + mod (k ,2);
c = NewtonWeights (k);
x = linspace (a ,b , n +1);
fx = feval ( fun , x );
h = (b - a )/ n ;
If1 = h * sum ( fx (1: k +1).* c (1: k +1));
err = tol + eps ;
while tol < err
n = n *2; % raddoppio i punti
x = linspace (a ,b , n +1);
fx (1:2: n +1) = fx (1:1: n /2+1);
fx (2:2: n ) = feval ( fun , x (2:2: n ));
h = (b - a )/ n ;
If = 0;
for i = 1: k +1
If = If + h * sum ( fx ( i : k : n ))* c ( i );
end
If = If + h * fx ( n +1)* c ( k +1);
err = abs ( If - If1 )/(2^( k + mu ) -1);
If1 = If ;
end
return
end

function w = NewtonWeights(k)
    switch k
        case 1
            w = [1, 1] / 2;
        case 2
            w = [1, 4, 1] / 6;
        case 3
            w = [1, 3, 3, 1] / 8;
        case 4
            w = [7, 32, 12, 32, 7] / 90;
        case 5
            w = [19, 75, 50, 50, 75, 19] / 288;
        case 6
            w = [41, 216, 27, 272, 27, 216, 41] / 840;
        otherwise
            error('Grado k non supportato');
    end
end
