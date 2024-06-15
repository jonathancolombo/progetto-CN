function A = mialdlt(A)
% mialdl(A) effettua la fattorizzazione della matrice A con il metodo
% di fattorizzazione LDLt
% Input:
% A = matrice simmetrica definita positiva da fattorizzare
% Output:
% A = matrice fattorizata

[m,n] = size(A);
if m~=n
    error("Errore: La matrice deve essere quadrata");
end
if A(1,1)<=0
    error('Errore: La matrice deve essere sdp');
end
A(2:n,1)=A(2:n,1)/A(1,1); %fattorizzazione LDLT
for i=2:n
    v = (A(i,1:i-1).').*diag(A(1:i-1,1:i-1));
    A(i,i) = A(i,i)-A(i,1:i-1)*v;
    if A(i,i)<=0
        error("Errore: La matrice deve essere sdp");
    end
    A(i+1:n,i) = (A(i+1:n,i)-A(i+1:n,1:i-1)*v)/A(i,i);
end
return