function f=diffdivher(x,f)
%function per calcolare le differenze divise per il polinomio interpolante di hermite
n=(length(f)/2)-1;
for i=2*n+1:-2:3
    f(i)=(f(i)-f(i-2))/(x(ceil(i/2))-x(ceil((i-1)/2)));
end
for j= 2:2*n+1
    for i=(2*n+2):-1:j+1
        f(i)=(f(i)-f(i-1))/(x(ceil(i/2))-x(ceil((i-j)/2)));
    end
end
end