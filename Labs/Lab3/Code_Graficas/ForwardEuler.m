function Y = ForwardEuler(Y1,Y2,h,t)
%Método de Euler hacia adelante
   Y = zeros(2,20/h + 1);
   Y(1,1) = Y1;
   Y(2,1) = Y2;
   
   ind = 2;
   for i=0:h:t
       y = f(Y(1,ind-1),Y(2,ind-1));
       Y(1,ind) = Y(1,ind-1) + h*y(1);
       Y(2,ind) = Y(2,ind-1) + h*y(2);
       ind = ind +1;
   end
   
end