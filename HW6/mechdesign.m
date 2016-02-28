function [var1,var2,val1,val2]=mechdesign()
clear all
[var1,val1] = fmincon(@objective,[20,50],[],[],[],[],[1,0.1],[10,1],@constr,'Active set');
[var2,val2] = fmincon(@objective,[80,90],[],[],[],[],[1,0.1],[10,1],@constr,'SQP');
end

function f = objective(x)
rho = 0.0025;
H = 275;
V = pi*(((x(1)+2*x(2))/2)^2-(x(1)/2)^2)*H;
W = V*rho;
f = 4*W+2*x(1);
end
function [c,ceq] = constr(x)
E=900000;
H=275; 
P=2000;
sigmay=550;
c(1) = P/(pi*x(1)*x(2))-sigmay;
c(2) = P/(pi*x(1)*x(2)) - (pi*E*pi/8*x(1)*x(2)*(x(1)^2+x(2)^2)/H^2/x(1)/x(2));
ceq = [];
end