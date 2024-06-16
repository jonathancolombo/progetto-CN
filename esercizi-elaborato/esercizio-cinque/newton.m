function [x, it, count] = newton( f, f1, x0, tolx, maxit )
%
% [x, it, count] = newton( f, f1, x0, tolx, maxit)
% Metodo di Newton per determinare una approssimazione
% della radice di f(x)=0 con tolleranza (mista) tolx, a
% partire da x0, entro maxit iterationi (default = 100).
% f1 implementa f%(x) mentre in uscita flag vale -1 se
% tolleranza non soddisfatta entro maxit iterate o
% la derivata si annulla, altrimenti ritorna il numero
% di iterazioni richieste.

if maxit <0
    maxit=100;
end
if tolx<0
    error('Tolleranza non idonea');
end
it = 0;
count=0;
x = x0 ;
m = 5;
for i =1: maxit
    x0 = x ;
    fx = feval (f , x0 );
    f1x = feval ( f1 , x0 );
    count=count+2;
    if f1x==0
        error('Derivata prima uguale a zero! Metodo non convergente');
    end
    x = x0 - (fx / f1x) ;
    x = x0 - m *(fx / f1x) ; riga da scommentare per il metodo di newton modificato, 
                            % dell'esercizio 7 con m = 5
    it = it + 1;
    if abs (x - x0 ) <= tolx *(1+ abs ( x ))
        break
    end
end
if ( abs (x - x0 ) > tolx *(1+ abs ( x )))
    disp (' Il metodo non converge ')
end
end
