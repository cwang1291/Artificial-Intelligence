
%% problem (a)(b)
clear
clc
load('y_test.txt');
load('X_test.txt');
load('y_train.txt');
load('X_train.txt');
for i=1:7352
    if y_train(7353-i)==2 || y_train(7353-i)==3 || y_train(7353-i)==4
        X_train(7353-i,:)=[];
        y_train(7353-i)=[];
    end
end
for i=1:2947
    if y_test(2948-i)==2 || y_test(2948-i)==3 || y_test(2948-i)==4
        X_test(2948-i,:)=[];
        y_test(2948-i)=[];
    end
end


mean1=mean(X_train);
mean2=mean(X_test);
for i=1:4007
    A1(i,:)=X_train(i,:)-mean1;
end
for i=1:1565
    A2(i,:)=X_test(i,:)-mean2;
end


cov1=A1'*A1/4007;
[vector,value]=eig(cov1);
pc=[vector(:,561),vector(:,560)];
a11=A1*pc(:,1);
a12=A1*pc(:,2);
a21=A2*pc(:,1);
a22=A2*pc(:,2);
X_train=[a11,a12];
X_test=[a21,a22];
y_train_walking=y_train;
y_train_standing=y_train;
y_train_laying=y_train;

%% set pixel for drawing boundary
for i=1:100
    for j=1:100
        x1((i-1)*100+j)=-10+1.5*i/5;
        x2((i-1)*100+j)=-10+1.5*j/5;
    end
end
x=[x1',x2'];
y=zeros(10000,1);


%% walking
clear X11 X12 X21 X22 data1 data2 mask1 mask2

for i=1:4007
    if y_train_walking(i)~=1
        y_train_walking(i)=0;
    end
end


model1=svmtrain(y_train_walking,X_train,'-c 100 -t 2 -h 0');
Y_walking=svmpredict(y,x,model1);

mask1=logical(Y_walking==1);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];
mask2=logical(Y_walking~=1);
X21=x(:,1);
X22=x(:,2);
data2=[X21(mask2),X22(mask2)];

scatter(data1(:,1),data1(:,2),'ro');
hold on

%% standing
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:4007
    if y_train_standing(i)~=5
        y_train_standing(i)=0;
    end
end
model5=svmtrain(y_train_standing,X_train,'-c 100 -t 2 -h 0');
Y_standing=svmpredict(y,x,model5);

mask1=logical(Y_standing==5);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];
mask2=logical(Y_standing~=5);
X21=x(:,1);
X22=x(:,2);
data2=[X21(mask2),X22(mask2)];

scatter(data1(:,1),data1(:,2),'go');
hold on

%% laying
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:4007
    if y_train_laying(i)~=6
        y_train_laying(i)=0;
    end
end
model6=svmtrain(y_train_laying,X_train,'-c 100 -t 2 -h 0');
Y_laying=svmpredict(y,x,model6);

mask1=logical(Y_laying==6);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];
mask2=logical(Y_laying~=6);
X21=x(:,1);
X22=x(:,2);
data2=[X21(mask2),X22(mask2)];

scatter(data1(:,1),data1(:,2),'bo');
hold on

%% draw points
mask1=logical(y_train==1);
X11=X_train(:,1);
X12=X_train(:,2);
data1=[X11(mask1),X12(mask1)];

mask5=logical(y_train==5);
X51=X_train(:,1);
X52=X_train(:,2);
data5=[X51(mask5),X52(mask5)];

mask6=logical(y_train==6);
X61=X_train(:,1);
X62=X_train(:,2);
data6=[X61(mask6),X62(mask6)];

scatter(data1(:,1),data1(:,2),'gx');
hold on
scatter(data5(:,1),data5(:,2),'bx');
hold on
scatter(data6(:,1),data6(:,2),'rx');
hold on


%% problem(d)
clear X11 X12 X21 X22 X51 X52 X61 X62 data1 data5 data6 mask1 mask5 mask6
for i=1:1565
    if y_test(i)~=1
        y_test_walking(i)=0;
    else
        y_test_walking(i)=1;
    end
    if y_test(i)~=5
        y_test_standing(i)=0
    else
        y_test_standing(i)=5;
    end
    if y_test(i)~=6
        y_test_laying(i)=0;
    else
        y_test_laying(i)=6;
    end
end
label_walking=svmpredict(y_test_walking',X_test,model1);
label_standing=svmpredict(y_test_standing',X_test,model5);
label_laying=svmpredict(y_test_laying',X_test,model6);



%% problem(c)

clear
clc
load('y_test.txt');
load('X_test.txt');
load('y_train.txt');
load('X_train.txt');
for i=1:7352
    if y_train(7353-i)==2 || y_train(7353-i)==3 || y_train(7353-i)==4
        X_train(7353-i,:)=[];
        y_train(7353-i)=[];
    end
end
for i=1:2947
    if y_test(2948-i)==2 || y_test(2948-i)==3 || y_test(2948-i)==4
        X_test(2948-i,:)=[];
        y_test(2948-i)=[];
    end
end


mean1=mean(X_train);
mean2=mean(X_test);
for i=1:4007
    A1(i,:)=X_train(i,:)-mean1;
end
for i=1:1565
    A2(i,:)=X_test(i,:)-mean2;
end


cov1=A1'*A1/4007;
[vector,value]=eig(cov1);
pc=[vector(:,561),vector(:,560)];
a11=A1*pc(:,1);
a12=A1*pc(:,2);
a21=A2*pc(:,1);
a22=A2*pc(:,2);
X_train=[a11,a12];
extrasample=[4,-1];
X_train_walking=[X_train;extrasample];
X_test=[a21,a22];
y_train_walking=[y_train;1];
y_train_standing=y_train;
y_train_laying=y_train;

%% set pixel for drawing boundary
for i=1:100
    for j=1:100
        x1((i-1)*100+j)=-10+1.5*i/5;
        x2((i-1)*100+j)=-10+1.5*j/5;
    end
end
x=[x1',x2'];
y=zeros(10000,1);


%% walking
clear X11 X12 X21 X22 data1 data2 mask1 mask2

for i=1:4008
    if y_train_walking(i)~=1
        y_train_walking(i)=0;
    end
end


model1=svmtrain(y_train_walking,X_train_walking,'-c 100 -t 2 -h 0');
Y_walking=svmpredict(y,x,model1);

mask1=logical(Y_walking==1);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];
mask2=logical(Y_walking~=1);
X21=x(:,1);
X22=x(:,2);
data2=[X21(mask2),X22(mask2)];

scatter(data1(:,1),data1(:,2),'ro');
hold on

%% standing
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:4007
    if y_train_standing(i)~=5
        y_train_standing(i)=0;
    end
end
model5=svmtrain(y_train_standing,X_train,'-c 100 -t 2 -h 0');
Y_standing=svmpredict(y,x,model5);

mask1=logical(Y_standing==5);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];
mask2=logical(Y_standing~=5);
X21=x(:,1);
X22=x(:,2);
data2=[X21(mask2),X22(mask2)];

scatter(data1(:,1),data1(:,2),'go');
hold on

%% laying
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:4007
    if y_train_laying(i)~=6
        y_train_laying(i)=0;
    end
end
model6=svmtrain(y_train_laying,X_train,'-c 100 -t 2 -h 0');
Y_laying=svmpredict(y,x,model6);

mask1=logical(Y_laying==6);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];
mask2=logical(Y_laying~=6);
X21=x(:,1);
X22=x(:,2);
data2=[X21(mask2),X22(mask2)];

scatter(data1(:,1),data1(:,2),'bo');
hold on

%% draw points
mask1=logical(y_train==1);
X11=X_train(:,1);
X12=X_train(:,2);
data1=[X11(mask1),X12(mask1)];

mask5=logical(y_train==5);
X51=X_train(:,1);
X52=X_train(:,2);
data5=[X51(mask5),X52(mask5)];

mask6=logical(y_train==6);
X61=X_train(:,1);
X62=X_train(:,2);
data6=[X61(mask6),X62(mask6)];

scatter(data1(:,1),data1(:,2),'gx');
hold on
scatter(data5(:,1),data5(:,2),'bx');
hold on
scatter(data6(:,1),data6(:,2),'rx');
hold on



%% problem (e)


Label=kmeans(X_train,3);
mask11=logical(Label==1);
mask22=logical(Label==2);
mask33=logical(Label==3);
A11=X_train(:,1);
B11=X_train(:,2);
A22=X_train(:,1);
B22=X_train(:,2);
A33=X_train(:,1);
B33=X_train(:,2);
data1=[A11(mask11),B11(mask11)];
data2=[A22(mask22),B22(mask22)];
data3=[A33(mask33),B33(mask33)];

point1=sum(data1)/1374;
point2=sum(data2)/1236;
point3=sum(data3)/1379;


for i=1:1565
    a(i)=((X_test(i,1)-point1(1,1))^2+(X_test(i,2)-point1(1,2))^2); 
    b(i)=((X_test(i,1)-point2(1,1))^2+(X_test(i,2)-point2(1,2))^2); 
    c(i)=((X_test(i,1)-point3(1,1))^2+(X_test(i,2)-point3(1,2))^2);
    [m,n]=min([a(i),b(i),c(i)]);
    Y(i)=n;
end

for i=1:1565
    if Y(i)==1
        Y(i)=5;
    elseif Y(i)==2
        Y(i)=1;
    elseif Y(i)==3
        Y(i)=6;
    end
end
Y=Y'
accuracy=sum(Y==y_test)/1565;


%% problem (f) 
%% repeat problem(a)(b)
clear
clc
load('y_test.txt');
load('X_test.txt');
load('y_train.txt');
load('X_train.txt');



mean1=mean(X_train);
mean2=mean(X_test);
for i=1:7352    
    A1(i,:)=X_train(i,:)-mean1;
end
for i=1:2947
    A2(i,:)=X_test(i,:)-mean2;
end


cov1=A1'*A1/7352;
[vector,value]=eig(cov1);
pc=[vector(:,561),vector(:,560)];
a11=A1*pc(:,1);
a12=A1*pc(:,2);
a21=A2*pc(:,1);
a22=A2*pc(:,2);
X_train=[a11,a12];
X_test=[a21,a22];
y_train_walking=y_train;
y_train_standing=y_train;
y_train_laying=y_train;
y_train_walkingupstairs=y_train;
y_train_walkingdownstairs=y_train;
y_train_sitting=y_train;

%% set pixel for drawing boundary
for i=1:100
    for j=1:100
        x1((i-1)*100+j)=-10+1.5*i/5;
        x2((i-1)*100+j)=-10+1.5*j/5;
    end
end
x=[x1',x2'];
y=zeros(10000,1);


%% walking
clear X11 X12 X21 X22 data1 data2 mask1 mask2

for i=1:7352
    if y_train_walking(i)~=1
        y_train_walking(i)=0;
    end
end


model1=svmtrain(y_train_walking,X_train,'-c 100 -t 2 -h 0');
Y_walking=svmpredict(y,x,model1);

mask1=logical(Y_walking==1);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];

scatter(data1(:,1),data1(:,2),'ro');
hold on

%% standing
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:7352
    if y_train_standing(i)~=5
        y_train_standing(i)=0;
    end
end
model5=svmtrain(y_train_standing,X_train,'-c 100 -t 2 -h 0');
Y_standing=svmpredict(y,x,model5);

mask1=logical(Y_standing==5);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];

scatter(data1(:,1),data1(:,2),'go');
hold on

%% laying
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:7352
    if y_train_laying(i)~=6
        y_train_laying(i)=0;
    end
end
model6=svmtrain(y_train_laying,X_train,'-c 100 -t 2 -h 0');
Y_laying=svmpredict(y,x,model6);

mask1=logical(Y_laying==6);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];


scatter(data1(:,1),data1(:,2),'bo');
hold on

%% walking upstairs
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:7352
    if y_train_walkingupstairs(i)~=2
        y_train_walkingupstairs(i)=0;
    end
end
model2=svmtrain(y_train_walkingupstairs,X_train,'-c 100 -t 2 -h 0');
Y_walkingupstairs=svmpredict(y,x,model2);

mask2=logical(Y_walkingupstairs==2);
X21=x(:,1);
X22=x(:,2);
data2=[X21(mask2),X22(mask2)];


scatter(data2(:,1),data2(:,2),'yo');
hold on

%% walking downstairs
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:7352
    if y_train_walkingdownstairs(i)~=3
        y_train_walkingdownstairs(i)=0;
    end
end
model3=svmtrain(y_train_walkingdownstairs,X_train,'-c 100 -t 2 -h 0');
Y_walkingdownstairs=svmpredict(y,x,model3);

mask3=logical(Y_walkingdownstairs==3);
X31=x(:,1);
X32=x(:,2);
data3=[X31(mask3),X32(mask3)];

scatter(data3(:,1),data3(:,2),'mo');
hold on
%% sitting
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:7352
    if y_train_sitting(i)~=4
        y_train_sitting(i)=0;
    end
end
model4=svmtrain(y_train_sitting,X_train,'-c 100 -t 2 -h 0');
Y_sitting=svmpredict(y,x,model4);

mask4=logical(Y_sitting==4);
X41=x(:,1);
X42=x(:,2);
data4=[X41(mask4),X42(mask4)];

scatter(data4(:,1),data4(:,2),'co');
hold on

%% draw points
mask1=logical(y_train==1);
X11=X_train(:,1);
X12=X_train(:,2);
data1=[X11(mask1),X12(mask1)];

mask2=logical(y_train==2);
X21=X_train(:,1);
X22=X_train(:,2);
data2=[X21(mask2),X22(mask2)];

mask3=logical(y_train==3);
X31=X_train(:,1);
X32=X_train(:,2);
data3=[X31(mask3),X32(mask3)];

mask4=logical(y_train==4);
X41=X_train(:,1);
X42=X_train(:,2);
data4=[X41(mask4),X42(mask4)];

mask5=logical(y_train==5);
X51=X_train(:,1);
X52=X_train(:,2);
data5=[X51(mask5),X52(mask5)];

mask6=logical(y_train==6);
X61=X_train(:,1);
X62=X_train(:,2);
data6=[X61(mask6),X62(mask6)];

scatter(data1(:,1),data1(:,2),'cx');
hold on
scatter(data2(:,1),data2(:,2),'mx');
hold on
scatter(data3(:,1),data3(:,2),'yx');
hold on
scatter(data4(:,1),data4(:,2),'bx');
hold on
scatter(data5(:,1),data5(:,2),'gx');
hold on
scatter(data6(:,1),data6(:,2),'rx');
hold on


%% repeat problem(d)
clear X11 X12 X21 X22 X51 X52 X61 X62 data1 data5 data6 mask1 mask5 mask6
for i=1:2947
    if y_test(i)==1
        y_test_walking(i)=1;
    else
        y_test_walking(i)=0;
    end
    if y_test(i)==2
        y_test_walkingupstairs(i)=2;
    else
        y_test_walkingupstairs(i)=0;
    end
    if y_test(i)==3
        y_test_walkingdownstairs(i)=3;
    else
        y_test_walkingdownstairs(i)=0;
    end
    if y_test(i)==4
        y_test_sitting(i)=4;
    else
        y_test_sitting(i)=0;
    end
    if y_test(i)==5
        y_test_standing(i)=5;
    else
        y_test_standing(i)=0;
    end
    if y_test(i)==6
        y_test_laying(i)=6;
    else
        y_test_laying(i)=0;
    end
end

y_test_walking=y_test_walking';
y_test_walkingupstairs=y_test_walkingupstairs';
y_test_walkingdownstairs=y_test_walkingdownstairs';
y_test_sitting=y_test_sitting';
y_test_standing=y_test_standing';
y_test_laying=y_test_laying';
label_walking=svmpredict(y_test_walking,X_test,model1);
label_walkingupstairs=svmpredict(y_test_walkingupstairs,X_test,model2);
label_walkingdownstairs=svmpredict(y_test_walkingdownstairs,X_test,model3);
label_sitting=svmpredict(y_test_sitting,X_test,model4);
label_standing=svmpredict(y_test_standing,X_test,model5);
label_laying=svmpredict(y_test_laying,X_test,model6);

reallabel=label_walking;
for i=1:2947
    if reallabel(i)==0
        reallabel(i)=label_walkingupstairs(i);
    elseif reallabel(i)~=0 && label_walkingupstairs(i)~=0
        r=round(rand);
        if r==1 
            reallabel(i)=label_walkingupstairs(i);
        end
    end
end
    
for i=1:2947
    if reallabel(i)==0
        reallabel(i)=label_walkingdownstairs(i);
    elseif reallabel(i)~=0 && label_walkingdownstairs(i)~=0
        r=round(rand);
        if r==1 
            reallabel(i)=label_walkingdownstairs(i);
        end
    end
end         
 
for i=1:2947
    if reallabel(i)==0
        reallabel(i)=label_sitting(i);
    elseif reallabel(i)~=0 && label_sitting(i)~=0
        r=round(rand);
        if r==1 
            reallabel(i)=label_sitting(i);
        end
    end
end

for i=1:2947
    if reallabel(i)==0
        reallabel(i)=label_standing(i);
    elseif reallabel(i)~=0 && label_standing(i)~=0
        r=round(rand);
        if r==1 
            reallabel(i)=label_standing(i);
        end
    end
end

for i=1:2947
    if reallabel(i)==0
        reallabel(i)=label_laying(i);
    elseif reallabel(i)~=0 && label_laying(i)~=0
        r=round(rand);
        if r==1 
            reallabel(i)=label_laying(i);
        end
    end
end

confusion=confusionmat(reallabel,y_test);
confusion(1,:)=[];
confusion(:,1)=[];
accuracy=sum(reallabel==y_test)/2947;

%% problem (i)
clear
clc
load('y_test.txt');
load('X_test.txt');
load('y_train.txt');
load('X_train.txt');



mean1=mean(X_train);
mean2=mean(X_test);
for i=1:7352    
    A1(i,:)=X_train(i,:)-mean1;
end
for i=1:2947
    A2(i,:)=X_test(i,:)-mean2;
end


cov1=A1'*A1/7352;
[vector,value]=eig(cov1);
pc=vector(:,561);
n=100;
for i=1:n-1
    pc=[pc,vector(:,561-i)];
end

X_train=A1*pc;
X_test=A2*pc;

y_train_walking=y_train;
y_train_standing=y_train;
y_train_laying=y_train;
y_train_walkingupstairs=y_train;
y_train_walkingdownstairs=y_train;
y_train_sitting=y_train;

%% set pixel for drawing boundary
for i=1:100
    for j=1:100
        x1((i-1)*100+j)=-10+1.5*i/5;
        x2((i-1)*100+j)=-10+1.5*j/5;
    end
end
x=[x1',x2'];
y=zeros(10000,1);


%% walking
clear X11 X12 X21 X22 data1 data2 mask1 mask2

for i=1:7352
    if y_train_walking(i)~=1
        y_train_walking(i)=0;
    end
end


model1=svmtrain(y_train_walking,X_train,'-c 100 -t 2 -h 0');
Y_walking=svmpredict(y,x,model1);

mask1=logical(Y_walking==1);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];

scatter(data1(:,1),data1(:,2),'ro');
hold on

%% standing
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:7352
    if y_train_standing(i)~=5
        y_train_standing(i)=0;
    end
end
model5=svmtrain(y_train_standing,X_train,'-c 100 -t 2 -h 0');
Y_standing=svmpredict(y,x,model5);

mask1=logical(Y_standing==5);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];

scatter(data1(:,1),data1(:,2),'go');
hold on

%% laying
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:7352
    if y_train_laying(i)~=6
        y_train_laying(i)=0;
    end
end
model6=svmtrain(y_train_laying,X_train,'-c 100 -t 2 -h 0');
Y_laying=svmpredict(y,x,model6);

mask1=logical(Y_laying==6);
X11=x(:,1);
X12=x(:,2);
data1=[X11(mask1),X12(mask1)];


scatter(data1(:,1),data1(:,2),'bo');
hold on

%% walking upstairs
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:7352
    if y_train_walkingupstairs(i)~=2
        y_train_walkingupstairs(i)=0;
    end
end
model2=svmtrain(y_train_walkingupstairs,X_train,'-c 100 -t 2 -h 0');
Y_walkingupstairs=svmpredict(y,x,model2);

mask2=logical(Y_walkingupstairs==2);
X21=x(:,1);
X22=x(:,2);
data2=[X21(mask2),X22(mask2)];


scatter(data2(:,1),data2(:,2),'yo');
hold on

%% walking downstairs
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:7352
    if y_train_walkingdownstairs(i)~=3
        y_train_walkingdownstairs(i)=0;
    end
end
model3=svmtrain(y_train_walkingdownstairs,X_train,'-c 100 -t 2 -h 0');
Y_walkingdownstairs=svmpredict(y,x,model3);

mask3=logical(Y_walkingdownstairs==3);
X31=x(:,1);
X32=x(:,2);
data3=[X31(mask3),X32(mask3)];

scatter(data3(:,1),data3(:,2),'mo');
hold on
%% sitting
clear X11 X12 X21 X22 data1 data2 mask1 mask2
for i=1:7352
    if y_train_sitting(i)~=4
        y_train_sitting(i)=0;
    end
end
model4=svmtrain(y_train_sitting,X_train,'-c 100 -t 2 -h 0');
Y_sitting=svmpredict(y,x,model4);

mask4=logical(Y_sitting==4);
X41=x(:,1);
X42=x(:,2);
data4=[X41(mask4),X42(mask4)];

scatter(data4(:,1),data4(:,2),'co');
hold on

%% draw points
mask1=logical(y_train==1);
X11=X_train(:,1);
X12=X_train(:,2);
data1=[X11(mask1),X12(mask1)];

mask2=logical(y_train==2);
X21=X_train(:,1);
X22=X_train(:,2);
data2=[X21(mask2),X22(mask2)];

mask3=logical(y_train==3);
X31=X_train(:,1);
X32=X_train(:,2);
data3=[X31(mask3),X32(mask3)];

mask4=logical(y_train==4);
X41=X_train(:,1);
X42=X_train(:,2);
data4=[X41(mask4),X42(mask4)];

mask5=logical(y_train==5);
X51=X_train(:,1);
X52=X_train(:,2);
data5=[X51(mask5),X52(mask5)];

mask6=logical(y_train==6);
X61=X_train(:,1);
X62=X_train(:,2);
data6=[X61(mask6),X62(mask6)];

scatter(data1(:,1),data1(:,2),'cx');
hold on
scatter(data2(:,1),data2(:,2),'mx');
hold on
scatter(data3(:,1),data3(:,2),'yx');
hold on
scatter(data4(:,1),data4(:,2),'bx');
hold on
scatter(data5(:,1),data5(:,2),'gx');
hold on
scatter(data6(:,1),data6(:,2),'rx');
hold on


%% repeat problem(d)
clear X11 X12 X21 X22 X51 X52 X61 X62 data1 data5 data6 mask1 mask5 mask6
for i=1:2947
    if y_test(i)==1
        y_test_walking(i)=1;
    else
        y_test_walking(i)=0;
    end
    if y_test(i)==2
        y_test_walkingupstairs(i)=2;
    else
        y_test_walkingupstairs(i)=0;
    end
    if y_test(i)==3
        y_test_walkingdownstairs(i)=3;
    else
        y_test_walkingdownstairs(i)=0;
    end
    if y_test(i)==4
        y_test_sitting(i)=4;
    else
        y_test_sitting(i)=0;
    end
    if y_test(i)==5
        y_test_standing(i)=5;
    else
        y_test_standing(i)=0;
    end
    if y_test(i)==6
        y_test_laying(i)=6;
    else
        y_test_laying(i)=0;
    end
end

y_test_walking=y_test_walking';
y_test_walkingupstairs=y_test_walkingupstairs';
y_test_walkingdownstairs=y_test_walkingdownstairs';
y_test_sitting=y_test_sitting';
y_test_standing=y_test_standing';
y_test_laying=y_test_laying';
label_walking=svmpredict(y_test_walking,X_test,model1);
label_walkingupstairs=svmpredict(y_test_walkingupstairs,X_test,model2);
label_walkingdownstairs=svmpredict(y_test_walkingdownstairs,X_test,model3);
label_sitting=svmpredict(y_test_sitting,X_test,model4);
label_standing=svmpredict(y_test_standing,X_test,model5);
label_laying=svmpredict(y_test_laying,X_test,model6);

reallabel=label_walking;
for i=1:2947
    if reallabel(i)==0
        reallabel(i)=label_walkingupstairs(i);
    elseif reallabel(i)~=0 && label_walkingupstairs(i)~=0
        r=round(rand);
        if r==1 
            reallabel(i)=label_walkingupstairs(i);
        end
    end
end
    
for i=1:2947
    if reallabel(i)==0
        reallabel(i)=label_walkingdownstairs(i);
    elseif reallabel(i)~=0 && label_walkingdownstairs(i)~=0
        r=round(rand);
        if r==1 
            reallabel(i)=label_walkingdownstairs(i);
        end
    end
end         
 
for i=1:2947
    if reallabel(i)==0
        reallabel(i)=label_sitting(i);
    elseif reallabel(i)~=0 && label_sitting(i)~=0
        r=round(rand);
        if r==1 
            reallabel(i)=label_sitting(i);
        end
    end
end

for i=1:2947
    if reallabel(i)==0
        reallabel(i)=label_standing(i);
    elseif reallabel(i)~=0 && label_standing(i)~=0
        r=round(rand);
        if r==1 
            reallabel(i)=label_standing(i);
        end
    end
end

for i=1:2947
    if reallabel(i)==0
        reallabel(i)=label_laying(i);
    elseif reallabel(i)~=0 && label_laying(i)~=0
        r=round(rand);
        if r==1 
            reallabel(i)=label_laying(i);
        end
    end
end

confusion=confusionmat(reallabel,y_test);
confusion(1,:)=[];
confusion(:,1)=[];
accuracy=sum(reallabel==y_test)/2947;
