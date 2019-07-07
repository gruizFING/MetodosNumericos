%Creo una matriz 5x5 de ancho de banda horizontal r=1 y 
%ancho de banda vertical s=2.
%Es diagonal dominante por filas para evitar hacer pivoteo.
A = [5 2 0 0 0;
     1 8 4 0 0;
     1 2 6 2 0;
     0 1 3 9 4;
     0 0 2 1 4];
%Creo el vector b del sistema Ax=b.
b = [5;4;8;1;3];

%Hago la descomposicion LU de A usando la eliminación gaussiana
%para matrices banda y luego hallo la solución del sistema
%aplicando el algoritmo de sustitución.
%Tambien calculo el tiempo de ejecucion para después compararlo
%con el comando \.
tic;
[L U] = EgMb(5,1,2,A);
x = SustMb(5,1,2,U,L,b);
T1=toc;

%Hallo la solucion con el comando \.
tic;
sol = A\b;
T2=toc;

%Comparo las soluciones y el tiempo, y calculo el error cometido.
iguales1 = round(x) == round(sol);
error1 = abs(x-sol);
T2<T1;
T1/T2;
%El tiempo de ejecucion del comando \ es aproximadamente tres veces más
%rapido que usando los algoritmos.

%Ahora con matriz 50x50 con r=s=2.
A2 = zeros(50) + diag(100*(rand(50,1)+1),0) + diag(25*rand(49,1),-1) + diag(22*rand(49,1),1);
A2 = A2 + diag(20*(rand(48,1)+1),-2) + diag(22*rand(48,1),2);

b2 = 25*rand(50,1);
tic;
[L2 U2] = EgMb(50,2,2,A2);
x2 = SustMb(50,2,2,U2,L2,b2);
T3=toc;

tic;
sol2 = A2\b2;
T4=toc;

iguales2 = round(x2) == round(sol2);
error2 = abs(x2-sol2);
T4<T3;
u=T3/T4;

%El tiempo mejoro para esta matriz mas grande.
%En este caso con el comando \ fue aproximadamente
%dos veces mas grande.
%Hay que ver para matrices más grandes si hay más ganancia de tiempo.

%Prueba Thomas
A3 = zeros(500) + diag(100*(rand(500,1)+ 1),0) + diag(25*rand(499,1),-1) + diag(22*rand(499,1),1);
a=diag(A3,-1);
b=diag(A3,0);
c=diag(A3,1);

d= 20*rand(500,1);

x3 = Thomas(a,b,c,d);

sol3 = A3\d;

iguales3 = x3 == sol3;
error3 = abs(x3-sol3);
%El error usando Thomas es cero.