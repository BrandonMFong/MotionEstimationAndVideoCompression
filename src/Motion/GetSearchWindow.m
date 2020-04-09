
function out = GetSearchWindow(Frame,RowMax,RowMin,ColumnMax,ColumnMin)
    % RowMax : Max index for row 
    % RowMin : Min index for row 
    % ColumnMax : Max index for column
    % ColumnMin : Min index for column

    const = Constants();
    var1 = (const.SWSize - const.MacroBSize)/2; % 8
    var2 = const.MacroBSize + (const.SWSize - const.MacroBSize)/2; % 24
    ZeroMatrix = zerores(const.SWSize,const.SWSize); % Zero Matrix to lay out search window
    [MaxRowBound,MaxColumnBound] = size(Frame); % For testing if MB is on the right or bottom edges

    % If the intervals are out of range, append the search window with zeroes

    % At corners
    if ((RowMin - var1) < 1) && ((ColumnMin - var1) < 1) % Top left
        out = GetMatrix( Frame( 1:var2 , 1:var2 ) , const.TopLeft);

    elseif ((RowMax + var1) > MaxRowBound) && ((ColumnMin - var1) < 1) % Bottom left
        out = GetMatrix( Frame( (MaxRowBound-var2):MaxRowBound , 1:var2 ) ,const.BottomLeft);

    elseif ((RowMin - var1) < 1) && ((ColumnMax + var1) > MaxColumnBound) % Top right
        out = GetMatrix( Frame ( 1:var2 , (MaxColumnBound-var2):MaxColumnBound ), const.TopRight);

    elseif ((RowMax + var1) > MaxRowBound) && ((ColumnMax + var1) > MaxColumnBound) % Bottom right
        out = GetMatrix( Frame ( (MaxRowBound-var2):MaxRowBound , (MaxColumnBound-var2):MaxColumnBound ) , const.BottomRight);

    % If we got this far, we are not in any of the corners
    % At edges
    elseif((ColumnMin - var1) < 1) % Left edge
    elseif((ColumnMax + var1) > MaxColumnBound) % Right edge
    elseif((RowMin - var1) < 1) % Top edge
    elseif((RowMax + var1) > MaxColumnBound) % Bottom edge
        
        
    % When Macroblock is in the middle of the frame
    else % when the search window does not overlap with the edges
        out = Frame((RowMin+var1):(RowMax+var1),(ColumnMin+var1):(ColumnMax+var1));
    end
end

function out = GetMatrix(Matrix,Location)
    const = Constants();
    [row,col]=size(Matrix);
    NewMatrix = zeros(const.SWSize,const.SWSize);
    var1 = (const.SWSize - const.MacroBSize)/2; % 8
    var2 = const.MacroBSize + (const.SWSize - const.MacroBSize)/2; % 24

    % if we are on the corners
    if(col < const.SWSize) && (row < const.SWSize) % this is the case if the col/row are both 24 long

        %% LEFT %%
        % if we are on the top left corner
        if(Location == const.TopLeft)
            NewMatrix = [zeros(var2,var1) Matrix]; 
            out = [zeros(var1,const.SWSize);NewMatrix];

        % if we are on the bottom left corner
        elseif (Location == const.BottomLeft)
            NewMatrix = [zeros(var2,var1) Matrix];
            out = [NewMatrix;zeros(var1,const.SWSize)];

        % if we are on the top rigth corner
        elseif (Location == const.TopRight)
            NewMatrix = [Matrix zeros(var2,var1)]; 
            out = [zeros(var1,const.SWSize);NewMatrix];
            
        % if we are on the bottom right corner
        elseif(Location == const.BottomRight)
            NewMatrix = [Matrix zeros(var2,var1)];
            out = [NewMatrix;zeros(var1,const.SWSize)];

        else 
            fprintf("Something didn't go right");
        end
    end
    


end




% Didn't know Joseph already started
% function out = GetSAD(ref,curr)% What is this returning?
%     const = Constants();

%     [r, c] = size(curr);
%     RowMax = const.MacroBSize
%     ColumnMax = const.MacroBSize
%     Vector = MotionVector();
%     MotionVectors = [Vector]; % Init Motion Vector matrix

%     for RowMin = 1:const.MacroBSize:r 
%         if(RowMax > r) 
%             break; % Nothing left in the frame to sweep
%         end % Bounding since I am inc by Blocksize
%         for ColumnMin = 1:const.MacroBSize:c 
%             if (ColumnMax > c) 
%                 ColumnMax = const.MacroBSize; % reset
%             end % Bounding since I am inc by Blocksize
            
%             ColumnMax = ColumnMax + const.MacroBSize; % bound this
%         end

%         x = MotionVector();
%         x = x.Calculate(,curr(RowMin:RowMax,ColumnMin:ColumnMax));
%         MotionVectors = [MotionVectors, x];

%         RowMax = RowMax + const.MacroBSize; % bound this
%     end
% end
