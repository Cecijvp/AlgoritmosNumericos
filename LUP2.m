function [L,U, P,s] = LUP2(A)
% Esquina superior derecha es la U (eliminación de Gauss)
% Esquina inferior izquierda es la L (son los multiplicadores)
[n,m] = size(A);          
    if n~=m, error('Matrix A must be square'), end
    
    s = 0; % Cada que se intercambia un renglón, se suma 1 a S.
    U = A;
    L = eye(n);
    P = eye(n);
    
    for j = 1 : n-1
        % Buscar mayor valor absoluto en columna actual (partial pivoting)
        [~,m] = max(abs(U(j:n,j))); % el indice de donde se encuentra el valor mayor 
         may = m+j-1;
         if U(may,j) == 0, error('Matriz is singular'), end
          % Para determinar si hay solunción única
        if U(j,j) == 0, error('Matrix U is singular'), end
        % Intercambiar renglones 
        if j~= may % intercambio para que me quede el máximo arriba
            U([j, may],j:n) = U([may, j],j:n); 
            L([j, may],1:j-1) = L([may, j],1:j-1); % Los dos puntos quiere decir todas las columnas
            P([j, may],:) = P([may, j],:);
            s = s+1;
        end
       
        % Para determinar si hay solunción única
        if U(n,n) == 0, error('Matrix U is singular'), end
        
        for i = j+1 : n
            mult = U(i,j)/U(j,j); % El multiplicador es el elemento por el
                                  % que se multiplica la ecuación para eliminar algún elemento en Gauss
            L(i,j) = mult;
            k=j:n; % si aqui ponemos j en lugar de j+1 me pone ceros es lo que me eestoy ahorrando
            U(i,k) = U(i,k) - mult*U(j,k);  
        end
         if U(may,j) == 0, error('Matriz is singular'), end
    end
end

