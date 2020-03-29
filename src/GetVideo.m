fmtList = VideoReader.getFileFormats();

if any(ismember({fmtList.Extension},'avi'))
     disp('VideoReader can read AVI files on this system.');
else
     errpr('VideoReader cannot read AVI files on this system.');
end