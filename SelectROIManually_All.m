%Runs SelectROIManually for all the *FilterAndRegisterImages.m files.
%
%Note: Written on 2018/07/06.
function []=SelectROIManually_All()

%Find the '*FilterAndRegisterImages.mat'
FileList=dir('*FilterAndRegisterImages.mat');

NofExperiments=size(FileList,1);

for n=1:NofExperiments
    SelectROIManually(FileList(n).name);
end

clear