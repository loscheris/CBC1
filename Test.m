load('cleandata_students.mat');
%test for the 'y_to_BinaryTargets' function
y_ange=y_to_BinaryTargets(y,1);
y_disg=y_to_BinaryTargets(y,2);
y_fear=y_to_BinaryTargets(y,3);
y_happ=y_to_BinaryTargets(y,4);
y_sadn=y_to_BinaryTargets(y,5);
y_surp=y_to_BinaryTargets(y,6);

%test for the 'Best_decision' function
all_attri = linspace(1,45,45);
best_attri = Best_decision(x, all_attri, y_fear);
fprintf('The best attribute for `fear` is the %dth attribute\n', best_attri);

%test for the 'Majority_value' function
major_val = Majority_value(y_fear);
fprintf('The majority y value for `fear` is %d\n', major_val);
