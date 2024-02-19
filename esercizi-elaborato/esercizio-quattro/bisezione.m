%Esercizio 4 Scrivere una function Matlab che implementi in modo efficiente
% il metodo di bisezione.
function x = bisezione( a, b, f, tolx )
%
% x = bisezione( a, b, f, tolx ) Metodo di bisezione per calcolare
% una radice di f(x), interna ad [a,b], con tolleranza tolx.
%
if a >= b
    error('estremi intervallo errati');
end
if tolx<=0
    error('tolleranza non appropriata');
end
fa = feval(f,a);
fb = feval(f,b);
if fa*fb>=0 
    error('intervallo di confidenza non appropriato')
end
imax = ceil( log2(b-a)-log2(tolx) );
if imax<1
    x = (a+b)/2;
    return 
end
for i = 1:imax
    x = (a+b)/2;
    fx = feval( f, x );
    f1x = abs(fb-fa)/(b-a);
    if abs(fx)<=tolx*f1x
        break
    elseif fa*fx<0
        b = x; fb = fx;
    else
        a = x; fa = fx;
    end
end
return

