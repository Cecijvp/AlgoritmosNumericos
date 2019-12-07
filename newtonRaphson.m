function [x,i] = newtonRaphson(f,a,b)

    fsym = sym(f); % convierte la funci�n f a simbolica para poder derivar
    dfs = diff(fsym); % deriva simbolicamente
    df= matlabFunction(dfs);  % lo regresa a una funci�n que pueda usar despues
    
    x= (b+a)/2;
    
    tol = eps();
    MAX=53;
    i=0;
    
    condition = true;
    
    %ser� un do while
    while condition
        xp = x;
        x = xp - f(xp) /df(xp);
        i=i+1;
        condition = abs((x-xp)/x)> tol &&i<MAX;
    end
    
    

end

