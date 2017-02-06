function [tree] = decision_tree_learning(examples, attri, binary_targets)
%function to implement the decision tree

%construct tree (or leaf if certain condition is satisfied)
tree.op = [];
tree.kids = [];
tree.class = [];

%if remaining examples all have the same value
if (isequal(binary_targets, ones(size(binary_targets))) || isequal(binary_targets, zeros(size(binary_targets))))
    %can also: (i) split into two if statements or (ii) assign binary_targets(1) to tree.class
    tree.class = Majority_value(binary_targets);
%if there is no more attribute to sort
elseif (isempty(attri))
    tree.class = Majority_value(binary_targets);
else
    best_attri = Best_decision(examples, attri, binary_targets);
    %setting up a new tree
    tree.op = best_attri;
    tree.kids = cell(1,2);
    for i = 0:1
        examples_i = examples(examples(:,best_attri)==i, :);
        binary_targets_i = binary_targets(examples(:,best_attri)==i, :);
        if (isempty(examples_i))
            tree.op = [];
            tree.kids = [];
            tree.class = Majority_value(binary_targets);
            return;
        else
            %copy attri (since attri will need to be used twice)
            attri_i = attri;
            %remove best_attri from attri_i
            best_attri_index = find(attri==best_attri);
            attri_i(:,best_attri_index) = [];
            %find the subtree by recursive call of the function
            tree.kids{i+1} = decision_tree_learning(examples_i, attri_i, binary_targets_i);
        end
    end
end

