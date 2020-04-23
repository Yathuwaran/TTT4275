function [label] = NN(train_set,train_label,test_set,chunks, chunk_size)
[C,~,train_label] = unique(train_label,'stable');
P = size(test_set,1);
label = zeros(P,1);
NN_dist = zeros(P,chunks);  
indices = zeros(P,chunks);
%% Locate nearest neighbour(NN) in each chunk
for i = 1:chunks
    W = train_set((i-1)*chunk_size+1:i*chunk_size,:);   %Limiting size according to chunk      
    EucD = dist(W,test_set');   %Euclidean distance between train_set and test_set
    for j = 1:P
        [NN_dist(j,i), index] = min(EucD(:,j)); %Save minimum dist and it's index
        indices(j,i) = (i-1)*chunk_size+index;  %Append to a global index-matrix
    end
    fprintf("Chunk %d/10\n",i)
end
%% Locate global nearest neighbour(G-NN) for each sample
for i= 1:P
    [~, index] = min(NN_dist(i,:));    %Locate the index of the nearest to the  
     label(i) = train_label(indices(i,index));  % Extract tag    
end
label = C(label);
end