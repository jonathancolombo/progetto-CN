function [x, nit] = newton(fun, x0, tol, maxit)
%[x, nit]=newton(fun, x0, tol, maxit)
%La funzione calcola la soluzione di un sistema di equazioni non lineare
%F(x)=0, dove F è una funzione vettoriale R^m -> R^m, 0 è una m-upla di
%zeri e x è il vettore soluzione m×1.
%Input:
%fun-funzione matlab che oltre a restituire il valore di F(x) deve anche
%restituire F'(x), il valore della matrice Jacobiana, dato un m-upla x,
%attraverso la sintassi [f, jacobian]=f(x).
%x0-punto iniziale dell'iterazione per risolvere il sistema.
%tol-tolleranza prefissata.
%maxit-numero massimo di iterazioni consentite al metodo.
%Output:
%x-vettore soluzione m×1.
%nit-numero di iterazioni eseguite
%release 13-02-2024.
if nargin<2||nargin>4
    error("numero di argomenti errati");
end
if nargin==2
    tol=1e-3;
    maxit=1e3;
end
if nargin==3
    maxit=1e3;
end
if tol<=0||maxit<=0
    error("argomenti errati");
end
x0=x0(:);
flag=0;
nit=0;
x=x0;
for i=1:maxit
    [Fx, dFx]=feval(fun,x);
    [dx,isSing]=mialum(dFx,-Fx);
    if isSing==1
        warning("matrice Jacobiana singolare, metodo interrotto");
        return
    end
    if norm(dx./(1+abs(x)),inf)<=tol
        flag=1;
        break;
    end
    x=x+dx;
    nit=nit+1;
end
if flag~=1
    warning("livello di tolleranza non raggiunta");
end
return
end
