%Prueba de los resultados

resultNR1 = zeros(2,10);
resultNR2 = zeros(2,10);
resultNR3 = zeros(2,10);
resultB1 = zeros(2,10);
resultB2 = zeros(2,10);
resultB3 = zeros(2,10);
i = 1;

for U=0:1000:9000
    resultNR1(1:2,i) = gradPhi(X1(1,i),X1(2,i),U,0);
    resultNR2(1:2,i) = gradPhi(X2(1,i),X2(2,i),U,-50);
    resultNR3(1:2,i) = gradPhi(X3(1,i),X3(2,i),U,-150);
    resultB1(1:2,i) = gradPhi(X1B(1,i),X1B(2,i),U,0);
    resultB2(1:2,i) = gradPhi(X2B(1,i),X2B(2,i),U,-50);
    resultB3(1:2,i) = gradPhi(X3B(1,i),X3B(2,i),U,-150);
    i = i + 1;
end

%Dan todos los valores muy cercanos a 0, con error maximo de orden 1^-5.

%Ahora hay que ver la clasificacion de los extremos.
%Usamos el resultado de NR.

min1 = zeros(1,10);
min2 = zeros(1,10);
min3 = zeros(1,10);
i = 1;
for U=0:1000:9000
    if (det(hesPhi(X1(1,i),X1(2,i))) > 0)
        %Presenta extremo relativo y como la derivada uu es una cte mayor
        %que 0 entonces es un minimo relativo.
        min1(i) = 1;
    elseif (det(hesPhi(X1(1,i),X1(2,i))) < 0)
        %No hay extremo(Punto de Silla)
        min1(i) = -1;
    %Si el det(H) = 0, no clasifica y queda min(i) = 0.
    end
    if (det(hesPhi(X2(1,i),X2(2,i))) > 0)
        min2(i) = 1;
    elseif (det(hesPhi(X2(1,i),X2(2,i))) < 0)
        min2(i) = -1;
    end
    if (det(hesPhi(X3(1,i),X3(2,i))) > 0)
        min3(i) = 1;
    elseif (det(hesPhi(X3(1,i),X3(2,i))) < 0)
        min3(i) = -1;
    end
    i = i + 1;
end

%Se cumple la condicion de minimo para todos los U probados hasta 9000.
%Calculo de la energia con las soluciones halladas. Usando las soluciones
%de Broyden.
U = 0:1000:10000;
U(12) = 12000;
z1 = zeros(2,10);
z2 = zeros(2,10);
z3 = zeros(2,10);
for i=1:12
    if i < 11
        z1(1:2,i) = phi(X1B(1,i),X1B(2,i),U(i),0);
        z2(1:2,i) = phi(X2B(1,i),X2B(2,i),U(i),-50);
        z3(1:2,i) = phi(X3B(1,i),X3B(2,i),U(i),-150);
    else
        z1(1:2,i) = phi(X1B(1,i-10),X1B(2,i-10),U(i),0);
        z2(1:2,i) = phi(X2B(1,i-10),X2B(2,i-10),U(i),-50);
        z3(1:2,i) = phi(X3B(1,i-10),X3B(2,i-10),U(i),-150);
    end
end;
%Graficas de la energia para cada caso
mesh(z1);
figure
mesh(z2);
figure
mesh(z3);
%Todas toman formas de canaleta.

clear U;
U = 10000;
%Ahora para U = 10000.
resNR1(1:2,1) = gradPhi(XE1(1,1),XE1(2,1),U,0);
resNR2(1:2,1) = gradPhi(XE2(1,1),XE2(2,1),U,-50);
resNR3(1:2,1) = gradPhi(XE3(1,1),XE3(2,1),U,-150);
resB1(1:2,1) = gradPhi(XEB1(1,1),XEB1(2,1),U,0);
resB2(1:2,1) = gradPhi(XEB2(1,1),XEB2(2,1),U,-50);
resB3(1:2,1) = gradPhi(XEB3(1,1),XEB3(2,1),U,-150);
%Ninguno de los dos metodos llegan a una solucion.

%Ahora para U = 12000.
%Solo para Broyden ya que la ultima solucion de NR dieron (NaN,NaN).
U = 12000;
resB1(1:2,2) = gradPhi(XEB1(1,2),XEB1(2,2),U,0);
resB2(1:2,2) = gradPhi(XEB2(1,2),XEB2(2,2),U,-50);
resB3(1:2,2) = gradPhi(XEB3(1,2),XEB3(2,2),U,-150);
%Para XEB1 llega a una solucion que hace que el gradiente se anule.
