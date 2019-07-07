N = 10^6;

h = 1/N ;

a = zeros(1,N);

b = zeros(1,N+1);

c = zeros(1,N);

d = zeros(1,N+1);

for i = 1:N+1
    b(i) = 4;
end

i = 1;
for k = 0:h:1-h
    a(i)=h*k - 2;
    c(i)= -h*k - 2;
    i=i+1;
end

d(N+1)= 2 + h*(1-h);

Y3 = Thomas (a,b,c,d);
