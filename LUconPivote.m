function [ L, U, P] = LUconPivote( A )
%p matriz de permutación

    [m, n] = size(A);
    P = eye (n);
    for j = 1:n-1         %columnas
        [~, ind] = max(abs(A(j:n, j)));
        index=ind+j-1;
        if index ~=j
            A([j, index], : ) = A([index, j], : );
            P([j, index], : ) = P([index, j], : );
        end
        for i = j+1:m     %renglones
            mult = A(i,j)/A(j,j);
            A(i,j) = mult;
            k=j+1:n;
            A(i,k) = A(i,k) - mult*A(j,k);      
        end
    end
    L=tril(A, -1);
    U=triu(A);
end
