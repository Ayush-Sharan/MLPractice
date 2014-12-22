function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
h = [];
Jint = [];
hint = [];
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


for i = 1:m    
    for j = 1: size(X,2)
        hint(i,j) = (theta(j,1)*X(i,j));
    end
    h(i,1) = sigmoid(sum(hint(i,:)));
end

clear i j

for i = 1:m
    Jint(i,1) = ((-y(i,1)*log(h(i,1))) - ((1- y(i,1))*(log(1-h(i,1)))));
end

clear i
Jabc = (sum(Jint))/m;
Jabc2 = (lambda/(2*m))*sum(theta(2:end).^2);
J = Jabc + Jabc2;

for z = 1:size(X,2)
    for i = 1:m
        abc(i,z) = (h(i,1)-y(i,1))*X(i,z);
    end
    grad1(z,1) = sum(abc(:,z))/m;
    if (z > 1)
        grad1(z,1) = ((sum(abc(:,z))/m)+ (lambda/m)*theta(z,1));
    end
end

grad = grad1;

% =============================================================

end
