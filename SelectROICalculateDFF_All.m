%Runs SelectROICalculateDFF for all the *FilterAndRegisterImages.m files.
%
%Note: Written on 2018/07/06.
function []=SelectROICalculateDFF_All(NofROI,BaselineN,PixelThreshold,MinI,MaxI)

%Find the '*FilterAndRegisterImages.mat'
FileList=dir('*FilterAndRegisterImages.mat');

NofExperiments=size(FileList,1);

for n=1:NofExperiments
    SelectROICalculateDFF(FileList(n).name,NofROI,BaselineN,PixelThreshold,MinI,MaxI);
end

clear