%Comparación de las funciones halladas analiticamente
%y con métodos numéricos.
%Antes ejecutar scripts Parte2f,funcion1,funcion2 y funcion3.

%Primera función y1.
plot(t1,y1,'g',t1,Y1,':k');
axis([0 2*pi min(Y1) max(Y1)]);
legend('y analitica','y por método');
xlabel('t');
ylabel('y(t)');
%A simple vista parecen ser iguales pero al hacer zoom se observa
%que no lo son.

error1 = abs(y1-Y1);
plot(t1,error1);
axis([0 2*pi min(error1) max(error1)]);
%El maximo error es del orden de 10^-4.
%En escala logaritmica para verlo mejor.
semilogy(t1,error1);
axis([0 2*pi min(error1) max(error1)]);
%El minimo error es del orden de 10^-11.

%Segunda función y2.
plot(t2,y2,'g',t2,Y2,':k');
axis([0 1 min(y2) max(Y2)]);
legend('y analitica','y por método');
xlabel('t');
ylabel('y(t)');
%Tambien se superponen.Hay que ver el error.

error2 = abs(y2-Y2);
plot(t2,error2);
axis([0 1 min(error2) max(error2)]);
%El maximo error es del orden de 10^-5.
%En escala logaritmica para verlo mejor.
semilogy(t2,error2);
axis([0 1 min(error2) max(error2)]);
%El minimo error es del orden de 10^-7.

%Tercera función y3.
plot(t2,y3,'g',t2,Y3,':k');
axis([0 1 min(y3) max(Y3)]);
legend('y analitica','y por método');
xlabel('t');
ylabel('y(t)');
%Esta se puede observar que tiene más error.

error3 = abs(y3-Y3);
plot(t2,error3);
axis([0 1 min(error3) max(error3)]);
%El maximo error es del orden de 10^-1.
%En escala logaritmica para verlo mejor.
semilogy(t2,error3);
axis([0 1 min(error3) max(error3)]);
%El minimo error es del orden de 10^-8.
