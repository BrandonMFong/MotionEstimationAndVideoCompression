format long
clear
% Must have Matlab R2016b and higher
% If not, comment out Part B and included Part A
try 
    if ~exist('Outputs', 'dir')
        mkdir('Outputs')
    end 
    var = jsondecode(fileread('Project.json'));
    [rows, columns] = size(var.Paths);
    for r = 1:rows
        addpath(var.Paths(r).Path);
    end
catch exception
    throw(exception)
end