function [ x, i ]= GaussSeidel2(A,b)
   if ~isDiagonallyDominant(A), error("No converge"); end
    D = diag(diag(A));
    L = tril(A , -1);
    U = triu(A, 1);
    cond = true;
    MAX = 100;
    i=0;
    tol = 0.00001;
    x=zeros(size(b));
    E = L+U;
    while  cond
        xP=x;
        x = (D+L)\(b-U*x);
        i = i+1;
        cond = j< MAX && norm((x-xP)./x,Inf)>tol; %norm(lo que quieres, Inf) devulve el max(abs(norm)) 
    end
end

