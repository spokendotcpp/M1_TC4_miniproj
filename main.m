% M1 TC4 - Introduction à l'analyse de données
% Sujet 1
% 
% GIMENEZ Florian
% HECKEL Thibault
%
% Janvier 2018

% Suppression de toutes les variables en mémoires
%clear all

% Sélection d'une certaine séquence d'images :
prefix = 'motion';
dir_name = strcat('sequences/', prefix, '*.tiff');

% Listing du répertoire dans lequel se trouve toutes nos images :
dir_list = dir(dir_name);

% Toutes les images d'une séquence d'images sont censées avoir les mêmes 
% dimensions ici.
% Pour récupérer la dimension de toutes ces images, il nous suffit alors de
% lire uniquement les dimension d'une seule image (ici la première) :
img_default = imread(['sequences/' dir_list(1).name]);

% img_h -> height (hauteur, nombre de lignes)
% img_w -> width (largeur, nombre de colonnes)
[img_h, img_w] = size(img_default);

% Nombre d'images listées :
nb_img = length(dir_list);

% Récupération dans une matrice à 3 dimensions de toutes les images 
% de notre séquence.
% Cette matrice aura pour taille :
% [hauteur de l'image][largeur de l'image][nombre d'images]
% Initialisation :
img_list = ones(img_h, img_w, nb_img);

for i = 1:nb_img
   img_list(:,:,i) = imread(['sequences/' dir_list(i).name]);
end

% 1)
% Mélange des Images 
% Liste des index d'images mélangés
shuffle = randperm(nb_img);

% Permutation et recopies des images dans une nouvelle liste :
img_shuffle = ones(img_h, img_w, nb_img);
for i = 1:nb_img
    img_shuffle(:,:,i) = img_list(:,:, shuffle(i));
end

%shuffle2 = randperm(nb_img);

% img_list = img_list(:,:,shuffle);
% img_list = img_list(:,:,shuffle2);
% 
% % "Vectorisation" des images
% imVec = ones(img_h*img_w, nb_img);
% 
% for i = 1 : length(listeImages)
%    a = img_list(:,:,i);
%    imVec(:,i) = a(:);
% end
% 
% % Calcul de la covariance
% covMat = cov(imVec);
% [V , D] = eig(covMat);
% test = V' * imVec';


