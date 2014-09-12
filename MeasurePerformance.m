% Measure Classification Performance
% called by GaussianClassify.m
% cannot run independantly

accuracy = sum(y2 == class) / length(y2);