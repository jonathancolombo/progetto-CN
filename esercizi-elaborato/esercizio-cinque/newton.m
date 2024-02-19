function [x,flag] = newton( f, f1, x0, tolx, maxit )
%
%[x,flag] = newton( f, f1, x0, tolx [, maxit] )
%
%Metodo di Newton per determinare una approssimazione
%della radice di f(x)=0 con tolleranza (mista) tolx, a
%partire da x0, entro maxit iterationi (default = 100).
%f1 implementa f%(x) mentre in uscita flag vale -1, se
%la tolleranza non è soddisfatta entro maxit iterate o
%la derivata si annulla, altrimenti ritorna il numero
%di iterazioni richieste.
%

if nargin<4, error('numero argomenti insufficienti')
elseif nargin==4, maxit = 100;
end
if tolx<eps, error('tolleranza non idonea'), end
x = x0;
flag = -1;
for i = 1:maxit
    fx = feval( f, x );
    f1x = feval( f1, x );
    if f1x==0, break, end
    x = x - fx/f1x;
    if abs(x-x0)<=tolx*(1+abs(x0)), flag = i; break
    else, x0 = x;
    end
end
return
