function det = determinante(A)
    % el determinante de A = det L * det U 
    %producto de la diagonal de U * (-1)^s
    try
    [L,U, P,s] = LUP2(A);
    det =(-1)^2*prod(diag(U));
    catch
       det =0;
    end
end

