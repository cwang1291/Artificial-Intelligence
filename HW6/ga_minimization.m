function minimum=ga_minimization()
clear
clc
%% problem (a)(b)

syms x y
z=sin(x).*sin(2*y)+0.3*x;
ezsurf(x,y,z,[-6,3],[-1.5,0]);
hold on
syms x y
f(x,y) = sin(x)*sin(2*y)+0.3*x;
df1 = diff(f,x);
df2 = diff(f,y);
[solx,soly,params,cond] = solve([df1,df2],[x, y], 'ReturnConditions', true);
ans1=vpa(subs([solx,soly],params,[-1,-1]));
ans2=vpa(subs([solx,soly],params,[-1,0]));
ans3=vpa(subs([solx,soly],params,[0,-1]));
ans4=vpa(subs([solx,soly],params,[0,0]));
ans5=vpa(subs([solx,soly],params,[0,1]));
ans6=vpa(subs([solx,soly],params,[1,0]));
ans7=vpa(subs([solx,soly],params,[1,1]));
p1=double(ans1(2,:));
p2=double(ans1(4,:));
p3=double(ans2(1,:));
p4=double(ans3(4,:));
p5=double(ans4(3,:));
z1=sin(p1(1))*sin(2*p1(2))+0.3*p1(1);
z2=sin(p2(1))*sin(2*p2(2))+0.3*p2(1);
z3=sin(p3(1))*sin(2*p3(2))+0.3*p3(1);
z4=sin(p4(1))*sin(2*p4(2))+0.3*p4(1);
z5=sin(p5(1))*sin(2*p5(2))+0.3*p5(1);
plot3(p1(1),p1(2),z1,'ro');
hold on
plot3(p2(1),p2(2),z2,'ro');
hold on
plot3(p3(1),p3(2),z3,'ro');
hold on
plot3(p4(1),p4(2),z4,'ro');
hold on
plot3(p5(1),p5(2),z5,'ro');

%% problem (c)
clear
clc
mu=100;
e=4;
lamda=mu-e;
cRate=0.8;
mRate=0.2;
k=10;
iteration=1000;
x=-6+(6-(-3))*rand(1,mu);
y=-1.5+(0-(-1.5))*rand(1,mu);
X=[x;y];
figure;
plot(X(1,:),X(2,:),'yo');

for iter=1:iteration
    for i=1:mu
        fitness(i)=calfit(X(:,i));
    end
    sortedfitness=sort(fitness,'ascend');
    if e>0
        findethmin=find(fitness<=sortedfitness(e));
        for i=1:e
            offspring(:,i)=X(:,findethmin(i));
        end
    end
    for i=e+1:2:mu
        parents=randperm(mu,k);
        for j=1:k
            newgroup(:,j)=X(:,parents(j));
            newfitness(j)=calfit(X(:,parents(j)));
        end
        sortednewfitness=sort(newfitness,'ascend');
        newfindethmax=find(newfitness<=sortednewfitness(2));
        parent1=newgroup(:,newfindethmax(1));
        parent2=newgroup(:,newfindethmax(2));
        if rand>cRate
            [offspring1,offspring2]=crossover(parent1,parent2);
        end
        if rand>mRate
            offspring1=mutate(parent1);
            offspring2=mutate(parent2);
        end
        offspring(:,i)=offspring1;
        offspring(:,i+1)=offspring2;
    end
    X=offspring;
    minimum=sin(X(1,1)).*sin(2*X(2,1))+0.3*X(1,1);
    if minimum<=-2.459
        break;
    end
    if iter==5
        figure(5);
        plot(X(1,:),X(2,:),'go');
    elseif iter==10
        figure(10);
        plot(X(1,:),X(2,:),'ro');
    elseif iter==100
        figure(100);
        plot(X(1,:),X(2,:),'bo');
    end
end
end
%% calfit
function fitness=calfit(X)
z=sin(X(1)).*sin(2*X(2))+0.3*X(1);
fitness=z-(-2.459);
end

%% crossover
function [Y1,Y2]=crossover(z1,z2)
Y1(1)=z1(1);
Y1(2)=z2(2);
Y2(1)=z2(1);
Y2(2)=z1(2);
end
%% mutate
function Y=mutate(z)
if round(rand) ==1
    z(1)=z(1)+0.001;
    z(2)=z(2)+0.001;
else 
    z(1)=z(1)-0.001;
    z(2)=z(2)-0.001;
end
Y=z;
end

