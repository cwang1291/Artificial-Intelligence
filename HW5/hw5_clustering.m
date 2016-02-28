function hw5_clustering()
%==========================================================================
%

%
% Name: Weifu Wang
%
% No inputs are required to run this function, and no other scripts or 
% functions are needed to complete this problem.
%
% Three datasets have been provided as text files with this assignment:
%   data_a.txt
%   data_b.txt
%   data_c.txt
%

% For each dataset, implement unsupervised clustering using the
% following methods (see helper functions below, which you must complete):
%   cluster_kmeans
%   cluster_hierarchical('single',...)
%   cluster_spectral
%
% Plot the clustering results for each dataset, using a separate color for
% each cluster.
%
% In addition, save the cluster labels for each dataset in text files:
%   clusters_a.txt
%   clusters_b.txt
%   clusters_c.txt
%
% You may assume that the number of cluster is known (it is 5).
%
%
%==========================================================================
clear 
clc

% (a)
x=load('data_a.txt');
%% kmeans
label = cluster_kmeans(x,5);
data1=x;
data2=x;
data3=x;
data4=x;
data5=x;
n=size(x,1);
for j=1:n
    if label(n+1-j)==1
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==2
        data1(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];            
    elseif label(n+1-j)==3
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==4
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==5
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
    end 
end     
plot(data1(:,1),data1(:,2),'g.');
hold on
plot(data2(:,1),data2(:,2),'r.');
hold on 
plot(data3(:,1),data3(:,2),'b.');
hold on
plot(data4(:,1),data4(:,2),'y.');
hold on 
plot(data5(:,1),data5(:,2),'m.');

%% single link
link='single';
x=load('data_a.txt');
label = cluster_hierarchical(link,x,5);
data1=x;
data2=x;
data3=x;
data4=x;
data5=x;
n=size(x,1);
for j=1:n
    if label(n+1-j)==1
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==2
        data1(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];            
    elseif label(n+1-j)==3
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==4
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==5
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
    end 
end     
plot(data1(:,1),data1(:,2),'g.');
hold on
plot(data2(:,1),data2(:,2),'r.');
hold on 
plot(data3(:,1),data3(:,2),'b.');
hold on
plot(data4(:,1),data4(:,2),'y.');
hold on 
plot(data5(:,1),data5(:,2),'m.');


%% spectral clustering
x=load('data_a.txt');
labels=cluster_spectral(x,5);
mask1=logical(labels==1);
mask2=logical(labels==2);
mask3=logical(labels==3);
mask4=logical(labels==4);
mask5=logical(labels==5);
A1=x(:,1);
B1=x(:,2);
A2=x(:,1);
B2=x(:,2);
A3=x(:,1);
B3=x(:,2);
A4=x(:,1);
B4=x(:,2);
A5=x(:,1);
B5=x(:,2);
data1=[A1(mask1),B1(mask1)];
data2=[A2(mask2),B2(mask2)];
data3=[A3(mask3),B3(mask3)];
data4=[A4(mask4),B4(mask4)];
data5=[A5(mask5),B5(mask5)];

plot(data1(:,1),data1(:,2),'g.');
hold on
plot(data2(:,1),data2(:,2),'r.');
hold on 
plot(data3(:,1),data3(:,2),'b.');
hold on
plot(data4(:,1),data4(:,2),'y.');
hold on 
plot(data5(:,1),data5(:,2),'m.');

% (b)
x=load('data_b.txt');
%% kmeans
label = cluster_kmeans(x,5);
data1=x;
data2=x;
data3=x;
data4=x;
data5=x;
n=size(x,1);
for j=1:n
    if label(n+1-j)==1
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==2
        data1(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];            
    elseif label(n+1-j)==3
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==4
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==5
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
    end 
end     
plot(data1(:,1),data1(:,2),'g.');
hold on
plot(data2(:,1),data2(:,2),'r.');
hold on 
plot(data3(:,1),data3(:,2),'b.');
hold on
plot(data4(:,1),data4(:,2),'y.');
hold on 
plot(data5(:,1),data5(:,2),'m.');


%% single link
x=load('data_b.txt');
link='single';
label = cluster_hierarchical(link,x,5);
data1=x;
data2=x;
data3=x;
data4=x;
data5=x;
n=size(x,1);
for j=1:n
    if label(n+1-j)==1
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==2
        data1(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];            
    elseif label(n+1-j)==3
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==4
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==5
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
    end 
end     
plot(data1(:,1),data1(:,2),'g.');
hold on
plot(data2(:,1),data2(:,2),'r.');
hold on 
plot(data3(:,1),data3(:,2),'b.');
hold on
plot(data4(:,1),data4(:,2),'y.');
hold on 
plot(data5(:,1),data5(:,2),'m.');

%% spectral clustering
x=load('data_b.txt');
labels=cluster_spectral(x,5);
mask1=logical(labels==1);
mask2=logical(labels==2);
mask3=logical(labels==3);
mask4=logical(labels==4);
mask5=logical(labels==5);
A1=x(:,1);
B1=x(:,2);
A2=x(:,1);
B2=x(:,2);
A3=x(:,1);
B3=x(:,2);
A4=x(:,1);
B4=x(:,2);
A5=x(:,1);
B5=x(:,2);
data1=[A1(mask1),B1(mask1)];
data2=[A2(mask2),B2(mask2)];
data3=[A3(mask3),B3(mask3)];
data4=[A4(mask4),B4(mask4)];
data5=[A5(mask5),B5(mask5)];

plot(data1(:,1),data1(:,2),'g.');
hold on
plot(data2(:,1),data2(:,2),'r.');
hold on 
plot(data3(:,1),data3(:,2),'b.');
hold on
plot(data4(:,1),data4(:,2),'y.');
hold on 
plot(data5(:,1),data5(:,2),'m.');

% (c)
x=load('data_c.txt');
%% kmeans
label = cluster_kmeans(x,5);
data1=x;
data2=x;
data3=x;
data4=x;
data5=x;
n=size(x,1);
for j=1:n
    if label(n+1-j)==1
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==2
        data1(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];            
    elseif label(n+1-j)==3
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==4
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==5
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
    end 
end     
plot(data1(:,1),data1(:,2),'g.');
hold on
plot(data2(:,1),data2(:,2),'r.');
hold on 
plot(data3(:,1),data3(:,2),'b.');
hold on
plot(data4(:,1),data4(:,2),'y.');
hold on 
plot(data5(:,1),data5(:,2),'m.');

%% single link
link='single';
x=load('data_c.txt');
label = cluster_hierarchical(link,x,5);
data1=x;
data2=x;
data3=x;
data4=x;
data5=x;
n=size(x,1);
for j=1:n
    if label(n+1-j)==1
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==2
        data1(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];            
    elseif label(n+1-j)==3
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data4(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==4
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data5(n+1-j,:)=[];
    elseif label(n+1-j)==5
        data1(n+1-j,:)=[];
        data2(n+1-j,:)=[];
        data3(n+1-j,:)=[];
        data4(n+1-j,:)=[];
    end 
end     
plot(data1(:,1),data1(:,2),'g.');
hold on
plot(data2(:,1),data2(:,2),'r.');
hold on 
plot(data3(:,1),data3(:,2),'b.');
hold on
plot(data4(:,1),data4(:,2),'y.');
hold on 
plot(data5(:,1),data5(:,2),'m.');

%% spectral clustering
x=load('data_c.txt');
labels=cluster_spectral(x,5);
mask1=logical(labels==1);
mask2=logical(labels==2);
mask3=logical(labels==3);
mask4=logical(labels==4);
mask5=logical(labels==5);
A1=x(:,1);
B1=x(:,2);
A2=x(:,1);
B2=x(:,2);
A3=x(:,1);
B3=x(:,2);
A4=x(:,1);
B4=x(:,2);
A5=x(:,1);
B5=x(:,2);
data1=[A1(mask1),B1(mask1)];
data2=[A2(mask2),B2(mask2)];
data3=[A3(mask3),B3(mask3)];
data4=[A4(mask4),B4(mask4)];
data5=[A5(mask5),B5(mask5)];

plot(data1(:,1),data1(:,2),'g.');
hold on
plot(data2(:,1),data2(:,2),'r.');
hold on 
plot(data3(:,1),data3(:,2),'b.');
hold on
plot(data4(:,1),data4(:,2),'y.');
hold on 
plot(data5(:,1),data5(:,2),'m.');

end

%% Helper functions
function y = cluster_kmeans(x,k)
%--------------------------------------------------------------------------
y=kmeans(x,k);
%--------------------------------------------------------------------------
end

function y = cluster_hierarchical(link,x,k)
%--------------------------------------------------------------------------
switch link
    case 'single'
        a=linkage(x,link,'euclidean');
        y=cluster(a,'maxclust',k);
    case 'complete'
        % Ignore this part for this assignment, no code needs to go here. 
end
%--------------------------------------------------------------------------
end

function y = cluster_spectral(x,k)
%--------------------------------------------------------------------------
n=size(x,1);
graph=zeros(n,n);
for i=1:n
    for j=1:n
        graph(i,j)=sqrt((x(i,1)-x(j,1))^2+(x(i,2)-x(j,2))^2);
    end
end

D=zeros(n,n);
for i=1:n
    D(i,i)=sum(graph(i,:));
end
graph=D-graph;
graph=inv(D^0.5)*graph*inv(D^0.5);
[vector,~]=eig(graph);
n=12;
data=vector(:,1);
for i=1:n-1
    data=[data,vector(:,i+1)];
end
a=linkage(data,'single','euclidean');
y=cluster(a,'maxclust',k);
%--------------------------------------------------------------------------
end

