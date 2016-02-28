classdef DecisionTree < handle
    %DecisionTree class: Entropy-based binary decision tree.
    %   For 24-787 HW1, you do not need to modify anything in this file,
    %   but it may be helpful to study the first three methods: 
    %   constructor, train() and classify().
    
    properties
        root;
    end
    methods
        function this = DecisionTree() %constructor
            % inits an untrained root node
            this.root = DecisionTreeNode();
        end
        function train(this,attrib,class)
            % inits node-level training recursion
            disp('Training decision tree...');
            this.root.available_attribs = 1:size(attrib,2);
            this.root.train(attrib,class);
        end
        function class = classify(this,attrib)
            % inits node-level classification recursion
            disp('Classifying with decision tree...');
            class = this.root.classify(attrib);
        end
        
        %-----------------------------------------------------------------------
        % Note to 24787 students: No need to understand the following functions.
        %-----------------------------------------------------------------------        
        function nodes = plot(this)
            % visualizes the tree
            if this.root.decision_attrib == -1
                disp('Cannot visualize decision tree. It has not been trained.');
                return;
            end
            [node_connectivity, node_strings, nodes] = DecisionTree.plot_traverser(this.root);
            tree_graph = biograph(node_connectivity, [], ...
                 'ShowWeights', 'on', 'NodeAutoSize', 'on', 'ArrowSize', 5);
            set(tree_graph.Nodes, 'Size', [20 5]);
            
            % update node labels and shapes
            for i=1:numel(tree_graph.Nodes)
                set(tree_graph.Nodes(i),'Label',node_strings{i});
                if strcmp(node_strings{i},'Decision = 1')
                    set(tree_graph.Nodes(i),'Shape','ellipse');
                elseif  strcmp(node_strings{i},'Decision = 0')
                    set(tree_graph.Nodes(i),'Shape','ellipse');
                end
            end
                        
            % update edge weights
            dbstop if error;
            for i=1:numel(tree_graph.Edges)
                head_tail = tree_graph.Edges(i).ID;
                head_tail = sscanf(head_tail, 'Node %d -> Node %d');
                head = head_tail(1);
                tail = head_tail(2);
                if nodes(head).left_node == nodes(tail)
                    tree_graph.Edges(i).Weight = 1;
                elseif nodes(head).right_node ==  nodes(tail)
                    tree_graph.Edges(i).Weight = 0;
                else
                    tree_graph.Edges(i).Weight = -1;
                end
            end
            
            % view biograph object
            view(tree_graph);
        end
    end
    % Private function for visualizing the decision tree
    methods (Access=private, Hidden, Static)
        function [node_connectivity, node_strings, nodes] = plot_traverser ...
                (current_node, node_connectivity, node_strings, nodes)
            if nargin == 1
                node_connectivity = [];
                node_strings = {};
                nodes = [];
            end
            
            nodes = [nodes, current_node];
            n = numel(nodes);
            node_connectivity(n, n) = 0;
            if ~isempty(current_node.parent_node)
                parent_id = nodes==current_node.parent_node;
                node_connectivity(parent_id, n) = 1;
            end
            
            if current_node.decision_attrib == -1
                node_strings = [node_strings, ...
                    ['Decision = ' num2str(current_node.decision)] ];
            else
                node_strings = [node_strings, ...
                    ['Feature ' num2str(current_node.decision_attrib)] ];
               
                [node_connectivity, node_strings, nodes] = DecisionTree.plot_traverser ...
                    (current_node.left_node, node_connectivity, node_strings, nodes);
                [node_connectivity, node_strings, nodes] = DecisionTree.plot_traverser ...
                    (current_node.right_node, node_connectivity, node_strings, nodes);
            end
        end
    end
end