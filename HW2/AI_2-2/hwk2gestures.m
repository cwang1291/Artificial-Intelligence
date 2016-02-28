function x=hwk2gestures()

% (a) visualize the first three training data
for i=1:3 
    subplot(3,3,i);
    filename=['data/alpha/t' num2str(i) '.txt']; 
    d1=load(filename);
    a1=d1(:,1);
    b1=d1(:,2);
    plot(a1,b1);
end 
for j=4:6
    subplot(3,3,j);
    filename=['data/beta/t' num2str(j) '.txt']; 
    d2=load(filename);
    a2=d2(:,1);
    b2=d2(:,2);
    plot(a2,b2);
end
for k=7:9
    subplot(3,3,k);
    filename=['data/delta/t' num2str(k) '.txt']; 
    d3=load(filename);
    a3=d3(:,1);
    b3=d3(:,2);
    plot(a3,b3);
end
%(b)
d1=load('data/alpha/t1.txt');
startpoint1=[d1(1,1),d1(1,2)];
endpoint1=[d1(50,1),d1(50,2)];
lengthofstarttoend=sqrt((startpoint1(1)-endpoint1(1))^2+(startpoint1(2)-endpoint1(2))^2);
widthofword=max(d1(:,1))-min(d1(:,1));
heightofword=max(d1(:,2))-min(d1(:,2));
angleofstartandend=(d1(1,2)-d1(50,2))^2/(d1(1,1)-d1(50,1)^2);
alpha1=lengthofstarttoend/widthofword;
alpha2=angleofstartandend;
alpha3=widthofword/heightofword;




d2=load('data/beta/t1.txt');
startpoint1=[d2(1,1),d2(1,2)];
endpoint1=[d2(50,1),d2(50,2)];
lengthofstarttoend=sqrt((startpoint1(1)-endpoint1(1))^2+(startpoint1(2)-endpoint1(2))^2);
widthofword=max(d2(:,1))-min(d2(:,1));
heightofword=max(d2(:,2))-min(d2(:,2));
angleofstartandend=(d2(1,2)-d2(50,2))^2/(d2(1,1)-d2(50,1)^2);
beta1=lengthofstarttoend/widthofword;
beta2=angleofstartandend;
beta3=widthofword/heightofword;





d3=load('data/delta/t1.txt');
startpoint1=[d3(1,1),d3(1,2)];
endpoint1=[d3(50,1),d3(50,2)];
lengthofstarttoend=sqrt((startpoint1(1)-endpoint1(1))^2+(startpoint1(2)-endpoint1(2))^2);
widthofword=max(d3(:,1))-min(d3(:,1));
heightofword=max(d3(:,2))-min(d3(:,2));
angleofstartandend=(d3(1,2)-d3(50,2))^2/(d3(1,1)-d3(50,1)^2);
delta1=lengthofstarttoend/widthofword;
delta2=angleofstartandend;
delta3=widthofword/heightofword;

feature1=[alpha1,beta1,delta1]
feature2=[alpha2,beta2,delta2]
feature3=[alpha3,beta3,delta3]

%(c)
for i=1:11
    filename=['data/alpha/t' num2str(i) '.txt']; 
    d1=load(filename);
    startpoint1=[d1(1,1),d1(1,2)];
    endpoint1=[d1(50,1),d1(50,2)];
    lengthofstarttoend=sqrt((startpoint1(1)-endpoint1(1))^2+(startpoint1(2)-endpoint1(2))^2);
    widthofword=max(d1(:,1))-min(d1(:,1));
    heightofword=max(d1(:,2))-min(d1(:,2));
    angleofstartandend=(d1(1,2)-d1(50,2))^2/(d1(1,1)-d1(50,1)^2);
    alpha1(i)=lengthofstarttoend/widthofword;
    alpha2(i)=angleofstartandend;
    alpha3(i)=widthofword/heightofword;

end

for i=1:9
    filename=['data/beta/t' num2str(i) '.txt']; 
    d2=load(filename);
    startpoint1=[d2(1,1),d2(1,2)];
    endpoint1=[d2(50,1),d2(50,2)];
    lengthofstarttoend=sqrt((startpoint1(1)-endpoint1(1))^2+(startpoint1(2)-endpoint1(2))^2);
    widthofword=max(d2(:,1))-min(d2(:,1));
    heightofword=max(d2(:,2))-min(d2(:,2));
    angleofstartandend=(d2(1,2)-d2(50,2))^2/(d2(1,1)-d2(50,1)^2);
    beta1(i)=lengthofstarttoend/widthofword;
    beta2(i)=angleofstartandend;
    beta3(i)=widthofword/heightofword;

end

for i=1:12
    filename=['data/delta/t' num2str(i) '.txt']; 
    d3=load(filename);
    startpoint1=[d3(1,1),d3(1,2)];
    endpoint1=[d3(50,1),d3(50,2)];
    lengthofstarttoend=sqrt((startpoint1(1)-endpoint1(1))^2+(startpoint1(2)-endpoint1(2))^2);
    widthofword=max(d3(:,1))-min(d3(:,1));
    heightofword=max(d3(:,2))-min(d3(:,2));
    angleofstartandend=(d3(1,2)-d3(50,2))^2/(d3(1,1)-d3(50,1)^2);
    delta1(i)=lengthofstarttoend/widthofword;
    delta2(i)=angleofstartandend;
    delta3(i)=widthofword/heightofword;

end
alpha=[alpha1;alpha2;alpha3];
beta=[beta1;beta2;beta3];
delta=[delta1;delta2;delta3];
alphamean= [mean(alpha(1,:));mean(alpha(2,:));mean(alpha(3,:))]
betamean = [mean(beta(1,:));mean(beta(2,:));mean(beta(3,:))]
deltamean= [mean(delta(1,:));mean(delta(2,:));mean(delta(3,:))]
alphacov = cov(alpha')
betacov=cov(beta')
deltacov=cov(delta')

for i=1:30
    filename=['Test/test' num2str(i) '.txt'];
    d=load(filename);
    startpoint1=[d(1,1),d(1,2)];
    endpoint1=[d(50,1),d(50,2)];
    lengthofstarttoend=sqrt((startpoint1(1)-endpoint1(1))^2+(startpoint1(2)-endpoint1(2))^2);
    widthofword=max(d(:,1))-min(d(:,1));
    heightofword=max(d(:,2))-min(d(:,2));
    angleofstartandend=(d(1,2)-d(50,2))^2/(d(1,1)-d(50,1)^2);
    f1=lengthofstarttoend/widthofword;
    f2=angleofstartandend;
    f3=widthofword/heightofword;
    X=[f1;f2;f3];
    
    
    palpha=((((2*3.1416)^1.5)*(det(alphacov))^0.5)^-1)*exp(-0.5*(X-alphamean)'*inv(alphacov)*(X-alphamean));
    pbeta=((((2*3.1416)^1.5)*(det(betacov))^0.5)^-1)*exp(-0.5*(X-betamean)'*inv(betacov)*(X-betamean));
    pdelta=((((2*3.1416)^1.5)*(det(deltacov))^0.5)^-1)*exp(-0.5*(X-deltamean)'*inv(deltacov)*(X-deltamean));
    Pofall=[palpha,pbeta,pdelta];
    [~,decision(i)]=max(Pofall);
    
end

fid = fopen('testresult.txt','wt');
for i=1:30
    fprintf(fid,'%d \n',decision(i));
end
fclose(fid);

