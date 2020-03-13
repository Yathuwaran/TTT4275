
confusion_matrix = zeros(classes);

for i = 1:num_test
    confusion_matrix(NN_tags(i)+1,testlab(i)+1) = confusion_matrix(NN_tags(i)+1,testlab(i)+1)+1;
end

error_rate = 1 - trace(confusion_matrix)/num_test;

x = zeros(28,28);

%% Wrongful classification 
x(:) = testv(5,:); % Real - 4 || Classifier - 9 
figure(1)
subplot(221)
image(rot90(flip(x),3));
title("Correct: 4 | Classifier: 9 ")

x(:) = testv(176,:); % Real - 7 || Classifier - 1 
subplot(222)
image(rot90(flip(x),3));
title("Correct: 7 | Classifier: 1 ")

x(:) = testv(246,:); % Real - 3 || Classifier - 6 
subplot(223)
image(rot90(flip(x),3));
title("Correct: 3 | Classifier: 6 ")

x(:) = testv(248,:); % Real - 4 || Classifier - 6 
subplot(224)
image(rot90(flip(x),3)); 
title("Correct: 4 | Classifier: 7 ")

%% Correct classififcations

x(:) = testv(28,:); % Real - 4 || Classifier - 4 
figure(2)
subplot(221)
image(rot90(flip(x),3));
title("Correct: 4 | Classifier: 4 ")

x(:) = testv(275,:); % Real - 9 || Classifier - 9 
subplot(222)
image(rot90(flip(x),3));
title("Correct: 9 | Classifier: 9 ")

x(:) = testv(317,:); % Real - 6 || Classifier - 6 
subplot(223)
image(rot90(flip(x),3));
title("Correct: 6 | Classifier: 6 ")

x(:) = testv(4298,:); % Real - 7 || Classifier - 7 
subplot(224)
image(rot90(flip(x),3)); 
title("Correct: 7 | Classifier: 7 ")
