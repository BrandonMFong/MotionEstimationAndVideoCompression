function out = Search(RefFrame, CurrFrame)
    const = Constants();
    [MaxRefRowBound, MaxRefColBound] = size(RefFrame);
    [MaxCurrRowBound, MaxCurrColBound] = size(CurrFrame);

    if( (MaxRefRowBound ~= MaxCurrRowBound) || (MaxRefColBound ~= MaxCurrColBound))
        fprintf(const.DimNoMatch);
        return;
    end

    MaxRow = const.MacroBSize;
    MaxCol = const.MacroBSize;

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
            MV = getMVCoordinates(CurrFrame(MinRow:MaxRow, MinCol:MaxCol), uint8(GetSearchWindow(RefFrame,MaxRow,MinRow,MaxCol,MinCol)));

            MaxCol = MaxCol + const.MacroBSize;
        end
        MaxRow = MaxRow + const.MacroBSize;
    end

end
