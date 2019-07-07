function H = hesPhiaprox(u,w,Uo,Wo)
    
    h = sqrt(eps);
    aux = [u w] + h;
    y1 = gradPhi(aux(1),aux(2),Uo,Wo);
    y = gradPhi(u,w,Uo,Wo);
    H(1,1) = (y1(1) - y(1)) * h^-1;
    H(2,2) = (y1(2) - y(2)) * h^-1;
    H(1,2) = 0;
    H(2,1) = 0;
end