tic                 %Start Stopwatch

M = 64;             %Templates pr class
L = 784;            %Pixels pr picture
classes = 10; 

%% Devide the training dataset into the classes

[sorted_trainlab, sorted_index] = sort(trainlab);
sorted_trainv = zeros(num_train, L);
for i = 1:num_train
    sorted_trainv(i,:) = trainv(sorted_index(i),:);
end

%% Perform Clutering 
x = 1;
y = 1;
C = zeros(M*classes,L);
for i = 0:(classes-1)
    x = y;
    while y < num_train && sorted_trainlab(y+1) == i
        y = y+1; 
    end
    trainv_i = sorted_trainv(x:y,:);
    
    [idx_i,C_i] = kmeans(trainv_i,M);
    C((i*M+1):((i+1)*M),:) = C_i;
    fprintf("Class %d clustered\n",i);
end 

%% Locate KNN for each sample
K = 7;
cluster_tags = repelem([0 1 2 3 4 5 6 7 8 9]',M);
Mdl = fitcknn(C,cluster_tags, "NumNeighbors",K,'BreakTies','nearest');
NN_tags = predict(Mdl, testv);

toc %Stop Stopwatch

%% Calculate Confusion Matrix and Error Rate
confusion_matrix = zeros(classes);
for i = 1:num_test
    confusion_matrix(NN_tags(i)+1,testlab(i)+1) = confusion_matrix(NN_tags(i)+1,testlab(i)+1)+1;
end

error_rate = 1 - trace(confusion_matrix)/num_test;
plt_confusion;