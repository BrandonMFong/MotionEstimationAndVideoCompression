% Calculates motion vector 

classdef MotionVector
    properties
        XCoordinate1; % Displacement start
        XCoordinate2; % Displacement end
        YCoordinate1; % Displacement start
        YCoordinate2; % Displacement end
    end
    methods
        % Uses the macroblock from the current frame and scans through the search window 
        function obj = MotionVector() % init
            obj.XCoordinate1 = 0;
            obj.XCoordinate2 = 0;
            obj.YCoordinate1 = 0;
            obj.YCoordinate2 = 0;
        end
        function Calculate(SearchWindow,MacroBlock)

        end
end