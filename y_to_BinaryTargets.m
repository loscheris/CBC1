function BinaryTargets = y_to_BinaryTargets(y,target_label)
%Function to transform y to binary targets
%target_label is the value in y needed to be investigated
No_targets = size(y,1);
BinaryTargets = zeros(No_targets,1);
for i = 1:No_targets
    if y(i) == target_label
        BinaryTargets(i) = 1;
    end
end
end