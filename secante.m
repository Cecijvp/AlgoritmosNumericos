function [x,i] = secante(f,a,b)
    
    
    tol = eps();
    MAX=53;
    i=0;
    condition = true;
    
    %será un do while
    while condition
        xp = x;
        x = xp - f(xp) /df(xp);
        i=i+1;
        condition = abs((x-xp)/x)> tol &&i<MAX;
    end
end

