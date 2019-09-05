%  Multivariate Reguarlised Least Squares (RLS)
%
%  [Y, w] = RegLS(lambda, x, data, target )
%
%  Arguments:
%
%  'data' should be a N rows by D columns matrix of data, composed
%  of N training examples, each with D dimensions.
%
%  'target' should be a N rows by c columns matrix of output, 
%  corresponding to N training examples, each with c target variables.
%
%  'x' should be a  M rows by D columns matrix of data, where the RLS estimates are required. It is composed
%  of M test examples, each with D dimensions.
%
%  'lambda' is the regularisation parameter.
%  Note: lambda should be non-negative.
%
%  Returns:
%  'Y' - a  M rows by c columns matrix of predicted target variables for your data 'x'.
%  'w' - the coefficient vector learned from the training data, size
%  1x(c+1), storing [w_0, w_1, w_2, ..., w_c]
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  YOU SHOULD NOT BE EDITING THIS CODE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Y, w] = RegLS(lambda, x, data, target )

%get data characteristics
numtrain = size(data,1);
numfeatures = size(data,2);

if size(x,2) ~= numfeatures
   error('Test data dimensions does not match train data dimensions.');
end

if lambda<0
   error( ['The regualisation parameter should not be negative.'] );
end

% add ones to the first column of the training data
Xtr = [ones(numtrain,1), data];

% calculate the linear coefficients stored in the column vector w
if lambda ==0
   %normal equations
   w = pinv(Xtr) * target;
else
   %regularised least squares
   w = inv( Xtr' * Xtr + lambda * eye(numfeatures+1) ) * Xtr' * target;
end

Xte = [ones(size(x,1),1), x];
Y = Xte * w;


