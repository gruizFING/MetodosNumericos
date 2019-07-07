%Graficas de y1 e y2 usando los dos metodos,
%Euler hacia adelante y Heun.

Y1o = 1;
Y2o = 1;
h = 0.001;
t = 20;

X1 = ForwardEuler(Y1o,Y2o,h,t);
X2 = Heun(Y1o,Y2o,h,t);

dom = 0:h:t+h;
%y1(t) en funcion de dom con Euler
plot(dom,X1(1,:),'r');
axis([0 t+h min(X1(1,:)) max(X1(1,:))]);
legend('y1');
xlabel('t');
ylabel('y1');

%y2(t) en funcion de dom con Euler
plot(dom,X1(2,:),'k');
axis([0 t+h min(X1(2,:)) max(X1(2,:))]);
legend('y2');
xlabel('t');
ylabel('y2');

%y1(t) en funcion de dom con Heun
plot(dom,X2(1,:),'r');
axis([0 t+h min(X2(1,:)) max(X2(1,:))]);
legend('y1');
xlabel('t');
ylabel('y1');

%y2(t) en funcion de dom con Heun
plot(dom,X2(2,:),'k');
axis([0 t+h min(X2(2,:)) max(X2(2,:))]);
legend('y2');
xlabel('t');
ylabel('y2');

%Ahora y1(t) de Euler con y1(t) de Heun
plot(dom,X1(1,:),'r',dom,X2(1,:),':');
axis([0 t+h min(min(X1(1,:)),min(X2(1,:))) max(max(X1(1,:)),max(X2(1,:)))]);
legend('y1 Euler','y1 Heun');
xlabel('t');
ylabel('y1');

dif = abs(X1(1,:) - X2(1,:));
Maxdif = max(dif);
%Dan muy parecidas, la diferencia maxima es 0.0099

%y2(t) de Euler con y2(t) de Heun
plot(dom,X1(2,:),'r',dom,X2(2,:),':k');
axis([0 t+h min(min(X1(2,:)),min(X2(2,:))) max(max(X1(2,:)),max(X2(2,:)))]);
legend('y2 Euler','y2 Heun');
xlabel('t');
ylabel('y2');

dif2 = abs(X1(2,:) - X2(2,:));
Maxdif2 = max(dif2);
%Tambien muy parecidas, la diferencia maxima es 0.0096

%Ahora y1(t) de Euler con y2(t) de Euler
plot(dom,X1(1,:),'r',dom,X1(2,:),'k');
axis([0 t+h min(min(X1(1,:)),min(X1(2,:))) max(max(X1(1,:)),max(X1(2,:)))]);
legend('y1 Euler','y2 Euler');
xlabel('t');
ylabel('y1,y2');

%Grafica de y1(t) en funcion de y2(t) usando el resultado de Heun
plot(X2(2,:),X2(1,:));
legend('y1(y2)');
xlabel('y2');
ylabel('y1');

%Por ultimo, grafica de y1 en funcion de y2 usando Euler y Heun a la vez.
plot(X1(2,:),X1(1,:),'r',X2(2,:),X2(1,:),':');
legend('y1(y2) Euler','y1(y2) Heun');
xlabel('y2');
ylabel('y1');

%Teoricamente deberian dar iguales pero por el error cometido por cada
%metodo dan diferencias minimas.

%Ahora probando con t = 200 y h = 0.01
h = 0.01;
t = 300;

X1_2 = ForwardEuler(Y1o,Y2o,h,t);
X2_2 = Heun(Y1o,Y2o,h,t);

plot(X1_2(2,:),X1_2(1,:),'r',X2_2(2,:),X2_2(1,:),':');
legend('y1(y2) Euler','y1(y2) Heun');
xlabel('y2');
ylabel('y1');
%En esta grafica se ve claramente lo que sucede.