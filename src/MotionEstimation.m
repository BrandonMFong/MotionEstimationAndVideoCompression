% Design and implement the full search motion estimation technique for video compression, 
% by using the search window of 32x32 pixels, which is centered on the current macroblock. 
% Use five frames (from frame #6 to frame #10) of the given motion video ‘walk_qcif.avi, while 
% ignoring the first five and the remaining frames (note: you should extract these five video frames 
% from the sequence). In QCIF format, the frame size is 176x144 pixels and you should use 4:2:0 format. 
% Please use the IPPPP structure with GOP size of 5 frames, and predict all the P frames from the I 
% frame. You can use the SAD method for motion estimation. You are required to generate the difference 
% frame for each P-frame, and then generate the reconstructed P-frames by performing decoding.

% For this we take two frames and compare them to get calculate motion vector
% As recommended, will rough out just two frames then expand alg


RefFrame = GetYFrameFromVid(6);   %I frame

for i = 7:1:10
    
    CurrFrame = GetYFrameFromVid(i);  %P frame

    [vectorX, vectorY, error] = Search(RefFrame,CurrFrame);

    [X, Y] = meshgrid(1:11, 1:9);
    
    %Display Error Frame
    figure,imshow(error);
    title('Error');
    
    
    %Display Motion Vectors
    figure();
    quiver(X, Y, vectorX(:,:), vectorY(:,:));
    title('Motion Vector');
    
    %Adding motion vectors
    [row, column] = size(RefFrame);
    
    vectImage = zeros([row, column]);
    
    j = 1;
    for n = 1:16:row
        k = 1;
        for m = 1:16:column
            
            indexRow = n + vectorX(j, k);
            indexCol = m + vectorY(j, k);
            
            endRow = 15;
            endCol = 15;
            
            if((endRow + indexRow) > row)
                endRow = (endRow + indexRow) - row;
            end
            
            if((endCol + indexCol) > column)
                endCol = (endCol + indexCol) - column;
            end
            
            block = zeros(16);
            
            block(1:1+endRow,1:1+endCol) = RefFrame(n:n+endRow, m:m+endCol);
            
            vectImage(n:n+15, m:m+15) = block(:,:); 
            
            k = k + 1;
        end
        j = j + 1;
    end
    
    
    figure,imshow(uint8(vectImage));
    title('Vector Y');
    
    %Reconstructing Image 
    % The reconstructed image is obtained by adding the error image and
    % motion vectors to the reference frame as described in 2.2.7
    reconImage = RefFrame + error;
    figure,imshow(reconImage);
    title('Reconstructed Y');
    
end