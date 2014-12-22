function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


abc11 = [];
abc22 = [];
ans22 = [];

for i = 1:m
    for k = 1:size(X,2)
        %hypothesis function
        abc11(i,k) = theta(k)* X(i,k);  
        
    end
    abc22(i,1) = sum(abc11(i,:));
    ans22(i,1) = (abc22(i,1)-y(i,1))^2;
end

clear i k

for i = 1:m
    %abc22(i,1) = sum(abc11(i,:));
    %abc22(i,1) = abc11(i,1)+ abc11(i,2) + abc11(i,3);
    %ans22(i,1) = (abc22(i,1)-y(i,1))^2;
end

J = sum(ans22)/(2*m);


% =========================================================================

end
