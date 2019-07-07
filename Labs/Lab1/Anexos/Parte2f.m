
N=10^6;
%h de la primera ecuacion y1.
h1 = 2*pi/N;
%h de la segunda y tercera ecuación y2 e y3.
h2 = 1/N;

%Ecuacion y1 parte a)
%EDO) y1'' + y1' + y1 + sin(t) = 0
%y1(0)=0, y1(2*pi)=0, t pertenece al intervalo [0 2*pi].

c2 = (-1 + exp(-pi)*cos(sqrt(3)*pi))/(exp(-pi)*sin(sqrt(3)*pi));
i=1;
y1 = zeros(N+1,1);
for t=0:h1:2*pi
    y1(i) = -exp(-t/2)*cos((sqrt(3)*t)/2) + c2*exp(-t/2)*sin((sqrt(3)*t)/2) + cos(t);
    i=i+1;
end;

%Ecuacion y2 parte b) e y3 parte c)
%y2'' + y2 + exp(t) = 0
%y3'' + t*y3' = 0
%y2(0)=0, y2(1)=1
%y3(0)=0, y3(1)=1 
%t perteneciente al intervalo [0 1].
t = erf(1/sqrt(2))*sqrt(pi)/2;
c = log(1/sqrt(2)/t);

i=1;
y2 = zeros(N+1,1);
y3 = zeros(N+1,1);
c3 = (2 - cos(1) + exp(1))/(2*sin(1));
for t=0:h2:1
    y2(i) = cos(t)/2 + c3*sin(t) - exp(t)/2; 
    y3(i) = exp(c)*sqrt(2)*erf(t/sqrt(2))*sqrt(pi)/2;
    i=i+1;
end

t1 = 0:h1:2*pi;
t2 = 0:h2:1;

plot(t1,y1,'r');
axis([0 2*pi min(y1) max(y1)]);
legend('y1');
xlabel('t');
ylabel('y(t)');
plot(t2,y2,'k',t2,y3,'b');
axis([0 1 0 max(y2)]);
legend('y2','y3');
xlabel('t');
ylabel('y(t)');