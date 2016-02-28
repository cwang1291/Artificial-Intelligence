clc
clear
x1=2.2;
x2=-3.2;
x3=-3.2;
x4=2.2;

a=-0.5*x1+1.5*x2-1;
b=1.716*tanh(2/3*a);
c=1.5*x1-0.5*x2+1;
d=1.716*tanh(2/3*c);
e=-1*b+1*d+0.5;
f=1.716*tanh(2/3*e);

y1=f  %display output y

a=-0.5*x3+1.5*x4-1;
b=1.716*tanh(2/3*a);
c=1.5*x3-0.5*x4+1;
d=1.716*tanh(2/3*c);
e=-1*b+1*d+0.5;f=1.716*tanh(2/3*e);

y2=f   %display output y