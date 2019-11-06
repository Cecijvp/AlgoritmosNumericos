function x= GaussSeidel(A,b)
% la diferencia con Jacobi es que Jacobi usa los valores ya calculados
% para obtener los siguientes valores, por lo que GaussSeidel convergera 
%más rápido.
    n = length(b);
    x= zeros(n,1);

    L = triu(A)
    D = diag(A)
    U = tril(A,-1)
    j=1;
    cond = true;
    MAX = 50;
    tol = 0.00001;
    while  cond
        xP=x;
        x(1) = (b(1)-(U(1,2:n)*xP(2:n)))/D(1);
        for i=2:n-1
            x(i) = (b(i)-(U(i,1:i-1)*xP(1:i-1)+L(i,i+1:n)*x(i+1:n)))/D(i);
        end
        j = j+1;
        x(n)=(b(n)-(L(n,1:n-1)*x(1:n-1)))/D(n);
        cond = j< MAX && norm((x-xP)./x,Inf)>tol; %norm(lo que quieres, Inf) devulve el max(abs(norm)) 
    end
end

