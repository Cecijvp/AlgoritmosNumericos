function [x,i] = gss(f,a,b)
% 
% phi= (1 + sqrt(5))/2;
% g = (phi -1);
% tol = sqrt(eps);
% d = g*(b-a);
% x1 = a+d;
% x2 = b-d;
% x = (a+b)/2;
% fx1 = f(x1);
% fx2 = f(x2);
% i=0;
% MAX = 52;
% while abs((b-a)/x)> tol && i <MAX 
%     if fx1 < fx2
%         a = x2;
%         x2 = x1;
%         d = g*(b-a);
%         x1 = a + d;
%     else
%        b = x1;
%        x1 = x2;
%        d = g*(b-a);
%        x2 =  b - d;
%     end
%     x = (b+a)/2;
%     i = i+1;
% end
phi= (1 + sqrt(5))/2;
g = (phi -1);
tol = sqrt(eps);
x = (a+b)/2;
i=0;
MAX = 52;
 while abs((b-a)/x)> tol && i <MAX 
     d = g*(b-a);
     x1 = a+d;
     x2 = b-d;
     if f(x1) < f(x2)
         a = x2;
     else
         b=x1;
     end
     x = (b+a)/2;
     i = i+1;
 end
end

