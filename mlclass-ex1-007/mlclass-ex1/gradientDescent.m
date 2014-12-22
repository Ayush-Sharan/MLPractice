function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
abc1 = [];
abc2 = [];
h = [];
ans1 = [];
ans2 = [];
ans3 = [];



for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    for i = 1:m
        abc1(i,1) = theta(1,1)* X(i,1);
        abc2(i,1) = theta(2,1)* X(i,2);
        h(i,1) = abc1(i,1)+abc2(i,1);
        ans1(i,1) = h(i,1) - y(i,1);
        ans2(i,1) = ans1(i,1)* X(i,1);
        ans3(i,1) = ans1(i,1)* X(i,2);
    end
    
    ival1 = alpha/m*(sum(ans2));
    ival2 = alpha/m*(sum(ans3));
    theta(1,1) = theta(1,1) - ival1;
    theta(2,1) = theta(2,1) - ival2;
        
   

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter,1) = computeCost(X, y, theta);

end

end
