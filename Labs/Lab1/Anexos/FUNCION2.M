N = 10^6;

h = 1/N ;

a = zeros(1,N);

b = zeros(1,N+1);

c = zeros(1,N);

d = zeros(1,N+1);

for i = 1:N
    a(i) = -2;
    b(i) = 4-2*(h^2);
    c(i) = -2;
end
b(N+1) = 4-2*(h^2);

i = 1;
for k = 0:h:1-h
    d(i)=(2)*(h^2)*(exp(k));
    i=i+1;
end
d(i)=2*(h^2)*(exp(k+h))+2;

Y2 = Thomas (a,b,c,d);
