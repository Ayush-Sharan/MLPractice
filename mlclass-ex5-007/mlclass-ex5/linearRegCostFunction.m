function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%



Jint1 = sum(((X*theta)- y).^2);
term1 = (1/(2*m))*(Jint1);
Jint2 = (sum(theta.^2)- theta(1)^2);
term2 = (lambda/(2*m))*(sum(Jint2));

J = term1 + term2;
grad1 = [];
gradint = [];

abc = X*theta;
for i = 1:size(X,2)
    for k = 1:m
        grad1(k,i) = (abc(k,1)-y(k,1))*X(k,i);
    end
    gradint(i,1) = sum(grad1(:,i))/m;
    if(i>1)
        gradint(i,1) = sum(grad1(:,i))/m + ((lambda/m)*theta(i,1));
    end
end

grad = gradint;

clear i k 

% =========================================================================

grad = grad(:);

end
