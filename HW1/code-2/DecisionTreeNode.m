classdef DecisionTreeNode < handle
    %DecisionTreeNode class: Nodes of entropy-based binary decision tree.
    %   For 24-787 HW1, you need to complete the following functions in
    %   this file: find_decision_attrib, train, classify, entropy, and
    %   entropy_of_class.
    
    properties
        decision_attrib;        % the index of the attrib where split occurs
        available_attribs;      % the indices of available attributes
        decision;               % the class for all input data, if no split occours
        count;
        class
        left_node;              % handle to the left leaf
        right_node;             % handle to the right leaf
        parent_node;            % handle to the parent leaf
    end
    methods
        function this = DecisionTreeNode()
            this.decision_attrib = -1;
            this.decision = -1;
            this.parent_node = [];
            this.available_attribs = [];
            this.count=[];
            this.class=[];
        end
        
        function find_decision_attrib(this,attrib,class)
         %  h = DecisionTreeNode.entropy_of_class(class);
         %  info_gain = zeros(size(this.available_attribs));
            
            % From available_attribs, you want to find the attribute that 
            % best splits the data with maximum info gain. 
            % You will need to split the data per each available attribute.            
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            a=zeros(1,size(attrib,2));
            b=zeros(1,size(attrib,2));
            c=zeros(1,size(attrib,2));
            d=zeros(1,size(attrib,2));
            HA=zeros(1,size(attrib,2));
            HB=zeros(1,size(attrib,2));
            HC=zeros(1,size(attrib,2));
            HD=zeros(1,size(attrib,2));
            
            for ac=1:size(attrib,2)
  
                    for ar=1:size(attrib,1)
                       if attrib(ar,ac)==0 && class(ar)==0
                           a(ac)=a(ac)+1;
                       elseif attrib(ar,ac)==0 && class(ar)==1
                           b(ac)=b(ac)+1;
                       elseif attrib(ar,ac)==1 && class(ar)==0
                           c(ac)=c(ac)+1;
                       elseif attrib(ar,ac)==1 && class(ar)==1
                           d(ac)=d(ac)+1;
                       else
                           a(ac)=10;
                           b(ac)=10;
                           c(ac)=10;
                           d(ac)=10;
                       end
                    end
            end
        
            for i=1:size(attrib,2)
                if a(i)==0 || b(i)==0
                    HA(i)=0;
                    HB(i)=0;
                else
                    HA(i)=((a(i)+b(i))/size(attrib,1))*((-a(i)/(a(i)+b(i)))*log2(a(i)/(a(i)+b(i))));
                    HB(i)=((a(i)+b(i))/size(attrib,1))*((-b(i)/(a(i)+b(i)))*log2(b(i)/(a(i)+b(i))));
                end
            end
            
            
            
            for i=1:size(attrib,2)
                if c(i)==0 || d(i)==0
                    HC(i)=0;
                    HD(i)=0;
                else
                    HC(i)=((c(i)+d(i))/size(attrib,1))*((-c(i)/(c(i)+d(i)))*log2(c(i)/(c(i)+d(i))));
                    HD(i)=((c(i)+d(i))/size(attrib,1))*((-d(i)/(c(i)+d(i)))*log2(d(i)/(c(i)+d(i))));
                end
            end
            
           
            
            
            H=HA+HB+HC+HD;
            [~,x]=min(H);
            this.decision_attrib=x;
 
     %       disp(this.decision_attrib);
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        end
        
        function train(this,attrib,class)
        % Learn decision tree from training data
        % HINT: this will be a recursive function                
            % If the examples are perfectly split, then assign the
            % appropriate class label and return from this node.
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            
            this.left_node=DecisionTreeNode();
            this.right_node=DecisionTreeNode();
           
            this.left_node.parent_node=this;
            this.right_node.parent_node=this;
            
            
            one=sum(class);
            zero=size(attrib,1)-one;
            this.count=[zero,one];
            if zero==0
                this.decision=1;
                return;
            elseif one==0
                this.decision=0;
                return;
            elseif sum(attrib(1,:))==140 && this.count(1)==this.count(2)
                this.decision=1;
                return;
            elseif  sum(attrib(1,:))==140
                [~,winner]=max(this.count);
                this.decision=winner-1; 
                return;
            end
            
            this.find_decision_attrib(attrib,class);
            n=this.decision_attrib;
            
            

            filter0=zeros(size(attrib,1),1);
            filter1=zeros(size(attrib,1),1);
            for i=1:size(attrib,1)
                if attrib(i,n)== 0
                    filter0(i)=1;
                end
            end
            for j=1:size(attrib,1)
                if attrib(j,n)== 1
                    filter1(j)=1;
                end
            end
            
            
            attrib(:,n)=10;
            attrib0=attrib(logical(filter0),:);
            attrib1=attrib(logical(filter1),:);
            for i=1:size(attrib0,1)
                attrib0(i,n)=10;
            end
            for i=1:size(attrib1,1)
                attrib1(i,n)=10;
            end
            
            
            
            
            class0=class(logical(filter0));
            class1=class(logical(filter1));
            this.right_node.train(attrib1,class1);
            this.left_node.train(attrib0,class0);
            
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ 
            % If no available attributes remain, but the data is not
            % perfectly split, use the majority vote to assign the class
            % and return from this node.
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            % If the program makes it this far, then choose the "best"
            % attribute, split the data, and initiate the recursion.
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\      
            
            
        end
        function class = classify(this,attrib)
        % Label test data based on the given attributes
        % HINT: this will be a recursive function
        
        this.class = zeros(100,1); %initialize class labels to -1
        if size(attrib,2)==15    
            order=1:size(attrib,1);
            order=order';
            mix=[attrib,order];
            attrib=mix;
        end
            
            if this.decision ~= -1;
                for k=1:size(attrib,1)
                    this.class(attrib(k,size(attrib,2)))=this.decision;
                end
                return
            else
            end
            
            n=this.decision_attrib;
            filter00=zeros(size(attrib,1),1);
            filter11=zeros(size(attrib,1),1);
            for i=1:size(attrib,1)
                if attrib(i,n)== 0
                    filter00(i)=1;
                elseif attrib(i,n)== 1
                    filter11(i)=1;
                end
            end
            attrib(:,n)=10;
            attrib0=attrib(logical(filter00),:);
            attrib1=attrib(logical(filter11),:);
            this.right_node.classify(attrib1);
            this.left_node.classify(attrib0);
            this.class=this.left_node.class+this.right_node.class;
            
            % Check to see if we are at a leaf node. If so, assign the correct label to the output.
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            % INSERT CODE HERE
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            
            class=this.class;
            % If we are not at leaf node, split the data and initiate recursion
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            % INSERT CODE HERE
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 
            
        end
    end
    
    %% Static methods can be called without object instantiation
    methods (Static)
        function h = entropy(p)
        % Compute the entropy (h) given the vector of probabilities (p)
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            h=0;
            H=zeros(1,length(p));
            for i=1:length(p)
                if p(i)~=0
                H(i)=(-p(i)).*log2(p(i));
                h=h+H(i);
                end
            end
            
        end
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        function h = entropy_of_class(class)
        % Compute the entropy of (h) given a binary vector of labels 
        % (class), in which Joy = 1 and Despair = 0
            
            %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            sum0=0;
            sum1=0;
            for j=1:length(class)
                if class(j)==0;
                   sum0=sum0+1;                
                elseif class(j)==1;
                    sum1=sum1+1;
                end
            end
            p0=sum0/length(class);
            p1=sum1/length(class);
            if p0==0 
                h=-p1*log2(p1);
            elseif p1==0
                h=(-p0)*log2(p0);
            else
                h=(-p1)*log2(p1)+(-p0)*log2(p0);
            end
        end
             
    end
end
 
 
                %\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
 
