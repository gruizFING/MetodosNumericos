N = 10^6;

h = (2 * pi)/N ;

a = zeros(1,N);

b = zeros(1,N+1);

c = zeros(1,N);

d = zeros(1,N+1);

for i = 1:N
    a(i) = h-2;
    b(i) = 4-2*(h^2);
    c(i) = -2-h;
end
b(N+1) = 4-2*(h^2);

i = 1;
for k = 0:h:2*pi
    d(i)=2*h^2*sin(k);
    i=i+1;
end

Y1 = Thomas (a,b,c,d);
