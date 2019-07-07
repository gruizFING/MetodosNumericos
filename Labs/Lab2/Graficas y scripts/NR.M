function [i y X] = NR(u,w,Uo,Wo)

    X(1,1) = u;
    X(2,1) = w;

    i = 1;
    MaxIter = 1000;
    tol = 10;
    tolMax = 10^-10;

    while (i<MaxIter) && (tol>tolMax) && (norm((gradPhi(X(1,i),X(2,i),Uo,Wo))) > 10^-10)
        di = hesPhi(X(1,i),X(2,i)) \ (-gradPhi(X(1,i),X(2,i),Uo,Wo));
        X(1:2,i+1) = X(1:2,i) + di(1:2);
        i=i+1;
        aux(1:2) = X(1:2,i) - X(1:2,i-1);
        tol = norm(aux);
    end

    y(1:2,1) = X(1:2,i);
    i = i - 1;

end
