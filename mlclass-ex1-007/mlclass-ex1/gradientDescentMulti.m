function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

abc11 = [];
abc22 = [];
ans22 = [];


for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
for i = 1:m
    for k = 1:size(X,2)
        %hypothesis function
        abc11(i,k) = theta(k)* X(i,k);
    end 
    abc22(i,1) = sum(abc11(i,:));
    ans22(i,1) = (abc22(i,1)-y(i,1));
    clear k
    for k = 1:size(X,2)
        ans33(i,k) = ans22(i,1)*X(i,k);
    end
end

clear i k

for i = 1:size(X,2)
    ival1 = (alpha/m)*(sum(ans33(:,i)));
    theta(i) = theta(i) - ival1;
    clear ival1
end





    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
