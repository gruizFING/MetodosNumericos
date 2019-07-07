function [L U] = EgMb(n,r,s,A)

U=A;
L=eye(n);

for k=1:n-1
    i=k+1;    
    while (i<=n) && (i<=k+s)
        L(i,k)=U(i,k)/U(k,k);
        j=k;
        while (j<=n) && (j<=k+r)
            U(i,j)=U(i,j) - L(i,k)*U(k,j);
            j=j+1;
        end;
        i=i+1;
    end;
end;

end