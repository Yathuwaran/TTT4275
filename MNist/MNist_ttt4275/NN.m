function [label] = NN(train_set,train_label,test_set,chunks, chunk_size)


%% Init Constants
[C,~,train_label] = unique(train_label,'stable');
P = size(test_set,1);

label = zeros(P,1);
NN_dist = zeros(P,chunks);
NN_indices = zeros(P,chunks);


%% Locate nearest neighbour(NN) in each chunk
for i = 1:chunks
    W = train_set((i-1)*chunk_size+1:i*chunk_size,:);    
    EUC = dist(W,test_set'); %Euclidean distance between train_set and test_set
    for j = 1:P
        [NN_distance, NN_index] = min(EUC(:,j)); %Save minimum dist and its index
        NN_dist(j,i) = NN_distance;              %Save in matrix
        NN_indices(j,i) = (i-1)*chunk_size+NN_index;
    end
    fprintf("Chunk %d/10\n",i)
end

%% Locate global nearest neighbour(G-NN) for each sample
for i= 1:P
    [~, NN_index] = min(NN_dist(i,:));
    NN_tag = train_label(NN_indices(i,NN_index));
    label(i) = NN_tag;
end
label = C(label);
end
