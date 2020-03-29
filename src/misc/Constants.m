% Defines the class that holds all constants

classdef Constants
    properties
        Y = 1;
        Cb = 2;
        Cr = 3;
        BlockSize = 8;
        Lum_Quant_Matrix = csvread('LuminanceQMat.csv');
        Chrom_Quant_Matrix = csvread('ChrominanceQMat.csv');
        Peak_Signal = 255; %Lecture 2, slide 12
    end
end