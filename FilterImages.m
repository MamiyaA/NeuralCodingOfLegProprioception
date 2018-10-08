%Filter the images using Gaussian filter (size: Hsize, sigma:
%GaussianSigma)
%
%FileName: a name of the .tiff file from scanimage.
%Hsize: size of a gaussian filter (Matlab standard). Recommended value 5:
%may be 3?
%GaussianSigma: standard deviation of the Gaussian distribution.
%Recommended value 3, may be 0.5?
%NofChannels: Number of channels in the recording.
%
%LowI: Low range for image display.
%HighI: High range for image display.
%


function []=FilterImages(FileName,Hsize,GaussianSigma,NofChannels,LowI,HighI)

%Get the image information.
ImageInfo=imfinfo(FileName);

%Check the number of images in a file.
FrameN=length(ImageInfo);

%Get row (Height) and column (Width) number from the structure InfoSize
SizeOfImage(1)=ImageInfo(1).Height;
SizeOfImage(2)=ImageInfo(1).Width;

%Initialize the matrix for the entire image.
ImageData=int16(zeros(SizeOfImage(1),SizeOfImage(2),FrameN));

%Code to read TIFF using TIFF library.
FileLink = Tiff(FileName,'r');
for n=1:FrameN
    FileLink.setDirectory(n);
    ImageData(:,:,n)=FileLink.read();
end
FileLink.close();

%Find frames per channel.
FrameN=FrameN/NofChannels;

%Initialize the matrix
FilteredImages=int16(zeros(SizeOfImage(1),SizeOfImage(2),NofChannels,FrameN));

figure;%Make new figure
for frame=1:FrameN
    %Filter the image using gaussian filter.
    FilteredImages(:,:,:,frame)=imgaussfilt(ImageData(:,:,(frame-1)*NofChannels+1:frame*NofChannels),GaussianSigma,'FilterSize',Hsize);
    %Display the image for the SignalChannel.
    imshow(FilteredImages(:,:,SignalChannel,frame),[LowI,HighI]);
end

position=strfind(FileName,'.'); %gives the position of the period in the string FileName
NewName=FileName(1:position-1); %string NewName has the file name without the ".tiff".
Outfile = strcat(NewName,'FilterImages');
save(Outfile,'FilteredImages');
clear
