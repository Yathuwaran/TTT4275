tic
NN_tags = KNN(C,cluster_tags,testv,7);
toc 

%% Calculate Confusion Matrix and Error Rate
confusion_matrix = zeros(classes);
for i = 1:num_test
    confusion_matrix(labels(i)+1,testlab(i)+1) = confusion_matrix(labels(i)+1,testlab(i)+1)+1;
end
error_rate = 1 - trace(confusion_matrix)/num_test;
disp('Error rate: ');
disp(error_rate);
plt_confusion;