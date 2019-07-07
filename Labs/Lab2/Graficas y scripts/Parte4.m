
[i y X] = NR(0,0,6000,0);
[i2 y2 X2] = Broyden(0,0,6000,0);

e1 = zeros(i,1);
for j=1:i
    e1(j) = norm(X(1:2,j) - y(1:2,:));
end
e2 = zeros(i2,1);
for j=1:i2
    e2(j) = norm(X2(1:2,j) - y2(1:2,:));
end;


XNR = ones(i-1,2);
XNR(1:i-1,1) = log(e1(1:i-1));
YNR(1:i-1,1) = log(e1(2:i));
solNR = (XNR'*XNR) \ (XNR'*YNR);
oNR = solNR(1,1);
vNR = exp(solNR(2,1));

XB = ones(i2-1,2);
XB(1:i2-1,1) = log(e2(1:i2-1));
YB(1:i2-1,1) = log(e2(2:i2));
solB = (XB'*XB) \ (XB'*YB);
oB = solB(1,1);
vB = exp(solB(2,1));
