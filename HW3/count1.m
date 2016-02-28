clc
clear
x1=2.2;
x2=-3.2;
x3=-3.2;
x4=2.2;

a=0.3*x1-0.1*x2+0.5;
b=1.716*tanh(2/3*a);
c=-0.4*x1+1*x2-0.5;
d=1.716*tanh(2/3*c);
e=-2*b+0.5*d+1;
f=1.716*tanh(2/3*e);

y1=f  %display output y

a=0.3*x3-0.1*x4+0.5;
b=1.716*tanh(2/3*a);
c=-0.4*x3+1*x4-0.5;
d=1.716*tanh(2/3*c);
e=-2*b+0.5*d+1;
f=1.716*tanh(2/3*e);

y2=f   %display output y