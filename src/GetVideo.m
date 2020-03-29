fmtList = VideoReader.getFileFormats();

if any(ismember({fmtList.Extension},'avi'))
     disp('VideoReader can read AVI files on this system.');
else
     error('VideoReader cannot read AVI files on this system.');
end

VideoFrames = VideoReader('walk_qcif.avi');

Frame = read(VideoFrames,1);
