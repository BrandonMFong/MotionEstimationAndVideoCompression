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

RefFrame = GetYFrameFromVid(6);
CurrFrame = GetYFrameFromVid(7);

% GetSAD(RefFrame,CurrFrame) % Computes the SAD

%Test
%TestFrame = RefFrame(1:8,1:8,:)
%TestFrame = RefFrame(9-8:24+8,9-8:24+8,:)

for col = 1:16:176
    for row = 1:16:144
        
        targetBlock = CurrFrame(col:col+15,row:row+15);
        
%         if(col == 1 || col == 161)   %Testing for edge
%             maxCol = 24;
%         else
%             maxCol = 32;
%         end
%         
%         if(row == 1 || row == 129)   %Testing for edge
%             maxRow = 24;
%         else
%             maxRow = 32;
%         end
%         
%         %Not sure how to use it yet
%         window = GetSearchWindow(RefFrame,maxRow, 1, maxCol,1);
        
        MV = getMVCoordinates(targetBlock, window);
        
        
        
    end
end