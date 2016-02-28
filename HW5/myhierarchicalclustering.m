%{
%% problem (a)
%% Euclidean distance:single linkage
clear
clc
load('data.txt')
dist=zeros(30,30);
index=[1:30]';
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        dist(i,j)=pdist(twopoints,'euclidean');
        if i==j
            dist(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(dist);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    dist(32-i,:)=min([dist(order1,:);dist(order2,:)]);
    dist(:,32-i)=[dist(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,dist(order1,order2)];
    if realorder1>realorder2
        dist(order1,:)=[];
        dist(order2,:)=[];
        dist(:,order1)=[];
        dist(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        dist(order2,:)=[];
        dist(order1,:)=[];
        dist(:,order2)=[];
        dist(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
dendrogram(output);


%% Euclidean distance:complete linkage
clear
clc
load('data.txt')
dist=zeros(30,30);
index=[1:30]';
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        dist(i,j)=pdist(twopoints,'euclidean');
        if i==j
            dist(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(dist);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    dist(32-i,:)=max([dist(order1,:);dist(order2,:)]);
    dist(:,32-i)=[dist(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,dist(order1,order2)];
    if realorder1>realorder2
        dist(order1,:)=[];
        dist(order2,:)=[];
        dist(:,order1)=[];
        dist(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        dist(order2,:)=[];
        dist(order1,:)=[];
        dist(:,order2)=[];
        dist(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
dendrogram(output);

%% Euclidean distance:average linkage
clear
clc
load('data.txt')
dist=zeros(30,30);
index=[1:30]';
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        dist(i,j)=pdist(twopoints,'euclidean');
        if i==j
            dist(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(dist);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    dist(32-i,:)=mean([dist(order1,:);dist(order2,:)]);
    dist(:,32-i)=[dist(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,dist(order1,order2)];
    if realorder1>realorder2
        dist(order1,:)=[];
        dist(order2,:)=[];
        dist(:,order1)=[];
        dist(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        dist(order2,:)=[];
        dist(order1,:)=[];
        dist(:,order2)=[];
        dist(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
dendrogram(output);


%% Cosine similarity:single linkage
clear
clc
load('data.txt')
cossimilarity=zeros(30,30);
index=[1:30]';
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        cossimilarity(i,j)=1-(twopoints(1,:)*twopoints(2,:)')/(norm(twopoints(1,:))*norm(twopoints(2,:)));
        if i==j
            cossimilarity(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(cossimilarity);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    cossimilarity(32-i,:)=min([cossimilarity(order1,:);cossimilarity(order2,:)]);
    cossimilarity(:,32-i)=[cossimilarity(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,cossimilarity(order1,order2)];
    if realorder1>realorder2
        cossimilarity(order1,:)=[];
        cossimilarity(order2,:)=[];
        cossimilarity(:,order1)=[];
        cossimilarity(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        cossimilarity(order2,:)=[];
        cossimilarity(order1,:)=[];
        cossimilarity(:,order2)=[];
        cossimilarity(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
dendrogram(output);


%% Cosine similarity:complete linkage
clear
clc
load('data.txt')
cossimilarity=zeros(30,30);
index=[1:30]';
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        cossimilarity(i,j)=1-(twopoints(1,:)*twopoints(2,:)')/(norm(twopoints(1,:))*norm(twopoints(2,:)));
        if i==j
            cossimilarity(i,j)=10000;
        end
    end
end

for i=1:29
    [value,order]=min(cossimilarity);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    cossimilarity(32-i,:)=max([cossimilarity(order1,:);cossimilarity(order2,:)]);
    cossimilarity(:,32-i)=[cossimilarity(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,cossimilarity(order1,order2)];
    if realorder1>realorder2
        cossimilarity(order1,:)=[];
        cossimilarity(order2,:)=[];
        cossimilarity(:,order1)=[];
        cossimilarity(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        cossimilarity(order2,:)=[];
        cossimilarity(order1,:)=[];
        cossimilarity(:,order2)=[];
        cossimilarity(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
dendrogram(output);


%% Cosine similarity:average linkage
clear
clc
load('data.txt')
cossimilarity=zeros(30,30);
index=[1:30]';
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        cossimilarity(i,j)=1-(twopoints(1,:)*twopoints(2,:)')/(norm(twopoints(1,:))*norm(twopoints(2,:)));
        if i==j
            cossimilarity(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(cossimilarity);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    cossimilarity(32-i,:)=mean([cossimilarity(order1,:);cossimilarity(order2,:)]);
    cossimilarity(:,32-i)=[cossimilarity(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,cossimilarity(order1,order2)];
    if realorder1>realorder2
        cossimilarity(order1,:)=[];
        cossimilarity(order2,:)=[];
        cossimilarity(:,order1)=[];
        cossimilarity(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        cossimilarity(order2,:)=[];
        cossimilarity(order1,:)=[];
        cossimilarity(:,order2)=[];
        cossimilarity(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
dendrogram(output);

%% problem (b)

%% Euclidean distance:single linkage
clear
clc
load('labels.txt')
load('data.txt')
data(:,1)=data(:,1)/(max(data(:,1))-min(data(:,1)));
data(:,2)=data(:,2)/(max(data(:,2))-min(data(:,2)));
dist=zeros(30,30);
index=[1:30]';
state=[1:30];
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        dist(i,j)=pdist(twopoints,'euclidean');
        if i==j
            dist(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(dist);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    if (i<29 && state(realorder1)>state(realorder2))
        state(30+i)=state(realorder1);
        for j=1:30+i
            if (state(j)==state(realorder2))
                state(j)=state(realorder1);
            end
        end
        state(realorder2)=state(realorder1);
        
        
    elseif (i<29 && state(realorder1)<state(realorder2))
        state(30+i)=state(realorder2);
        for j=1:30+i
            if (state(j)==state(realorder1))
                state(j)=state(realorder2);
            end
        end
        state(realorder1)=state(realorder2);
        
    end
    dist(32-i,:)=min([dist(order1,:);dist(order2,:)]);
    dist(:,32-i)=[dist(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,dist(order1,order2)];
    if realorder1>realorder2
        dist(order1,:)=[];
        dist(order2,:)=[];
        dist(:,order1)=[];
        dist(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        dist(order2,:)=[];
        dist(order1,:)=[];
        dist(:,order2)=[];
        dist(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
data1=data;
data2=data;
n=0;
for i=1:30
    if (state(i)==30)
        Y(i)=1;
    else
        Y(i)=2;
    end
end
for i=1:30
    if (Y(i)==labels(i))
        n=n+1;
    end
end
accuracy=n/30;
disp(accuracy);
for i=1:30
    if (state(31-i)==30)
        data1(31-i,:)=[];
        
    else 
       data2(31-i,:)=[];
    end
end

plot(data1(:,1),data1(:,2),'go');
hold on 
plot(data2(:,1),data2(:,2),'rx');
axis([-1 1 -1 1]);

%% Euclidean distance:complete linkage
clear
clc
load('labels.txt')
load('data.txt')
data(:,1)=data(:,1)/(max(data(:,1))-min(data(:,1)));
data(:,2)=data(:,2)/(max(data(:,2))-min(data(:,2)));
dist=zeros(30,30);
index=[1:30]';
state=[1:30];
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        dist(i,j)=pdist(twopoints,'euclidean');
        if i==j
            dist(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(dist);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    if (i<29 && state(realorder1)>state(realorder2))
        state(30+i)=state(realorder1);
        for j=1:30+i
            if (state(j)==state(realorder2))
                state(j)=state(realorder1);
            end
        end
        state(realorder2)=state(realorder1);
        
        
    elseif (i<29 && state(realorder1)<state(realorder2))
        state(30+i)=state(realorder2);
        for j=1:30+i
            if (state(j)==state(realorder1))
                state(j)=state(realorder2);
            end
        end
        state(realorder1)=state(realorder2);
        
    end
    dist(32-i,:)=max([dist(order1,:);dist(order2,:)]);
    dist(:,32-i)=[dist(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,dist(order1,order2)];
    if realorder1>realorder2
        dist(order1,:)=[];
        dist(order2,:)=[];
        dist(:,order1)=[];
        dist(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        dist(order2,:)=[];
        dist(order1,:)=[];
        dist(:,order2)=[];
        dist(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
data1=data;
data2=data;
n=0;
for i=1:30
    if (state(i)==21)
        Y(i)=1;
    else
        Y(i)=2;
    end
end
for i=1:30
    if (Y(i)==labels(i))
        n=n+1;
    end
end
accuracy=n/30;
disp(accuracy);
for i=1:30
    if (state(31-i)==21)
        data1(31-i,:)=[];
        
    else 
       data2(31-i,:)=[];
    end
end

plot(data1(:,1),data1(:,2),'go');
hold on 
plot(data2(:,1),data2(:,2),'rx');
axis([-1 1 -1 1]);


%% Euclidean distance:average linkage
clear
clc
load('labels.txt')
load('data.txt')
data(:,1)=data(:,1)/(max(data(:,1))-min(data(:,1)));
data(:,2)=data(:,2)/(max(data(:,2))-min(data(:,2)));
dist=zeros(30,30);
index=[1:30]';
state=[1:30];
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        dist(i,j)=pdist(twopoints,'euclidean');
        if i==j
            dist(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(dist);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    if (i<29 && state(realorder1)>state(realorder2))
        state(30+i)=state(realorder1);
        for j=1:30+i
            if (state(j)==state(realorder2))
                state(j)=state(realorder1);
            end
        end
        state(realorder2)=state(realorder1);
        
        
    elseif (i<29 && state(realorder1)<state(realorder2))
        state(30+i)=state(realorder2);
        for j=1:30+i
            if (state(j)==state(realorder1))
                state(j)=state(realorder2);
            end
        end
        state(realorder1)=state(realorder2);
        
    end
    dist(32-i,:)=mean([dist(order1,:);dist(order2,:)]);
    dist(:,32-i)=[dist(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,dist(order1,order2)];
    if realorder1>realorder2
        dist(order1,:)=[];
        dist(order2,:)=[];
        dist(:,order1)=[];
        dist(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        dist(order2,:)=[];
        dist(order1,:)=[];
        dist(:,order2)=[];
        dist(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
data1=data;
data2=data;
n=0;
for i=1:30
    if (state(i)==11)
        Y(i)=1;
    else
        Y(i)=2;
    end
end
for i=1:30
    if (Y(i)==labels(i))
        n=n+1;
    end
end
accuracy=n/30;
disp(accuracy);
for i=1:30
    if (state(31-i)==11)
        data1(31-i,:)=[];
        
    else 
       data2(31-i,:)=[];
    end
end

plot(data1(:,1),data1(:,2),'go');
hold on 
plot(data2(:,1),data2(:,2),'rx');
axis([-1 1 -1 1]);


%% Cosine Similarity:single linkage
clear
clc
load('data.txt')
load('labels.txt')
data(:,1)=data(:,1)/(max(data(:,1))-min(data(:,1)));
data(:,2)=data(:,2)/(max(data(:,2))-min(data(:,2)));
cossimilarity=zeros(30,30);
index=[1:30]';
state=[1:30];
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        cossimilarity(i,j)=1-(twopoints(1,:)*twopoints(2,:)')/(norm(twopoints(1,:))*norm(twopoints(2,:)));
        if i==j
            cossimilarity(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(cossimilarity);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    if (i<29 && state(realorder1)>state(realorder2))
        state(30+i)=state(realorder1);
        for j=1:30+i
            if (state(j)==state(realorder2))
                state(j)=state(realorder1);
            end
        end
        state(realorder2)=state(realorder1);
        
        
    elseif (i<29 && state(realorder1)<state(realorder2))
        state(30+i)=state(realorder2);
        for j=1:30+i
            if (state(j)==state(realorder1))
                state(j)=state(realorder2);
            end
        end
        state(realorder1)=state(realorder2);
        
    end
    cossimilarity(32-i,:)=min([cossimilarity(order1,:);cossimilarity(order2,:)]);
    cossimilarity(:,32-i)=[cossimilarity(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,cossimilarity(order1,order2)];
    if realorder1>realorder2
        cossimilarity(order1,:)=[];
        cossimilarity(order2,:)=[];
        cossimilarity(:,order1)=[];
        cossimilarity(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        cossimilarity(order2,:)=[];
        cossimilarity(order1,:)=[];
        cossimilarity(:,order2)=[];
        cossimilarity(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
data1=data;
data2=data;
n=0;
for i=1:30
    if (state(i)== 30)
        Y(i)=1;
    else
        Y(i)=2;
    end
end
for i=1:30
    if (Y(i)==labels(i))
        n=n+1;
    end
end
accuracy=n/30;
disp(accuracy);
for i=1:30
    if (state(31-i)== 30)
        data1(31-i,:)=[];
        
    else 
       data2(31-i,:)=[];
    end
end

plot(data1(:,1),data1(:,2),'go');
hold on 
plot(data2(:,1),data2(:,2),'rx');
axis([-1 1 -1 1]);



%% Cosine Similarity:complete linkage
clear
clc
load('data.txt')
load('labels.txt')
data(:,1)=data(:,1)/(max(data(:,1))-min(data(:,1)));
data(:,2)=data(:,2)/(max(data(:,2))-min(data(:,2)));
cossimilarity=zeros(30,30);
index=[1:30]';
state=[1:30];
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        cossimilarity(i,j)=1-(twopoints(1,:)*twopoints(2,:)')/(norm(twopoints(1,:))*norm(twopoints(2,:)));
        if i==j
            cossimilarity(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(cossimilarity);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    if (i<29 && state(realorder1)>state(realorder2))
        state(30+i)=state(realorder1);
        for j=1:30+i
            if (state(j)==state(realorder2))
                state(j)=state(realorder1);
            end
        end
        state(realorder2)=state(realorder1);
        
        
    elseif (i<29 && state(realorder1)<state(realorder2))
        state(30+i)=state(realorder2);
        for j=1:30+i
            if (state(j)==state(realorder1))
                state(j)=state(realorder2);
            end
        end
        state(realorder1)=state(realorder2);
        
    end
    cossimilarity(32-i,:)=max([cossimilarity(order1,:);cossimilarity(order2,:)]);
    cossimilarity(:,32-i)=[cossimilarity(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,cossimilarity(order1,order2)];
    if realorder1>realorder2
        cossimilarity(order1,:)=[];
        cossimilarity(order2,:)=[];
        cossimilarity(:,order1)=[];
        cossimilarity(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        cossimilarity(order2,:)=[];
        cossimilarity(order1,:)=[];
        cossimilarity(:,order2)=[];
        cossimilarity(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
data1=data;
data2=data;
n=0;
for i=1:30
    if (state(i)==29)
        Y(i)=1;
    else
        Y(i)=2;
    end
end
for i=1:30
    if (Y(i)==labels(i))
        n=n+1;
    end
end
accuracy=n/30;
disp(accuracy);
for i=1:30
    if (state(31-i)==29)
        data1(31-i,:)=[];
        
    else 
       data2(31-i,:)=[];
    end
end

plot(data1(:,1),data1(:,2),'go');
hold on 
plot(data2(:,1),data2(:,2),'rx');
axis([-1 1 -1 1]);

%}
%% Cosine Similarity:average linkage
clear
clc
load('data.txt')
load('labels.txt')
data(:,1)=data(:,1)/(max(data(:,1))-min(data(:,1)));
data(:,2)=data(:,2)/(max(data(:,2))-min(data(:,2)));
cossimilarity=zeros(30,30);
index=[1:30]';
state=[1:30];
for i=1:30
    for j=1:30
        twopoints=[data(i,:);data(j,:)];
        cossimilarity(i,j)=1-(twopoints(1,:)*twopoints(2,:)')/(norm(twopoints(1,:))*norm(twopoints(2,:)));
        if i==j
            cossimilarity(i,j)=10000;
        end
    end
end
for i=1:29
    [value,order]=min(cossimilarity);
    [~,order1]=min(value);
    order2=order(order1);
    realorder1=index(order1);
    realorder2=index(order2);
    if (i<29 && state(realorder1)>state(realorder2))
        state(30+i)=state(realorder1);
        for j=1:30+i
            if (state(j)==state(realorder2))
                state(j)=state(realorder1);
            end
        end
        state(realorder2)=state(realorder1);
        
        
    elseif (i<29 && state(realorder1)<state(realorder2))
        state(30+i)=state(realorder2);
        for j=1:30+i
            if (state(j)==state(realorder1))
                state(j)=state(realorder2);
            end
        end
        state(realorder1)=state(realorder2);
        
    end
    cossimilarity(32-i,:)=mean([cossimilarity(order1,:);cossimilarity(order2,:)]);
    cossimilarity(:,32-i)=[cossimilarity(32-i,:)';10000];
    index(32-i)=30+i;
    output(i,:)=[realorder1,realorder2,cossimilarity(order1,order2)];
    if realorder1>realorder2
        cossimilarity(order1,:)=[];
        cossimilarity(order2,:)=[];
        cossimilarity(:,order1)=[];
        cossimilarity(:,order2)=[];
        index(order1)=[];
        index(order2)=[];
    else
        cossimilarity(order2,:)=[];
        cossimilarity(order1,:)=[];
        cossimilarity(:,order2)=[];
        cossimilarity(:,order1)=[];
        index(order2)=[];
        index(order1)=[];
    end
end
data1=data;
data2=data;
n=0;
for i=1:30
    if (state(i)== 29)
        Y(i)=1;
    else
        Y(i)=2;
    end
end
for i=1:30
    if (Y(i)==labels(i))
        n=n+1;
    end
end
accuracy=n/30;
disp(accuracy);
for i=1:30
    if (state(31-i)== 29)
        data1(31-i,:)=[];
        
    else 
       data2(31-i,:)=[];
    end
end

plot(data1(:,1),data1(:,2),'go');
hold on 
plot(data2(:,1),data2(:,2),'rx');
axis([-1 1 -1 1]);


%% problem(c)
%% euclidean distance
clear
clc
load('data.txt')
load('labels.txt')
index=[1:30];
point1=data(10,:);
point2=data(20,:);
for n=1:20
    data1=data;
    data2=data;
    for i=1:30
        
        twopoints1=[data(i,:);point1];
        twopoints2=[data(i,:);point2];
        dist1=pdist(twopoints1,'euclidean');
        dist2=pdist(twopoints2,'euclidean');
        if dist1>dist2
            index(i)=1;
        else
            index(i)=2;
        end
    end
    for j=1:30
        if index(31-j)==1
            data1(31-j,:)=[];
        elseif index(31-j)==2
            data2(31-j,:)=[];
        end 
    end

mean1=[mean(data1(:,1));mean(data1(:,2))];
mean2=[mean(data2(:,1));mean(data2(:,2))];
point1=mean1';
point2=mean2';       
end
accuracy=sum(double(index'~=labels))/30;
plot(data1(:,1),data1(:,2),'go');
hold on 
plot(data2(:,1),data2(:,2),'rx');
    
%% Cosine similarity
clear
clc
load('data.txt')
load('labels.txt')
index=[1:30];
point1=data(10,:);
point2=data(20,:);
for n=1:20
    data1=data;
    data2=data;
    for i=1:30
        
        twopoints1=[data(i,:);point1];
        twopoints2=[data(i,:);point2];
        dist1=1-(twopoints1(1,:)*twopoints1(2,:)')/(norm(twopoints1(1,:))*norm(twopoints1(2,:)));
        dist2=1-(twopoints2(1,:)*twopoints2(2,:)')/(norm(twopoints2(1,:))*norm(twopoints2(2,:)));
        if dist1>dist2
            index(i)=1;
        else
            index(i)=2;
        end
    end
    for j=1:30
        if index(31-j)==1
            data1(31-j,:)=[];
        elseif index(31-j)==2
            data2(31-j,:)=[];
        end 
    end

mean1=[mean(data1(:,1));mean(data1(:,2))];
mean2=[mean(data2(:,1));mean(data2(:,2))];
point1=mean1';
point2=mean2';       
end
accuracy=sum(double(index'~=labels))/30;
plot(data1(:,1),data1(:,2),'go');
hold on 
plot(data2(:,1),data2(:,2),'rx');
 
     
       
            