function [ x, i ]= Jacobi2(A,b)
    if ~isDiagonallyDominant(A), error("No converge"); end
    D = diag(diag(A));
    L = tril(A , -1);
    U = triu(A, 1);
    cond = true;
    MAX = 100;
    tol = 0.00001;
    
    i=0;
    x=zeros(size(b));
    E = L+U;
    while cond
        xp = x;
        x = D\(b-E*x);
        i = i+1;
        cond = norm((x-xp)./x,Inf)>tol && i<MAX;
    end
end
