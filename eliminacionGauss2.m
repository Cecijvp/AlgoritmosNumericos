function x = eliminacionGauss2(A,B)
[m, n] = size(A);
    if m ~= n, error("La matriz no es cuadrada"), end
    if m ~= length(B), error("La matriz b no es del mismo tamaño que la matriz"), end
for j = 1:n-1         %columnas
        for i = j+1:m     %renglones
            mult = A(i,j)/A(j,j);
            k=j+1:n;
            A(i,k) = A(i,k) - mult*A(j,k);
%             for k = j:n     %debemos empezar en j+1
%                A(i,k)=A(i,k)-A(j,k)*mult;
%             end
            B(i) = B(i) - mult*B(j);         
        end
    end
    x = zeros(m, 1);
    x(n) = B(m)/A(m,n);
    for i = m-1:-1:1        %Renglones
        for j = n:-1:i+1      %Columnas
            B(i) = B(i) - A(i,j)*x(j);
        end
        x(i) = B(i)/A(i,i);
    end
    
end

