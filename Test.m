clear;
clc;
load('cleandata_students.mat');

No_target_labels=6;

binary_y = zeros(size(y,1),No_target_labels);
attri = linspace(1,size(x,2),size(x,2));
tree = cell(1,No_target_labels);

for i =1:No_target_labels
    binary_y(:,i) = y_to_BinaryTargets(y,i);
    tree{i} = decision_tree_learning(x, attri, binary_y(:,i));  
    DrawDecisionTree(tree{i},i);
end



