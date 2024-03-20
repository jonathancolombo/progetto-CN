function [Fx, dFx]=fExe15(x)
%[Fx, dFx]=fExe15(x)
%f(x)=0.5*x^t*Q*x+e^t*[cos(alfa*x)+beta*exp(-x)]. Con Q, alfa e beta
%forniti dall'esercizio. La funzione fExe15 definisce la funzione
%vettoriale F: R^m -> R^m usata nell'esercizio 15 per la risoluzione del
%sistema non lineare derivante dalla determinazione del punto stazionario
%di f. fExe15 va inoltre a resituire la matrice Jacobiana associata a F
%calcolata in x.
%Input:
%x-m-upla in entrata
%Output:
%Fx-immagine di F in x. Vettore 50×1.
%dFx-matrice Jacobiana di F in x. Matrice 50×50.
%release 13-02-2024
if length(x)~=30
    error("argomenti incompatibili");
end
x=x(:);
Fx=zeros(30,1);
Fx(1)=4*x(1)+x(2)-2*sin(2*x(1))+1.1*exp(-x(1));
for i=2:29
    Fx(i)=4*x(i)+x(i-1)+x(i+1)-2*sin(2*x(i))+1.1*exp(-x(i));
end
Fx(30)=4*x(30)+x(29)-2*sin(2*x(30))+1.1*exp(-x(30));
dFx=zeros(30,30);
dFx(1,1)=4-4*cos(2*x(1))-1.1*exp(-x(1));
dFx(1,2)=1;
for i=2:29
    dFx(i,i)=4-4*cos(2*x(i))-1.1*exp(-x(i));
    dFx(i,i-1)=1;
    dFx(i,i+1)=1;
end
dFx(30,29)=1;
dFx(30,30)=4-4*cos(2*x(30))-1.1*exp(-x(30));
return
end