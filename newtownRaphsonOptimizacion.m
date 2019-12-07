function [x,i,min] = newtownRaphsonOptimizacion(f,a,b)

fsym = sym(f); % convierte la función f a simbolica para poder derivar
    dfs = diff(fsym); % deriva simbolicamente
    df= matlabFunction(dfs);
    dfs2 = diff(dfs);
    df2 = matlabFunction(dfs2);
    
 x= (b+a)/2;
    
    tol = eps();
    MAX=53;
    i=0;
    
    condition = true;
    
    %será un do while
    while condition
        xp = x;
        x = xp - df(xp) /df2(xp);
        i=i+1;
        condition = abs((x-xp)/x)> tol && df(x)~=0 && i<MAX;
       
    end
    % if df2(x) > 0
     %       min = true;
     %   else
      %      min =false;
       % end
    min = df2(x)>0; 
    
end

