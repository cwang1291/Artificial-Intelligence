%% problem (a)
clear
clc
load('data.mat')
for i=1:30
    testX(:,i)=X(:,testimages(i));
    testY(i)=Y(testimages(i));
end
for i=1:30
    X(:,testimages(31-i))=[];
    Y(testimages(31-i))=[];
end

for i=1:45045
    Mean(i)=sum(X(i,:))/135;
    A(i,:)=X(i,:)-Mean(i);
end
D=A'*A;


[evector,evalue]=eig(D);
S=0;
n=0;
TotalEvalue=trace(evalue);
for i=1:135
    n=n+1;
    S=S+evalue(136-i,136-i);
    if S/TotalEvalue>=0.9
        break;
    end
end
%}
%% problem(b)
weights=A'*eface;
recon=zeros(45045,1);

for i=126:135
    recon(:,1)=recon(:,1)+eface(:,i)*weights(1,i);
end
recon(:,1)=recon(:,1)+Mean';

imshow(reshape(recon,231,195))


%% problem (c)
eface=A*evector;

for i=1:135
    eface(:,i)=eface(:,i)/norm(eface(:,i));
end
weightsoftest=testX'*eface;
weightsoftrain=X'*eface;
dist1=zeros(30,135);
num1=0;
for i=1:30
    for j=1:135
        dist1(i,j)=sqrt(sum((weightsoftest(i,:)-weightsoftrain(j,:)).^2));
    end
    [~,order]=min(dist1(i,:));
    if testY(i)==Y(order)
        num1=num1+1;
    end
end
accuracy1=num1/30*100;
%% problem(d)
dist2=zeros(30,135);
num2=0;
for i=1:30
    for j=1:135
        dist2(i,j)=sqrt(sum((testX(:,i)-X(:,j)).^2));
    end
    [~,order]=min(dist2(i,:));
    if testY(i)==Y(order)
        num2=num2+1;
    end
end
accuracy2=num2/30*100;




