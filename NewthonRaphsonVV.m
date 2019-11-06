function [x,i] = NewthonRaphsonVV(f,J,x)
    tol = eps();
    MAX=53;
    fa = f(x);
    i=0;
    condition = any(fa);
    
    while condition
        xp = x;
        fa= f(xp);
        x = xp-J(xp)\fa;
        i=i+1;
       condition = i< MAX &&any(f(x))&& norm((x-xp)./x,Inf)>tol ;
    end
end

