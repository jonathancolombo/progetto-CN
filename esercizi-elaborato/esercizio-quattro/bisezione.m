function [x, it, count] = bisezione( a, b, f, tolx )
%
% [x, it, count] = bisezione( a, b, f, tolx ) 
% Metodo di bisezione per calcolare una radice di f(x), interna ad [a,b], con tolleranza tolx.
%
if a >= b
    error('Estremi intervallo errati');
end
if tolx<=0
    error('Tolleranza non appropriata');
end
count = 0;
fa = feval(f,a);
fb = feval(f,b);
if fa*fb>=0 
    error('Intervallo di confidenza non appropriato')
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
    count=count+2;
    if abs(fx)<=tolx*f1x
        break
    elseif fa*fx<0
        b = x; fb = fx;
    else
        a = x; fa = fx;
    end
end
it =  i;
return

