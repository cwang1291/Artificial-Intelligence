clc
clear
[training,testing] = setupMNIST();  % extract data
nin=784;
nout=10;
nhidden=500;
options = zeros(1,18);
options(1)=1;
options(14)=200;
outfunc='logistic';
alg='scg';
trainingsample=30000;
for i=1:60000      
    if i<=trainingsample
        a(:,i)=training.data(:,i);
        target(i,training.labels(i)+1)=1;
    else
        b(:,i-trainingsample)=training.data(:,i);
    end
end
a=a';b=b';
net=mlp(nin,nhidden,nout,outfunc);
net=netopt(net,options,a,target,alg);
% training error

y = mlpfwd(net, a);
for i=1:trainingsample
    [~,order]=max(y(i,:));
    output(i)=order-1;
end

trainingerrornumber=0;
for i=1:trainingsample
    if output(i)~=training.labels(i)
        trainingerrornumber=trainingerrornumber+1;
    end
end
trainingerror=trainingerrornumber/trainingsample
%validation error

y = mlpfwd(net, b);       
for i=1:60000-trainingsample
    [~,order]=max(y(i,:));
    output(i)=order-1;
end

validationerrornumber=0;
for i=1:60000-trainingsample
    if output(i)~=training.labels(i+trainingsample)
        validationerrornumber=validationerrornumber+1;
    end
end
validationerror=validationerrornumber/(60000-trainingsample)


%testerror
testingerrornumber=0;
y = mlpfwd(net, testing.data'); 
for i=1:10000
    [~,order]=max(y(i,:));
    output(i)=order-1;
end
for i=1:10000
    if output(i)~=testing.labels(i)
        testingerrornumber=testingerrornumber+1;
    end
end
testingerror=testingerrornumber/10000
