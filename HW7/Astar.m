%% main (bonus heuristic function is at the bottom)
function P = Astar(S)

P=[];
%S=[9 1 3;4 2 5;7 8 6];  puzzle1
%S=[9 1 3;7 2 6;5 4 8];  puzzle2
%S=[2 4 3;7 9 8;6 1 5];  puzzle3

G = [1 2 3 4 5 6 7 8 9]'; %default goal state

%\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%
% You will probably want to initialize several parameters here

n=1;
BP=0;
direction=0;
NewS=transform(S)';

F(n)=ComputeH(NewS);
visited=NewS;
PQ=NewS;
%\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

count = 1; %keep track of iterations
maxiter = 10000; %just to make sure the code does not run forever
while ~isempty(PQ) && count<maxiter
    %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    %compute f in PQ
    i=1;
    while i<=size(PQ,2)
        F(i)=ComputeH(PQ(:,i));
        i=i+1;
    end
    if size(BP,2)>=2
        steps=countsteps(BP);
    else
        steps=zeros(1,size(BP,2));
    end
    f=F+steps;
    %test if it repeats
    
    %find lowest f in PQ
    for i=1:size(PQ,2)
        if sum(PQ(:,i)==G)==9
            P=reconstruct(BP,direction,i);
            break;
        end
    end
    if ~isempty(P)
        break;
    end
    for i=1:size(BP,2)
        if PQ(1,i)==-1
            f(i)=10000000;
        end
    end
    
    whichismin=find(f==min(f));
        
    
    whichismin=whichismin(1);
    %find successors
    [successors,d]=FindSuccessors(PQ(:,whichismin),visited,f);
    
    %pop out
    PQ(:,whichismin)=-1;
    %insert them in PQ
    visited=[visited,successors];
    PQ=[PQ,successors];
    %update BP
    NumofSuccessors=size(successors,2);
    i=1;
    sizeofBP=size(BP,2);
    while i<=NumofSuccessors
        BP(i+sizeofBP)=whichismin;
        i=i+1;
    end
    
    direction=[direction,d];
    %if it repeated, delete it
    [PQ,BP,f,F,visited,steps,direction]=testrepeat(visited,NumofSuccessors,PQ,direction,BP);   
    
    %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    count = count+1;
end
%error('ERROR: Could not find path in %d steps.',maxiter);

show8puzzle(S,P);
end

%% Helper functions
function [s,direction]=FindSuccessors(state,visited,f)
s1=state;
s2=state;
s3=state;
s4=state;
left=1;
right=2;
up=3;
down=4;
if state(1)==9
    s1(1)=state(2);
    s2(1)=state(4);
    s1(2)=9;
    s2(4)=9;
    s=[s1,s2];
    direction=[left,up];
elseif state(3)==9
    s1(3)=state(2);
    s2(3)=state(6);
    s1(2)=9;
    s2(6)=9;
    s=[s1,s2];
    direction=[right,up];
elseif state(7)==9
    s1(7)=state(4);
    s2(7)=state(8);
    s1(4)=9;
    s2(8)=9;
    s=[s1,s2];
    direction=[down,left];
elseif state(9)==9
    s1(9)=state(6);
    s2(9)=state(8);
    s1(6)=9;
    s2(8)=9;
    s=[s1,s2];
    direction=[down,right];
elseif state(2)==9
    s1(2)=state(1);
    s2(2)=state(3);
    s3(2)=state(5);
    s1(1)=9;
    s2(3)=9;
    s3(5)=9;
    s=[s1,s2,s3];
    direction=[right,left,up];
elseif state(4)==9
    s1(4)=state(1);
    s2(4)=state(5);
    s3(4)=state(7);
    s1(1)=9;
    s2(5)=9;
    s3(7)=9;
    s=[s1,s2,s3];
    direction=[down,left,up];
elseif state(6)==9
    s1(6)=state(3);
    s2(6)=state(5);
    s3(6)=state(9);
    s1(3)=9;
    s2(5)=9;
    s3(9)=9;
    s=[s1,s2,s3];
    direction=[down,right,up];
elseif state(8)==9
    s1(8)=state(5);
    s2(8)=state(7);
    s3(8)=state(9);
    s1(5)=9;
    s2(7)=9;
    s3(9)=9;
    s=[s1,s2,s3];
    direction=[down,right,left];
elseif state(5)==9
    s1(5)=state(2);
    s2(5)=state(4);
    s3(5)=state(6);
    s4(5)=state(8);
    s1(2)=9;
    s2(4)=9;
    s3(6)=9;
    s4(8)=9;
    s=[s1,s2,s3,s4];
    direction=[down,right,left,up];
end

end
function [PQ,BP,f,F,visited,steps,direction]=testrepeat(visited,NumofSuccessors,PQ,direction,BP)

%compute f in PQ
    i=1;
    while i<=size(PQ,2)
        F(i)=ComputeH(PQ(:,i));
        i=i+1;
    end
    if size(BP,2)>=2
        steps=countsteps(BP);
    else
        steps=zeros(1,size(BP,2));
    end
    f=F+steps;
    
    for i=1:size(BP,2)
        if PQ(1,i)==-1
            f(i)=10000000;
        end
    end

a=NumofSuccessors;
b=size(visited,2);
for i=1:NumofSuccessors
    for j=1:b-a
        if sum(PQ(:,b+1-i)==visited(:,j))==9 && f(:,b+1-i)>=f(:,j)
            PQ(:,b+1-i)=[];
            direction(b+1-i)=[];
            BP(b+1-i)=[];
            f(b+1-i)=[];
            F(b+1-i)=[];
            visited(:,b+1-i)=[];
            steps(b+1-i)=[];
            break;
        end
    end
end
end

function P=reconstruct(BP,direction,i)
this=i;
Pinv=[];
while 0~=this
    Pinv=[Pinv,direction(this)];
    next=BP(this);
    this=next;
end
for i=1:size(Pinv,2)-1
    P(i)=Pinv(size(Pinv,2)-i);
end
end

function S=transform(X)
S=[X(1,:),X(2,:),X(3,:)];
end

function steps=countsteps(BP)
steps=zeros(1,size(BP,2));
for i=2:size(BP,2)
    this=BP(i);
    while 0~=this
        next=BP(this);
        this=next;
        steps(i)=steps(i)+1;
    end
end
end

function show8puzzle(puzzle,moves)
% SHOW8PUZZLE Visualize 8-puzzle using specified moves.

figure(1);
clf;
set(gcf,'MenuBar','none','Toolbar','none',...
    'NumberTitle','off','Name','8-Puzzle',...
    'Position',[80 80 400 400]);
for m=1:length(moves)
    set(gcf,'Name',sprintf('8-Puzzle: move %d/%d',m,length(moves)));
    update(puzzle);
    [puzzle,whichtile] = applymove(puzzle,moves(m));
    [row,col] = ind2sub(size(puzzle),whichtile);
    
    rectangle('Position',[col-1 row-1 1 1],'EdgeColor','r','LineWidth',2);
    pause(1);
    update(puzzle);
end

end

% Helper functions
% ------------------------
function update(puzzle)
    clf;
    axes(...
    'Color',[1 1 1],...
    'Box','on',...
    'GridLineStyle','-',...
    'LineWidth',1,...
    'Position',[-0.001 -0.001 1.002 1.002],...%[0.05 0.05 0.9 0.9],...
    'YDir','reverse',...
    'XLim',[0 3],...
    'YLim',[0 3],...
    'XGrid','on',...
    'YGrid','on',...
    'XTickLabel','',...
    'YTickLabel','',...
    'XTick',1:3,...
    'YTick',1:3);
    for ii=1:3
        for jj=1:3
            if puzzle(jj,ii)~=9
                text(ii-0.5,jj-0.5,num2str(puzzle(jj,ii)),'FontSize',36,'HorizontalAlignment','center');
            end
        end
    end
end
function [q,r] = applymove(p,move)
% APPLYMOVE Get the next puzzle state after applying a specified move.
    ind = find(p==9);
    q = p;
    switch move
        case 1; r = ind+3;
        case 2; r = ind-3;
        case 3; r = ind+1;
        case 4; r = ind-1;
    end
    q(ind) = q(r); q(r) = 9;
end

%% normal heuristic value
function H=ComputeH(state)
H=0;
goal=[1 2 3 4 5 6 7 8 9];
for i=1:9
    if state(i)~=goal(i)
        H=H+1;
    end
end
end
%{
%% bonus--Manhattan heuristic value

function H=ComputeH(state)
H=0;
% missed 1
if state(2)==1 || state(4)==1
    H=H+1;
elseif state(3)==1 || state(5)==1 || state(7)==1
    H=H+2;
elseif state(6)==1 || state(8)==1
    H=H+3;
elseif state(9)==1
    H=H+4;
end
%missed 2
if state(1)==2 || state(3)==2 || state(5)==2
    H=H+1;
elseif state(4)==2 || state(6)==2 || state(8)==2
    H=H+2;
elseif state(7)==2 || state(9)==2;
    H=H+3;
end
%missed 3
if state(2)==3 || state(6)==3
    H=H+1;
elseif state(1)==3 || state(5)==3 || state(9)==3
    H=H+2;
elseif state(4)==3 || state(8)==3
    H=H+3;
elseif state(7)==3
    H=H+4;
end
%missed 4
if state(1)==4 || state(5)==4 || state(7)==4
    H=H+1;
elseif state(2)==4 || state(6)==4 || state(8)==4
    H=H+2;
elseif state(3)==4 || state(9)==4
    H=H+3;
end
%missed 5
if state(2)==5 || state(4)==5 || state(6)==5 || state(8)==5
    H=H+1;
elseif state(1)==5 || state(3)==5 || state(7)==5 || state(9)==5
    H=H+2;
end
%missed 6
if state(3)==6 || state(5)==6 || state(9)==6
    H=H+1;
elseif state(2)==6 || state(4)==6 || state(8)==6
    H=H+2;
elseif state(1)==6 || state(7)==6
    H=H+3;
end
%missed 7
if state(4)==7 || state(8)==7
    H=H+1;
elseif state(1)==7 || state(5)==7 || state(9)==7
    H=H+2;
elseif state(2)==7 || state(6)==7
    H=H+3;
elseif state(3)==7
    H=H+4;
end
%missed 8
if state(5)==8 || state(7)==8 || state(9)==8
    H=H+1;
elseif state(2)==8 || state(4)==8 || state(6)==8
    H=H+2;
elseif state(1)==8 || state(3)==8
    H=H+3;
end
%missed 9
if state(6)==9 || state(8)==9
    H=H+1;
elseif state(3)==9 || state(5)==9 || state(7)==9
    H=H+2;
elseif state(2)==9 || state(4)==9
    H=H+3;
elseif state(1)==9
    H=H+4;
end
end
%}