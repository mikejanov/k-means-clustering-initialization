% Michael Janov
% November 6, 2017
% This script generates a set of samples given specific
%   parameters for a single multivariate Gaussian
% The output matrix [data] follows the following pattern:
%             X   Y   Class
%           -----------------
%   Sample1 |
%   Sample2 |
%   ...     |
%   Sample_nSamples

function data = generateMVGaussianSamples(mu, covariance, nSamples, classTag)
    data = mvnrnd(mu, covariance, nSamples);
    data(:,3) = classTag;
end