function x= Jacobi(A,b)
    n = length(b)
    x= zeros(n,1)

    U = triu(A)
    d = diag(A)
    L = tril(A,-1)
    j=1
    cond = true;
    MAX = 50;
    tol = 0.00001;
    while  cond
        xP=x;
        x(1) = (b(1)-(U(1,2:n)*xP(2:n)))/d(1);
        for i=2:n-1
            x(i) = (b(i)-(U(i,1:i-1)*xP(1:i-1)+L(i,i+1:n)*xP(i+1:n)))/d(i);
        end
        j = j+1;
        x(n)=(b(n)-(L(n,1:n-1)*xP(1:n-1)))/d(n);
        cond = j< MAX && norm((x-xP)./x,Inf)>tol; %norm(lo que quieres, Inf) devulve el max(abs(norm)) 
    end
end

