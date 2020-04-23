M = 64;  digits = 10; x = 1; y = 1; C = zeros(M*digits,pixels);
%% Sort training dataset according to digits
[sorted_trainlab, index] = sort(trainlab);
sorted_trainv = zeros(size(trainv));
for i = 1:num_train
    sorted_trainv(i,:) = trainv(index(i),:);
end

for i = 0:(digits-1)
    x = y;
    while y < num_train && sorted_trainlab(y+1) == i %Check bounds
        y = y+1; %Grows as long as the training label of index y+1 is equal i
    end
    trainv_i = sorted_trainv(x:y,:); %Partition (First index of current digit to last index 
    
    %% Perform Clutering 
    [~,C_i] = kmeans(trainv_i,M); %Use K-means algorithm to extraxt cluster C_i 
    C((i*M+1):((i+1)*M),:) = C_i;
    fprintf("Clustered %d/10\n",i);
end 