
function [mv, error] = getMVCoordinates(targetBlock, searchWindow)
    
    blockSize = 16;
    [width, height] = size(searchWindow);
    bestMatch = 10000000000;
    coordinate = [0,0];
    
    for x = 1:width-15
        for y = 1:height-15
            
            candicateBlock = searchWindow(x:x+blockSize-1, y:y+blockSize-1);
            
            %get the absolute difference of the target and candidate block
            difference = imabsdiff(targetBlock,candicateBlock);
            SAD = sum(difference(:));
            
            if(SAD < bestMatch)
                bestMatch = SAD;
                
                %Set the coordinate of the origin of the best match
                coordinate(1) = x;
                coordinate(2) = y;
                error = difference;
            end
        end
    end
    
    mv = coordinate;
end
