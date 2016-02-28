function [x1,x2,objective1,objective2]=optimization2
clear
clc
%% quadprog
H=[1 0;0 9];
f=[3.2;-6];
lb=[0,0];
ub=[];
Aeq=[];
Beq=[];
A=[-1 -3;2 5; 3 4];
b=[-15; 100; 80];
x0=[];
options='interior-point-convex';
x1=quadprog(H,f,A,b,Aeq,Beq,lb,ub,x0,options);
objective1=0.5*x1(1)^2+3.2*x1(1)+4.5*x1(2)^2-6*x1(2)+7;
%% fmincon
x0=[-10,-10];
x2=fmincon(@func,x0,A,b,Aeq,Beq,lb,ub);
objective2=0.5*x2(1)^2+3.2*x2(1)+4.5*x2(2)^2-6*x2(2)+7;
function f=func(x)
f=0.5*x(1)^2+3.2*x(1)+4.5*x(2)^2-6*x(2)+7;
end
end