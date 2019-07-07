%Prueba con 20 intervalos y tamaño hasta 100.
%A2 tridiagonal.
i=1;
Tam=zeros(20,1);
t1=zeros(20,1);
t2=zeros(20,1);
t3=zeros(20,1);
for n=5:5:100
        A = zeros(n) + diag(10*(rand(n,1)+1),0) + diag(2*rand(n-1,1),-1) + diag(3*rand(n-1,1),1);
        a = diag(A,-1);
        b = diag(A,0);
        c = diag(A,1);
        d = randi([-10 10],n,1);
        Tam(i)=n;
        tic;
        [L U] = EgMb(n,1,1,A);
        SustMb(n,1,1,U,L,b);
        t1(i)=toc;
        tic;Thomas(a,b,c,d);t2(i)=toc;
        tic;A\b;t3(i)=toc;
        clear A a b c d L U; 
        i=i+1;
end;

plot(t1,Tam,'--r^',t2,Tam,':g*',t3,Tam,'-.p');
legend('Tiempo con Algortimos','tiempo con Thomas','Tiempo con "\"');
xlabel('Tiempo');
ylabel('Tamaño Matriz');
clear t1 t2 t3 Tam;

%Con tamaño de hasta 100 se observa una mejoria
%en el tiempo de los algoritmos pero no logra ser 
%mejor que el del comando.
%En cambio con Thomas es mas rapido a partir de tamaño 50.
%Hay que probar con mas grandes.
i=1;
Tam=zeros(25,1);
t1=zeros(25,1);
t2=zeros(25,1);
t3=zeros(25,1);
for n=5:20:500
        A = zeros(n) + diag(10*(rand(n,1)+1),0) + diag(2*rand(n-1,1),-1) + diag(3*rand(n-1,1),1);
        a = diag(A,-1);
        b = diag(A,0);
        c = diag(A,1);
        d = randi([-10 10],n,1);
        Tam(i)=n;
        tic;
        [L U] = EgMb(n,1,1,A);
        SustMb(n,1,1,U,L,b);
        t1(i)=toc;
        tic;Thomas(a,b,c,d);t2(i)=toc;
        tic;A\b;t3(i)=toc;
        clear A a b c d L U; 
        i=i+1;
end;

plot(t1,Tam,'--r^',t2,Tam,':g*',t3,Tam,'-.p');
legend('Tiempo con Algortimos','tiempo con Thomas','Tiempo con "\"');
xlabel('Tiempo');
ylabel('Tamaño Matriz');
clear t1 t2 t3 Tam;

%Ahora si se puede observar que a partir de aproximadamente
%el tamaño 150_200 el tiempo de ejecución de los algoritmos
%es menor que el del comando \.
%El de Thomas es lo mejor de las tres formas.

%Con matrices mas grandes.
i=1;
Tam=zeros(25,1);
t1=zeros(25,1);
t2=zeros(25,1);
t3=zeros(25,1);
for n=10:200:5000
        A = zeros(n) + diag(10*(rand(n,1)+1),0) + diag(2*rand(n-1,1),-1) + diag(3*rand(n-1,1),1);
        a = diag(A,-1);
        b = diag(A,0);
        c = diag(A,1);
        d = randi([-10 10],n,1);
        Tam(i)=n;
        tic;
        [L U] = EgMb(n,1,1,A);
        SustMb(n,1,1,U,L,b);
        t1(i)=toc;
        tic;Thomas(a,b,c,d);t2(i)=toc;
        tic;A\b;t3(i)=toc;
        clear A a b c d L U; 
        i=i+1;
end;

plot(t1,Tam,'--r^',t2,Tam,':g*',t3,Tam,'-.p');
legend('Tiempo con Algortimos','tiempo con Thomas','Tiempo con "\"');
xlabel('Tiempo');
ylabel('Tamaño Matriz');
clear t1 t2 t3 Tam;

%Ahora con matrices no tridiagonales.
i=1;
Tam=zeros(40,1);
t1=zeros(40,1);
t2=zeros(40,1);
for n=10:25:1000
        A = zeros(n)+diag(10*rand(n,1),0)+diag(2*rand(n-1,1),-1)+diag(3*rand(n-1,1),1);
        A = A +diag(2*rand(n-2,1),-2)+diag(2*rand(n-2,1),2)+diag(rand(n-3,1),-3);
        b = randi([-100 100],n,1);
        Tam(i)=n;
        tic;
        [L U] = EgMb(n,2,3,A);
        SustMb(n,2,3,U,L,b);
        t1(i)=toc;
        tic;A\b;t2(i)=toc;
        clear A b L U; 
        i=i+1;
end;

plot(t1,Tam,':rx',t2,Tam,'-.go');
legend('Tiempo con Algortimos','Tiempo con "\"');
xlabel('Tiempo');
ylabel('Tamaño Matriz');
clear t1 t2 Tam;
 