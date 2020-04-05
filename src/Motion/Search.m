function out = Search(ref,curr)% What is this returning?
    const = Constants();

    [r, c] = size(curr);
    RowMax = const.MacroBSize
    ColumnMax = const.MacroBSize
    Vector = MotionVector();
    MotionVectors = [Vector]; % Init Motion Vector matrix

    for RowMin = 1:const.MacroBSize:r 
        if(RowMax > r) 
            break; % Nothing left in the frame to sweep
        end % Bounding since I am inc by Blocksize
        for ColumnMin = 1:const.MacroBSize:c 
            if (ColumnMax > c) 
                ColumnMax = const.MacroBSize; % reset
            end % Bounding since I am inc by Blocksize
            
            ColumnMax = ColumnMax + const.MacroBSize; % bound this
        end

        x = MotionVector();
        x = x.Calculate(,curr(RowMin:RowMax,ColumnMin:ColumnMax));
        MotionVectors = [MotionVectors, x];

        RowMax = RowMax + const.MacroBSize; % bound this
    end
end

function out = GetSearchWindow(Frame,RowMax,RowMin,ColumnMax,ColumnMin)
    const = Constants();
    var = (const.SWSize - const.MacroBSize)/2;

    % If the intervals are out of range, append the search window with zeroes
    if ((RowMin - var) <= 1) && ((ColumnMin - var) <= 1)

    elseif (RowMin - var) <= 1
    elseif (ColumnMin - var) <= 1
    else
        out = Frame((RowMin+var):(RowMax+var),(ColumnMin+var):(ColumnMax+var));
    end
end