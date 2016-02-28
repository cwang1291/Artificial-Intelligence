%% problem(a)
clear
clc
data=[-2 1 2 -3 4 1 0 3 0 2 1 1 2 3 -2 -3 2 1 0;
    1 2 -4 2 -4 2 5 2 2 1 -3 0 0 1 -2 1 1 -3 -2;
    1 -3 2 1 0 -3 -5 -1 3 3 -2 -3 -2 -1 1 0 5 4 2;
    3 -1 0 2 2 -5 -4 -1 2 -1 3 4 4 2 1 2 -2 1 -1];
for i=1:19
    Mean(i)=sum(data(:,i))/4;
    A(:,i)=data(:,i)-Mean(i);
end

D=A*A';
[evector,evalue]=eig(D);
evector(:,1)=[];
eface=A'*evector;
for i=1:3
    eface(:,i)=eface(:,i)/norm(eface(:,i));
end
%% problem(b)
weights=A*eface;
%% problem(c,d)
recon=zeros(19,4);
for i=1:4
    for j=1:3
        recon(:,i)=recon(:,i)+eface(:,j)*weights(i,j);
    end
    recon(:,i)=recon(:,i)+Mean';
end
SquareError=sum((recon-data').^2);
MinSquareError=min(SquareError);
MeanSquareError=sum(sum((recon-data').^2));
%% problem(e,f)
Y = [1 3 0 3 -2 2 4 1 3 0 -2 0 1 1 -3 0 1 -2 -3]';
for i=1:4
    dist1(i)=sqrt(sum((recon(:,i)-Y).^2));
end
for i=1:4
    dist2(i)=sqrt(sum((data(i,:)'-Y).^2));
end









