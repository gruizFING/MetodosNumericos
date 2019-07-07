function x = SustMb(n,r,s,U,L,b)

y=zeros(n,1);
x=zeros(n,1);

y(1) = b(1);
k=1;
for i=2:n
    sum = 0;
    if (i > s+1)
        k = k+1;
    end;
    for j=k:i-1
        sum = sum + L(i,j)*y(j);
    end;
    y(i) = b(i) - sum;
end;
  
x(n)=y(n)/U(n,n);
i=n-1;
while (i > 0)
    sum=0;
    j=i+1;
    while (j<=n) && (j<=i+r)
           sum = sum + U(i,j)*x(j);
           j=j+1;
    end;
    x(i)= (y(i) - sum)/U(i,i);
    i=i-1;
end;
    
end