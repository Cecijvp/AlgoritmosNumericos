function y = difeFinitas(a,b,ya,yb,N)

h= (b-a)/(N-1);
f= -(2+4*h^2)*ones(N-2,1);
e= ones(N-2,1);
g= ones(N-2,1);
r= zeros(N-2,1);
r(1)=-ya;
r(N-2)=-yb;
w = Tridiag(e ,f,g,r)
y=zeros(N,1);
y(1)=ya;
y(2:N-1,1) =w;
y(N,1)=yb;
end

