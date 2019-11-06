function invA = inversaLU( A )
    [m, n] = size(A);
    invA=zeros(m, m);
    [L, U, P] = LUconPivote(A);
    B=eye(m);
    for j = 1:m
        d = zeros(m,1);
        B(:,j)=P*B(:,j);
        d(1) = B(1,j);
        for i = 2:m
            d(i) = B(i,j) - L(i,1:i-1)*d(1:i-1); 
        end
        x = zeros(m, 1);
        x(n) = d(m)/U(m,n);
        for i = m-1:-1:1
            d(i) = d(i) - U(i,i+1:n)*x(i+1:n);
            x(i) = d(i)/U(i,i);
        end
        invA(:,j) = x;
    end
end

