%Runs KmeansClusterPixels for all the appropriate files in a directory.
%
%Note: Written on 2018/07/06.
function []=KmeansClusterPixels_All(BaselineN,Repetition,PixelThreshold)

%Find the '*FilterAndRegisterImages.mat'
FileList=dir('*FilterAndRegisterImages.mat');
%Find the ManualROI files.
ManualROIFiles=dir('*SelectROIManually.mat');
%Load number of clusters.
%Each folder should have one .mat file that contains
%NofClusters.
load('ClusterNumber.mat');

NofExperiments=size(FileList,1);

for n=1:NofExperiments
    KmeansClusterPixels(FileList(n).name,ManualROIFiles(n).name,NofClusters,BaselineN,Repetition,PixelThreshold);
end

clear