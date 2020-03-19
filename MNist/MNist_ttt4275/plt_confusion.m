%TargetVector is the correct answer, while outputsVector are the predicted
%values)
targetsVector = (testlab+1)';
outputsVector = (NN_tags+1)';

num_data = 10000;
% Convert this data to a [numClasses x data_length] matrix
targets = zeros(10,num_data);
outputs = zeros(10,num_data);
targetsIdx = sub2ind(size(targets), targetsVector, 1:num_data);
outputsIdx = sub2ind(size(outputs), outputsVector, 1:num_data);
targets(targetsIdx) = 1;
outputs(outputsIdx) = 1;

% Plot the confusion matrix 
plotconfusion(targets,outputs)

h = gca;
h.XTickLabel = {'0','1','2','3','4','5','6','7','8','9', ''};
h.YTickLabel = {'0','1','2','3','4','5','6','7','8','9',''};
h.YTickLabelRotation = 90;