
function MV = LogarithmicSearch(targetBlock, searchWindow)

p = 16;
last = false;

MV = [p,p];      %center of the searchWindow 
offset = p/2;

while last ~= true
    % 1.Set a search region of 8 points, each separated offset times away
    %   from the center vetically and horizontally. Include center as point
    %   9.
    
    % 2. Find the point where the macroblock has the minimum MAD
    
    %. 3. set MV equal to the point with the minimum MAD
    
    if(offset == 1) 
        last = true;
    end
    
    offset = offset / 2;
end

end