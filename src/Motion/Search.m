function [out, errorFrame] = Search(RefFrame, CurrFrame)
    const = Constants();
    [MaxRefRowBound, MaxRefColBound] = size(RefFrame);
    [MaxCurrRowBound, MaxCurrColBound] = size(CurrFrame);

    if( (MaxRefRowBound ~= MaxCurrRowBound) || (MaxRefColBound ~= MaxCurrColBound))
        fprintf(const.DimNoMatch);
        return;
    end
    
    MaxRow = const.MacroBSize;
    MaxCol = const.MacroBSize;

    x = 1;
    
    % Taking some of the bound checks from hw2 GetDCT.m
    for MinRow = 1:const.MacroBSize:MaxRefRowBound
        if(MaxRow > MaxRefRowBound) 
            break; 
        end 
        for MinCol = 1:const.MacroBSize:MaxRefColBound
            if (MaxCol > MaxRefColBound) 
                MaxCol = const.MacroBSize; 
            end 

            % targetBlock = CurrFrame(MinRow:MaxRow, MinCol:MaxCol)
            % GetSearchWindow(Frame,RowMax,RowMin,ColumnMax,ColumnMin)
            [MV, blockError] = getMVCoordinates(CurrFrame(MinRow:MaxRow, MinCol:MaxCol), uint8(GetSearchWindow(RefFrame,MaxRow,MinRow,MaxCol,MinCol)));

            errorFrame(MinRow:MinRow+15, MinCol:MinCol+15) = blockError(:,:);
            
            %Adjusting coordinate for top and left edge cases
            if(MinRow == 1)
                out(x, 1) = MV(1) - 8;
            else
                out(x, 1) = MV(1);
            end
            
            if(MinCol == 1)  
                out(x, 2) = MV(2) - 8;
            else
                out(x, 2) = MV(2);
            end
            
            x = x + 1;
            MaxCol = MaxCol + const.MacroBSize;
        end
        MaxRow = MaxRow + const.MacroBSize;
    end

end
