function x  = LUsolucion(A,b)

[n,m] = size(A);
[L,U,P,S] = LUP2(A);
Pb = P*b;
% Resolver LY= Pb por sustitución empezando arriba 
y = zeros(n,1);
y(1)= Pb(1);
for i =2:n
    %j =1:i-1;
    y(i)=Pb(i)-L(i,l:i-1)*y(1:i-1);
    %i =i+1;
    
end
% Resolver Ux= y por subtitución empezando abajo
% Calculo del determinante por diversión 
x = zeros(n,1);
x(n) = y(n)/U(n,n);
for i = n-1:-1:1
    x(i) = (y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
end

