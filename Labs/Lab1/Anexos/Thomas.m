function [X y]  = Thomas(a,b,c,d)

n = length(b);
cd=1:n;
ld=1:n-1;
ud=1:n-1;
y = zeros(n,1);
X = zeros(n,1);

%Descomposición LU
cd(1)=b(1);
ud(1)=c(1);
ld(1)=a(1)/cd(1);

for k=2:n-1
    cd(k)=b(k) - (ld(k-1)*ud(k-1));
    ld(k)=a(k)/cd(k);
    ud(k)=c(k);
end;
cd(n) = b(n) - (ld(n-1)*ud(n-1)); 

%Sustitución hacia adelante.
y(1) = d(1);
for i = 2:n
  y(i) = d(i)-ld(i-1)*y(i-1);
end

%Sustitución hacia atras.
X(n)= y(n)/cd(n);
i = n-1;
while (i>0)
   sum = ud(i) * X(i + 1);
   X(i)=(y(i)-sum)/cd(i);
   i = i - 1;
end;  
    
end