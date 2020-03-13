function [y] = sigmoid(x)
%SIGMOID Squashes the input x using the sigmoid function
y = 1./(1+exp(-x));
end

