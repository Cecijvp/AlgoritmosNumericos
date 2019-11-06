function [L,U,P,sv] = LUPTarea(A)
 [n,m] = size(A);          
    if n~=m, error('Matrix A must be square'), end
     sv = ones(n,1);
     U=A;
     P= eye(n);
     L= eye(n);
    for j = 1 : n-1 % Para el úlimo nel 
        % Buscar mayor valor absoluto en columna actual (partial pivoting)
        [~,m] = max(abs(U(j:n,j)));% Quiero saber en que renglon esta el mayor, regresa el índice lineal 
        % La m es el renglón en el que se encuentra el mayor valor,
        % calculamos el máxmimo sobre un vector 
        may = m+j-1;
        % Intercambiar renglones 
        if j~= may
            % Intercambio para que me quede el máximo hasta arriba 
            U([j, may],j:n) = U([may, j],j:n); % Falta optimizar : significa intercambiar todas las columnas 
            % No quiero intercambiar todas las columnas porque hay mucho
            % cero 
            sv(j)=-1;
            P([j, may],:) = P([may, j],:);
            L([j, may],1:j-1) = L([may, j],1:j-1);
           %S=S+1 % Cada que intercambiamos sumamos
        end
       %Es necesario pivotear 
    end
    
   


end



