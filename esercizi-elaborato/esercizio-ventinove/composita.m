function [If , err] = composita (fun, a, b, k, n)
% [If , err] = composita (fun, a, b, k, n)
% Input: 
%   fun: funzione integranda, a,b: estremi sinistro e destro dell'intervallo di integrazione 
%   k: grado della formula di quadratura composita di Newton-Cotes 
%   n: numero di sottointervalli in cui suddividere l'intervallo di integrazione
% Output: 
%   If: approssimazione dell'integrale ottenuta, err: stima dell'errore di quadratura.
if k<1
    error("Grado k errato");
end
if a > b
    error ('Estremi intervallo di integrazione errati');
end
if(mod(n, k) ~= 0 || mod(n/2, 2)~= 0)
    error("n non multiplo pari di k");
end
tol = 1e-3;
mu = 1 + mod (k ,2);
c = calcolaCoefficientiGrado(k);
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

function coef=calcolaCoefficientiGrado(n)
% coef=calcolaCoefficientiGrado(n)
% Calcola i pesi della quadratura della formula di quadratura di
% Newton-Cotes di grado n.
% Input
%   n: Grado (maggiore di 0) della formula di Newton-Cotes di cui vogliamo conoscere i pesi
%   della quadratura
% Output
%   coef: pesi della quadratura della formula di grado desiderato
if(n<=0), error("Valore del grado della formula di Newton-Cotes non valido"),end
coef=zeros(n+1,1);
if (mod(n,2) == 0)
    for i=0:n/2-1
        coef(i+1)=calcolaCoefficienti(i,n);
    end
    coef(n/2+1)=n-sum(coef)*2;
    coef((n/2)+1:n+1)=coef((n/2)+1:-1:1);
else
    for i=0:round(n/2,0)-2
        coef(i+1)=calcolaCoefficienti(i,n);
    end
    coef(round(n/2,0))=(n-sum(coef)*2)/2;
    coef(round(n/2,0)+1:n+1)=coef(round(n/2,0):-1:1);
end
return
end

function cin=calcolaCoefficienti(i,n)
%Calcola il peso della quadratura della formula di Newton-Cotes numero i di grado n
d=i-[0:i-1 i+1:n];
den=prod(d);
a=poly([0:i-1 i+1:n]);
a=[a./((n+1):-1:1) 0];
num=polyval(a,n);
cin=num/den;
end