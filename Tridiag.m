function x = Tridiag(e,f,g,r)
    n = length(f);
    
    %foward elimination
    for k=1:n-1
        factor = e(k+1)/f(k);
        f(k+1) = f(k+1) - factor*g(k);
        r(k+1) = r(k+1) - factor*r(k);
    end
    %backsubstitution
    x(n)= r(n)/f(n);
    for k=n-1;-1:1
        x(k) = (r(k)-g(k)*x(k+1))/f(k);
    end
    

end

