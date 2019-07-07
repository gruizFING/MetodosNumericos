function [i y X] = Broyden(u,w,Uo,Wo)

    Ai = hesPhiaprox(u,w,Uo,Wo);
    
    i = 2;
    MaxIter = 4000;
    tolMax = 10^-10;
    X(1:2,1) = [u w]';
    X(1:2,2) = X(1:2,1) - (Ai \ gradPhi(u,w,Uo,Wo));
    TolMaxInv = 10^-10;
    TolInv = 10;
    aux1(1)= X(1,2) - X(1,1);
    aux1(2)= X(2,2) - X(2,1);
    tol = norm(aux1);
    while (i <= MaxIter) && (tol > tolMax) && (TolInv > TolMaxInv) && (norm(gradPhi(X(1,i),X(2,i),Uo,Wo)) > 10^-7)
        
        S = X(1:2,i) - X(1:2,i-1);
        Y = gradPhi(X(1,i),X(2,i),Uo,Wo) - gradPhi(X(1,i-1),X(2,i-1),Uo,Wo);
        Ai = Ai + (1/(S'*S))*(Y - (Ai*S))*S';
        TolInv = abs(det(Ai));
        if (TolInv > TolMaxInv)
            X(1:2,i+1) = X(1:2,i) - (Ai \ gradPhi(X(1,i),X(2,i),Uo,Wo));
            aux1(1)=X(1,i+1) - X(1,i);
            aux1(2)=X(2,i+1) - X(2,i);
            tol = norm(aux1);
            i=i+1;
        end
    end
    
    y(1:2,1) = X(1:2,i);
    i = i - 1;
    
end
