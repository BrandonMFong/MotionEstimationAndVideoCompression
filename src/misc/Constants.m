% Defines the class that holds all constants

classdef Constants
    properties
        Y = 1;
        Cb = 2;
        Cr = 3;
        MacroBSize = 16; % Macroblock
        SWSize = 32; % Search Window

        % Searchwindow check variables
        uint8 TopLeft = 1; 
        uint8 BottomLeft = 2; 
        uint8 TopRight = 3; 
        uint8 BottomRight = 4; 
        uint8 Left = 5; 
        uint8 Right = 6; 
        uint8 Top = 7; 
        uint8 Bottom = 8; 
    end
end