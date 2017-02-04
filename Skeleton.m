load('cleandata_students.mat');
y_ange=y_to_BinaryTargets(y,1);
y_disg=y_to_BinaryTargets(y,2);
y_fear=y_to_BinaryTargets(y,3);
y_happ=y_to_BinaryTargets(y,4);
y_sadn=y_to_BinaryTargets(y,5);
y_surp=y_to_BinaryTargets(y,6);

all_attri = zeros(1,45);
for i = 1:45
    all_attri(i) = i;
end

best_attri = Best_decision(x, all_attri, y_ange)