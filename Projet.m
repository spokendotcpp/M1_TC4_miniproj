clear all
listeImages = dir ('sequences/motion*.tiff');

im = imread(['sequences/' listeImages(1).name]);
[li, col] = size(im);

touteImages = ones(li,col,length(listeImages));

for i = 1 : length(listeImages)
   touteImages(:,:,i) = imread(['sequences/' listeImages(i).name]);
end

%Mélange des Images 
shuffle = randperm(length(listeImages));
shuffle2 = randperm(length(listeImages));

touteImages = touteImages(:,:,shuffle);
touteImages = touteImages(:,:,shuffle2);

%"Vectorisation" des images
imVec = ones(li*col,length(listeImages));

for i = 1 : length(listeImages)
   a = touteImages(:,:,i);
   imVec(:,i) = a(:);
end

%Calcul de la covariance
covMat = cov(imVec);

[V , D] = eig(covMat);

test = V' * imVec';


