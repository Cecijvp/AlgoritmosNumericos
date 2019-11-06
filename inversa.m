function inv = inversa(A)

    [n,m] = size(A);
    [L,U,P,S] = LUP2(A);
    IdP = P*eye(n); % identidad 
    
    for k=1:n
        % Resolver LY= Pb por sustitución empezando arriba 
        y = zeros(n,1);
        y(1)= IdP(1,k);
        for i =2:n
            y(i)=IdP(i,k)-L(i,l:i-1)*y(1i-1);

        end
        % Resolver Ux= y por subtitución empezando abajo
        % Calculo del determinante por diversión 
        x = zeros(n,1);
        x(n) = y(n)/U(n,n);
        for i = n-1:-1:1
            x(i) = (y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
        end
    end
            inv(:,k) = IdP(:,k);
        end