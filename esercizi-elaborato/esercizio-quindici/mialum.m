function [x, isSing]=mialum(A,b)
%x=mialum(A,b)
%mialum(A,b) calcola la soluzione al sistema lineare Ax=b, con A matrice
%quadrata n×n non singolare e b vettore dei termini noti n×1. La
%risoluzione del sistema passa prima per una fattorizzazione Lu con
%pivoting parziale di A. È la versione modificata di mialu definita
%appositamente per la funzione newton in modo che non venga fermato in caso
%di matrice A singolare.
%Input:
%A-matrice dei coefficienti. Deve essere non singolare e quadrata.
%b-colonna dei termini noti. Ha lo stesso numero di righe di A.
%Output:
%x-vettore soluzione n×1.
%isSing-valore booleano messo a 1 se A è singolare.
%release 14-02-2024.
[m,n]=size(A);
if m~=n||~iscolumn(b)||m~=length(b)
    error("Argomenti non compatibili")
end
isSing=0;
tol=n*eps*norm(A,inf);
%fattorizzazione LU con pivoting di A
p=1:n;
for j=1:n
    [mj,kj]=max(abs(A(j:n,j)));
    if mj<=tol
        isSing=1;
        x=0;
        return;
    end
    kj=kj+j-1;
    if kj>j
        A([j kj],:)=A([kj j],:);
        p([j kj])=p([kj j]);
    end
    A(j+1:n,j)=A(j+1:n,j)/A(j,j);
    A(j+1:n,j+1:n)=A(j+1:n,j+1:n)-A(j+1:n,j)*A(j,j+1:n);
end
%risoluzione sistema PAx=Pb, in particolare Ly=Pb
x=b(p);
for j=1:n-1
    x(j+1:n)=x(j+1:n)-x(j)*A(j+1:n,j);
end
%risoluzione sistema Ux=y
for j=n:-1:1
    x(j)=x(j)/A(j,j);
    x(1:j-1)=x(1:j-1)-x(j)*A(1:j-1,j);
end
return
end

