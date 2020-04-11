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

    [vector, error] = Search(RefFrame,CurrFrame);

    [X, Y] = meshgrid(1:16, 1:16);
    
    %Display Error Frame
    figure,imshow(error);
    
    %Display Motion Vectors
    figure();
    quiver(X, Y, vector(:,1), vector(1,:));
    
    index = 1;
    %Reconstructing Image
    for j = 1:16:144
        for k = 1:16:176
            x = vector(index, 1);
            y = vector(index, 2);
            index = index + 1;
            
            reconstructed(j:j+15,k:k+15) = RefFrame(j+x:j+x+15, k+x:k+x+15);
        end
    end
    
end