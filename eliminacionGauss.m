function x = eliminacionGauss(A,B)
%eliminacionGauss es una función para poder resolver
% ecuaciones lineales a través de matrices utilizando
% el metodo de Gauss sin pivoteo.
% donde A es la matriz de coeficientes  
%y B la de terminos independientes 
[m,n] = size(A); % para saber de que tamaño es la matriz de A

if m ~= n 
    error("La matríz A debe ser cuadrada");
end
if m~= size(B)
    error("La matríz B no es del mismo tamaño");
end
Ab= [A,B]; % matriz aumentada
nb = n+1;
%foward elimination : reduce un sistema a su formaescalonada de fila
%a partir de la cual se puede saber si no hay soluciones,
%una solución única o infinitas soluciones.
for j = 1:n-1 %columnas
    for i = j+1: m % renglones
        factor = Ab(i,j)/Ab(j,j);
        Ab(i,j:nb) = Ab(i,j:nb)-factor*Ab(j,j:nb);
    end
end
%backward substitution: continúa utilizando operaciones de fila
%hasta que encuentra la solución; 
%En otras palabras, pone la matriz en forma escalonada reducida.
x = zeros(n,1);
x(n) = Ab(n,nb)/Ab(n,n);
for i = n-1: -1:1 %renglones
    x(i) =(Ab(i,nb) - Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
end
x(i);
end


