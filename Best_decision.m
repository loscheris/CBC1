function best_attri = Best_decision(examples, all_attri, binary_targets)
%function to choose the best attribute among the all attributes in the
%examples using ID3 algorithm
No_attri = size(all_attri,2);
No_examples = size(binary_targets,1);
No_positive = sum(binary_targets);
No_negative = No_examples - No_positive;

%Calculate the entropy of the dataset
E_example = Entropy(No_positive, No_negative);

%Calculate the remainders
Remainder = zeros(1,No_attri);
for i = 1:No_attri
    col = all_attri(i);
    n0=0;
    p0=0;
    n1=0;
    p1=0;
    for j = 1:No_examples
        if (examples(j,col)==1 & binary_targets(j)==1)
            p1 = p1+1;
        elseif (examples(j,col)==1 & binary_targets(j)==0)
            n1 = n1+1;
        elseif (examples(j,col)==0 & binary_targets(j)==1)
            p0 = p0+1;
        else
            n0 = n0+1;
        end
    end
    Remainder(i) = ((p0+n0)/No_examples)*Entropy(p0,n0)+((p1+n1)/No_examples)*Entropy(p1,n1);
end

%Calculate the information gain
Gain = ones(1,No_attri)*E_example - Remainder;
[~, max_index] = max(Gain);
best_attri = all_attri(max_index);
end

function E=Entropy(p,n)
   %Function to calculate the entropy of a dataset.
   %Input p and n represent the number of positive and negative examples.
   if(p==0 || n==0)
        E=0;
        return;
   end
    p_ = p/(p+n);
    n_ = n/(p+n);
    E = -p_*log2(p_) - n_*log2(n_);
end
