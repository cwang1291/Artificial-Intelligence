clear
clc
%%4-1(a)
X=[2.5 0.5 2.2 1.9 3.1 2.3 2.0 1.0 1.5 1.1;
    2.4 0.7 2.9 2.2 3.0 2.7 1.6 1.1 1.6 0.9];
X=X';
mx=sum(X(:,1))/10;
my=sum(X(:,2))/10;
plot(mx,my,'Xg');
%hold on;
D=[X(:,1)-mx X(:,2)-my];
cov=D'*D/10;
[evector,evalue]=eig(cov);
x=X(:,1);
y=X(:,2);
plot(x,y,'.b');
%hold on;
a=evector(1,1);
b=evector(2,1);
x=[0:4];
y=1/a*(b*x-(b*mx-a*my));
plot(x,y);
%hold on;
a=evector(1,2);
b=evector(2,2);
y=1/a*(b*x-(b*mx-a*my));
plot(x,y);
axis([0 4 0 4]);
%%4-1(b)
for i=1:10
    a2(i)=D(i,:)*evector(:,1);
    a1(i)=D(i,:)*evector(:,2);
end
plot(a1,a2,'or');

recon=zeros(10,2);
for i=1:10
    recon(i,:)=a1(i)*evector(:,2);
end
[~,maxa]=max(a1);
[~,mina]=min(a1);





