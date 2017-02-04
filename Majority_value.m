function value = Majority_value(binary_targets)
%function to find the majority value (1 or 0) in binary_targets
No_targets = size(binary_targets,1);
No_positive = sum(binary_targets);
No_negative = No_targets - No_positive;

if No_positive>No_negative
    value = 1;
else
    value = 0;
end
end

