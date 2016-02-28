function [solution,score] = ga_mapcoloring()
clear
clc
scoreset=0;
load('usmap.mat');
mu=1000;
e=2;
lamda=mu-e;
cRate=0.8;
mRate=0.2;
k=10;
iteration=1000;
X=1+(4-1).*rand(50,mu);
X=round(X);
X(33,:)=ones(1,mu);
X(40,:)=ones(1,mu);
for iter=1:iteration
    for i=1:mu
        fitness(i)=calfit1(A,X(:,i));
    end
    sortedfitness=sort(fitness,'descend');
    findethmax=find(fitness>=sortedfitness(e));
   for i=1:e
       offspring(:,i)=X(:,findethmax(i));
   end
   
   %extra credit
   %{      
   [M1,m1]=calcolor(offspring(:,1));
   diff=sum(offspring(:,1)==M1)-sum(offspring(:,1)==m1);
   adjustment=round(diff/2);
   whereareM1=find(offspring(:,1)==M1);
   random=randperm(size(whereareM1,1),adjustment);
   for i=1:adjustment
       offspring(whereareM1(random),1)=m1;
   end
   
   
   [M2,m2]=calcolor(offspring(:,2));
   diff=sum(offspring(:,2)==M2)-sum(offspring(:,2)==m2);
   adjustment=round(diff/2);
   whereareM2=find(offspring(:,2)==M2);
   random=randperm(size(whereareM2,1),adjustment);
   for i=1:adjustment
       offspring(whereareM2(random),2)=m2;
   end
%}
   
   for i=e+1:2:mu
       parents=randperm(mu,k);
       for j=1:k
           newgroup(:,j)=X(:,parents(j));
           newfitness(j)=calfit1(A,X(:,parents(j)));
       end
       
       sortednewfitness=sort(newfitness,'descend');
       newfindethmax=find(newfitness>=sortednewfitness(2));
       parent1=newgroup(:,newfindethmax(1));
       parent2=newgroup(:,newfindethmax(2));
       if rand>cRate
           n=randperm(50,1);
           [offspring1,offspring2]=crossover1(parent1,parent2,n);
       end
       if rand>mRate
           offspring1=mutate1(A,parent1);
           offspring2=mutate1(A,parent2);
       end
       offspring(:,i)=offspring1;
       offspring(:,i+1)=offspring2;
   end
   X=offspring;
   score=calfit1(A,offspring(:,1))*100;
   solution=offspring(:,1);
   scoreset=[scoreset,score];
   if score==100
       break;
   end
   
end
scoreset(1)=[];
figure;
showmap(1,L,solution);
figure;
plot(scoreset);
end

%% calfit
function fitness=calfit1(A,sample)
lost=0;
for i=1:50
    for j=1:50
        if A(i,j)==1 && sample(i)==sample(j)
            lost=lost+1;
        end
    end
end
fitness=1-(0.5*lost)/107;
end

 %% crossover
function [Y1,Y2]=crossover1(X1,X2,n)
for i=1:50
    if  i<=n || i==33 ||i==40 
        Y1(i)=X1(i);
        Y2(i)=X2(i);
    else
        Y1(i)=X2(i);
        Y2(i)=X1(i);
    end
end
end

function showmap(h,L,X)
% SHOWMAP Visualize the colored map.
%   h   Figure handle.
%   L   Label matrix representing an image of the map. Each pixel has an 
%       integer value (0->lines, 1->background, and [2-51]->the 50 states).
%   X   An individual solution, encoded as a vector of integers to indicate
%       colors; that is, X(i) is the index into a color array for the ith
%       state. For example, if X(27)=3, then the 27th state (pixels for
%       which L=28) should take on the 3rd color.

    clrs = [0.73 0.83 0.96;
            1 0.69 0.39;
            0.76 0.87 0.78;
            1 0.97 0.55;
            1 0.4 0.4];

    figure(h); clf;
    set(gcf,...
        'NumberTitle','off',...
        'Name','Map of the United States',...
        'Color',[1 1 1],...
        'MenuBar','none','Toolbar','none',...
        'Position',[300 200 786 570]);
    axes(...
        'Color',[1 0.95 0.81],...
        'Position',[-0.001 -0.001 1.002 1.002]);
    imshow(label2rgb(L,[1 1 1; clrs(X,:)],'k'));
end

%% mutate
function Y=mutate1(A,X)
for i=1:50
    for j=1:50
        if i~=33 && i~=40 && j~=33 && j~=40
            while A(i,j)==1 && X(i)==X(j)
                X(i)=randperm(4,1);
                X(j)=randperm(4,1);
            end
        end
    end
end
Y=X;
end
%% calcolor
function [M,m]=calcolor(sample)
for i=1:4
    summ(i)=sum(sample==i);
end
[~,M]=max(summ);
[~,m]=min(summ);

end



