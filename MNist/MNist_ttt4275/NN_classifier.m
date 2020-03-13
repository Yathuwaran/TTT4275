%% Init Constants
tic                     %Start stopwatch
classes = 10;           %Numbers 0-9
chunk_size = 1000;      
chunks = num_test/chunk_size; %Number of chunks
NN_dist = zeros(num_test,chunks);
NN_indices = zeros(num_test,chunks);

%% Go through each chunk and sample to find nearest neighbour(NN)

for i = 1:chunks
    W = trainv((i-1)*chunk_size+1:i*chunk_size,:);
    EUC = dist(W,testv'); %Euclidean distance between W and testv
    for j = 1:num_test
        [NN_distance, NN_index] = min(EUC(:,j));
        NN_dist(j,i) = NN_distance;
        NN_indices(j,i) = (i-1)*chunk_size+NN_index;
    end
    fprintf("Iterated through chunk %d\n",i)
end

%% Go through each sample to find global nearest neighbour(GNN)
NN_tags = zeros(num_test,1);

for i= 1:num_test
    [NN_distance, NN_index] = min(NN_dist(i,:));
    NN_tag = trainlab(NN_indices(i,NN_index));
    NN_tags(i) = NN_tag;
end

toc