function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting only 
%on to the top k eigenvectors
%   Z = projectData(X, U, K) computes the projection of 
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first K columns of U. It returns the projected examples in Z.
%

% You need to return the following variables correctly.
Z = zeros(size(X, 1), K);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the projection of the data using only the top K 
%               eigenvectors in U (first K columns). 
%               For the i-th example X(i,:), the projection on to the k-th 
%               eigenvector is given as follows:
%                    x = X(i, :)';
%                    projection_k = x' * U(:, k);
%

U_reduce = U(:,1:K);
Z = X*U_reduce;

%So basical just remember that if you are reducing 11D to 3D, with 15 rows
%of data, it means 15X11 matrix needs to become 15X3, to do this you will
%need to multiply 15X11 matrix with 11X3 matrix, this 11X3 matrix is the
%U(:,1:k)matrix.



% =============================================================

end
