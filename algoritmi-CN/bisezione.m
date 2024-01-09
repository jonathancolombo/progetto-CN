function [x] = bisezione(a,b)
fa = feval(f,a); %ricavo fa tramite f e a
fb = feval(f,b); %ricavo fb tramite f e b
x = (b-a) / 2; %calcolo x tramite b e a
fx = feval(f,x);
imax = ceil(log2(b-a) - log2(tolx)); %calcolo le n iterazioni massime possibili
for i=2:imax
    f1x = abs((fb -fa) / (b-a)); %pongo il valore assoluto in questa operazione
    if (abs(fx) <= tolx * f1x)
        break;
    elseif (fa * fx < 0)
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end
    x = (a + b) / 2;
    fx = feval(f,x);
end