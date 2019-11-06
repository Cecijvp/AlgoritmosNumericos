function [x,i] = maximoDescenso(A,b,x)
    if  ~esPositivaDefinida(A), error("La matriz no es positiva definida"), end
    
     tol = eps;
     i=0;
     MAX=50;
     r = b-A*x;
     cond = any(r);
         
    while  cond
     xp= x;
     alfa = dot(r,r)/(r'*A*r);
     x = xp + alfa*r;
     r=b-A*x;
     i=i+1;
    cond = i< MAX && norm((x-xp)./x,Inf)>tol && any(r); %norm(lo que quieres, Inf) devulve el max(abs(norm)) 
    end
end

