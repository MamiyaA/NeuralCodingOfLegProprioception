# NeuralCodingOfLegProprioception
Analysis scripts for calcium imaging data presented in the paper "Neural Coding of Leg Proprioception in Drosophila" (Mamiya, Gurung, and Tuthill (2018) DOI:https://doi.org/10.1016/j.neuron.2018.09.009)

All imaging data are multi-channel, time series image acquired using ScanImage Software (Vidrio Technologies)

Brief description of each script:

FilterAndRegisterImages: Separate the signal channel and reference channel in the multi-channel .tiff image, filter each image using Gaussian filter, register the images using 2D fast-fourier transform. Display original and filtered image sequences.

FilterAndRegisterImages_All: Runs FilterAndRegisterImages for all the appropriate files in the directory.
 
FilterImages: Separate the signal channel and reference channel in the multi-channel .tiff image, filter each image using Gaussian filter. Display original and filtered image sequences.

KmeansClusterPixels: For the pixels inside the preselected region of interest, cluster the pixels into different groups with K-means clustering using the correlation between the pixel's responses to the stimuli as a distance measure. Results in groups of pixels that have similar responses to the stimuli.

KmeansClusterPiexels_All: Runs KmeansClusterPiexels for all the appropriate files in a directory.

SelectROICalculateDFF: Ask the user to manually select ROI, apply predefied pixel intensity threshold for each selected ROI, then calculate the DF/F (change in flureoscence relative to the baseline fluorescence) of those pixels based on the specified baseline frames.

SelectROICalculateDFF_All: Runs SelectROICalculateDFF for all the appropriate files in a directory.
