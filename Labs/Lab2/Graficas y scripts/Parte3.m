
W1 = 0;
W2 = -50;
W3 = -150;

iter = zeros(1,12);
iter2 = zeros(1,12);
iter3 = zeros(1,12);
iterB = zeros(1,12);
iter2B = zeros(1,12);
iter3B = zeros(1,12);
X1 = zeros(2,10);
X2 = zeros(2,10);
X3 = zeros(2,10);
X1B = zeros(2,10);
X2B = zeros(2,10);
X3B = zeros(2,10);

%Parte a
%N-R
u = [0 0 0];
w = [W1/4 W2/4 W3/4];
j = 1;
for U=0:1000:9000
    [iter(j) X] = NR(u(1),w(1),U,W1);
    X1(1:2,j) = X(1:2,1);
    [iter2(j) X] = NR(u(2),w(2),U,W2);
    X2(1:2,j) = X(1:2,1);
    [iter3(j) X] = NR(u(3),w(3),U,W3);
    X3(1:2,j) = X(1:2,1);
    u(1) = X1(1,j);
    u(2) = X2(1,j);
    u(3) = X3(1,j);
    w(1) = X1(2,j);
    w(2) = X2(2,j);
    w(3) = X3(2,j);
    j = j + 1;
end

plot(X1(1,:),X1(2,:),'-*k',X2(1,:),X2(2,:),':^r',X3(1,:),X3(2,:),'--p');

%Para U = 10000 NR
XE1 = zeros(2,2);
XE2 = zeros(2,2);
XE3 = zeros(2,2);
U = 10000;
[iter(j) XE1(1:2,1) H1] = NR(u(1),w(1),U,W1);
[iter2(j) XE2(1:2,1) H2] = NR(u(2),w(2),U,W2);
[iter3(j) XE3(1:2,1) H3] = NR(u(3),w(3),U,W3);
u(1) = XE1(1,1);
u(2) = XE2(1,1);
u(3) = XE3(1,1);
w(1) = XE1(2,1);
w(2) = XE2(2,1);
w(3) = XE3(2,1);

j = j + 1;
%Con U = 12000 NR
U = 12000;

[iter(j) XE1(1:2,2)] = NR(u(1),w(1),U,W1);
[iter2(j) XE2(1:2,2)] = NR(u(2),w(2),U,W2);
[iter3(j) XE3(1:2,2)] = NR(u(3),w(3),U,W3);
%Llega a un resultado erroneo!!

%Tomando como puntos iniciales (0,0) y (0,W2/4) y (0,W3/4).
[iter(j+1) XE1(1:2,3)] = NR(0,0,U,0);
[iter2(j+1) XE2(1:2,3)] = NR(0,W2/4,U,W2);
[iter3(j+1) XE3(1:2,3)] = NR(0,W3/4,U,W3);



%Broyden
u = [0 0 0];
w = [W1/4 W2/4 W3/4];
j = 1;
for U=0:1000:9000
    [iterB(j) X] = Broyden(u(1),w(1),U,W1);
    X1B(1:2,j) = X(1:2,1);
    [iter2B(j) X] = Broyden(u(2),w(2),U,W2);
    X2B(1:2,j) = X(1:2,1);
    [iter3B(j) X] = Broyden(u(3),w(3),U,W3);
    X3B(1:2,j) = X(1:2,1);
    u(1) = X1B(1,j);
    u(2) = X2B(1,j);
    u(3) = X3B(1,j);
    w(1) = X1B(2,j);
    w(2) = X2B(2,j);
    w(3) = X3B(2,j);
    j = j + 1;
end

plot(X1B(1,:),X1B(2,:),'-*k',X2B(1,:),X2B(2,:),':^r',X3B(1,:),X3B(2,:),'--p');

    
%Con U = 10000
U = 10000;
XEB1 = zeros(2,2);
XEB2 = zeros(2,2);
XEB3 = zeros(2,2);
[iterB(j) X M1] = Broyden(u(1),w(1),U,W1);
XEB1(1:2,1) = X(1:2,1);
[iter2B(j) X M2] = Broyden(u(2),w(2),U,W2);
XEB2(1:2,1) = X(1:2,1);
[iter3B(j) X M3] = Broyden(u(3),w(3),U,W3);
XEB3(1:2,1) = X(1:2,1);
u(1) = XEB1(1,1);
u(2) = XEB2(1,1);
u(3) = XEB3(1,1);
w(1) = XEB1(2,1);
w(2) = XEB2(2,1);
w(3) = XEB3(2,1);

j = j + 1;
    

%Con U = 12000
U = 12000;
[iterB(j) X] = Broyden(u(1),w(1),U,W1);
XEB1(1:2,2) = X(1:2,1);
[iter2B(j) X] = Broyden(u(2),w(2),U,W2);
XEB2(1:2,2) = X(1:2,1);
[iter3B(j) X] = Broyden(u(3),w(3),U,W3);
XEB3(1:2,2) = X(1:2,1);


%Graficas con U=0:1000:9000 en la abscisa y w en la ordenada
%NR
plot(0:1000:9000,X1(2,:),'-*k',0:1000:9000,X2(2,:),':^r',0:1000:9000,X3(2,:),'--p');
legend('W1','W2','W3');
xlabel('U');
ylabel('w');
%Broyden
plot(0:1000:9000,X1B(2,:),'-*k',0:1000:9000,X2B(2,:),':^r',0:1000:9000,X3B(2,:),'--p');
legend('W1','W2','W3');
xlabel('U');
ylabel('w');


%Comparacion de Métodos con U=0:1000:9000
plot(X1(1,:),X1(2,:),'-^r',X1B(1,:),X1B(2,:),':v');
legend('Newton-Raphson','Broyden');
xlabel('u');
ylabel('w');

plot(X2(1,:),X2(2,:),'-^r',X2B(1,:),X2B(2,:),':v');
legend('Newton-Raphson','Broyden');
xlabel('u');
ylabel('w');

plot(X3(1,:),X3(2,:),'-^r',X3B(1,:),X3B(2,:),':v');
legend('Newton-Raphson','Broyden');
xlabel('u');
ylabel('w');

%Cantidad de iteraciones
plot(0:1000:9000,iter(1:10),'--kp',0:1000:9000,iterB(1:10),':rh');
legend('Newton-Raphson','Broyden');
xlabel('U');
ylabel('Iteraciones');

plot(0:1000:9000,iter2(1:10),'--kp',0:1000:9000,iter2B(1:10),':rh');
legend('Newton-Raphson','Broyden');
xlabel('U');
ylabel('Iteraciones');

plot(0:1000:9000,iter3(1:10),'--kp',0:1000:9000,iter3B(1:10),':rh');
legend('Newton-Raphson','Broyden');
xlabel('U');
ylabel('Iteraciones');

