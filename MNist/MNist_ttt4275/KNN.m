function [label] = KNN(train_set,train_label,test_set,k)

[C,~,train_label] = unique(train_label,'stable');

P = size(test_set,1);
label = zeros(P,1);
for i = 1:P
    % Euclidean distance between two points
    A = repmat(test_set(i,:),size(train_set,1),1)-train_set;
    EUC = sqrt(sum(A.^2,2));
    % Sort the distances in ascending order and check the k nearest training labels
    [~,I] = sort(EUC);
    nearest = train_label(I(1:k));
    % Frequencies of the k nearest training labels
    N = histc(nearest,1:max(nearest));
    frequencies = N(nearest);
    % Nearest training label with maximum frequency (if duplicated, check the nearest training instance)
    [~,J] = max(frequencies);
    label(i) = nearest(J);
end


label = C(label);
end
