%% Init Constants
tic                                     %Start stopwatch
classes = 10;                           %Numbers 0-9
M = 64;                                 %Templates pr class
chunks = 10;                            %Number of chunks
NN_indices = zeros(num_test,chunks);
NN_dist = zeros(num_test,chunks); 
NN_tags = zeros(num_test,1);
%% Locate nearest neighbour(NN) in each chunk

for i = 1:chunks
    W = C((i-1)*M+1:i*M,:);        % Training set is replaced with the clusters
    EUC = dist(W,testv');          %Euclidean distance between W and testv
    
    for j = 1:num_test
        [NN_distance, NN_index] = min(EUC(:,j));
        NN_dist(j,i) = NN_distance;
        NN_indices(j,i) = (i-1)*M+NN_index;
    end
    fprintf("Iterated through chunk %d/10\n",i)
end

%% Locate global nearest neighbour(G-NN) for each sample
for i= 1:num_test
    [NN_distance, NN_index] = min(NN_dist(i,:));
    NN_tag = cluster_tags(NN_indices(i,NN_index));
    NN_tags(i) = NN_tag;
end
toc  %Stop stopwatch
%% Calculate Confusion Matrix and Error Rate
confusion_matrix = zeros(classes);
for i = 1:num_test
    confusion_matrix(NN_tags(i)+1,testlab(i)+1) = confusion_matrix(NN_tags(i)+1,testlab(i)+1)+1;
end

error_rate = 1 - trace(confusion_matrix)/num_test;
plt_confusion;
