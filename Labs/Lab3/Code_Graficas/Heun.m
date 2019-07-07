function Y = Heun(Y1,Y2,h,t)
%Método de Heun
   Y = zeros(2,20/h + 1);
   Y(1,1) = Y1;
   Y(2,1) = Y2;
   
   ind = 2;
   for i=0:h:t
       y = f(Y(1,ind-1),Y(2,ind-1));
       y1 = f(Y(1,ind-1) + h,Y(2,ind-1) + h*y(1));
       y2 = f(Y(1,ind-1) + h,Y(2,ind-1) + h*y(2));
       Y(1,ind) = Y(1,ind-1) + h*0.5*y(1) + h*0.5*y1(1);
       Y(2,ind) = Y(2,ind-1) + h*0.5*y(2) + h*0.5*y2(2);
       ind = ind +1;
   end
   
end