% Michael Janov
% November 29, 2017
% runMVGaussianSamples.m
% This script forms the desired MV Gaussian data set

class1 = generateMVGaussianSamples([1 1], eye(2), 500, 1);
class2 = generateMVGaussianSamples([4 4], eye(2), 500, 2);

sampleset = [class1; class2];