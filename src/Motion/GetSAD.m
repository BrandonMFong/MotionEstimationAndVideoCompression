function out = GetSAD(ref,curr)% What is this returning?
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
    var = (const.SWSize - const.MacroBSize)/2; % for this case it is 8
    ZeroMatrix = zerores(const.SWSize,const.SWSize); % Zero Matrix to lay out search window
    [MaxRowBound,MaxColumnBound] = size(Frame); % For testing if MB is on the right or bottom edges

    % If the intervals are out of range, append the search window with zeroes

    % At corners
    if ((RowMin - var) < 1) && ((ColumnMin - var) < 1) % Top left
    elseif ((RowMax + var) > MaxRowBound) && ((ColumnMin - var) < 1) % Bottom left
    elseif ((RowMin - var) < 1) && ((ColumnMax + var) > MaxColumnBound) % Top right
    elseif ((RowMax + var) > MaxRowBound) && ((ColumnMax + var) > MaxColumnBound) % Bottom right

    % At edges
    elseif(((RowMin - var) > 1) && ((RowMax + var) < MaxRowBound) && ((ColumnMin - var) < 1)) % Left edge
    elseif(((RowMin - var) > 1) && ((RowMax + var) < MaxRowBound) && ((ColumnMax + var) > MaxColumnBound)) % Right edge
        
        
    % When Macroblock is in the middle of the frame
    else % when the search window does not overlap with the edges
        out = Frame((RowMin+var):(RowMax+var),(ColumnMin+var):(ColumnMax+var));
    end
end