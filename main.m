% M1 TC4 - Introduction � l'analyse de donn�es
% Sujet 1
% 
% GIMENEZ Florian
% HECKEL Thibault
%
% Janvier 2018

% Suppression de toutes les variables en m�moires
clear all
% Fermeture de toutes les fen�tres
close all

% S�lection d'une certaine s�quence d'images :
prefix = 'motion';
dir_name = strcat('sequences/', prefix, '*.tiff');

% Listing du r�pertoire dans lequel se trouve toutes nos images :
dir_list = dir(dir_name);

% Toutes les images d'une s�quence d'images sont cens�es avoir les m�mes 
% dimensions ici.
% Pour r�cup�rer la dimension de toutes ces images, il nous suffit alors de
% lire uniquement les dimension d'une seule image (ici la premi�re) :
img_default = imread(['sequences/' dir_list(1).name]);

% img_h -> height (hauteur, nombre de lignes)
% img_w -> width (largeur, nombre de colonnes)
[img_h, img_w] = size(img_default);

% Nombre d'images list�es :
nb_img = length(dir_list);

% R�cup�ration dans une matrice � 3 dimensions de toutes les images 
% de notre s�quence.
% Cette matrice aura pour taille :
% [hauteur de l'image][largeur de l'image][nombre d'images]
% Initialisation :
img_list = ones(img_h, img_w, nb_img);

% Lecture des images list�es dans le r�pertoire :
for i = 1:nb_img
   img_list(:,:,i) = imread(['sequences/' dir_list(i).name]);
end

% 1)
% M�lange des Images 
% Pour ce faire : m�lange des index des images
shuffle = randperm(nb_img)

% Permutation et recopies des images dans une nouvelle liste :
img_shuffle = ones(img_h, img_w, nb_img);
for i = 1:nb_img
    img_shuffle(:,:,i) = img_list(:,:, shuffle(i));
end

% -------------- Jusqu'ici, tout est bon
% TEST & AFFICHAGES
%
% openCV comparaison de deux histogrammes
% https://docs.opencv.org/2.4/modules/imgproc/doc/histograms.html?highlight=comparehist#comparehist

figure;
hold on;
subplot(2,2,[1:2]);
% Affiche les diff�rences trouv�es entre deux images (visuel)
imshowpair( img_shuffle(:,:,1), img_shuffle(:,:,2), 'diff' );

subplot(2,2,3);
imshow( img_shuffle(:,:,1), []);

subplot(2,2,4);
imshow( img_shuffle(:,:,2), []);
hold off;

% Test de calcul d'une distance entre deux images
img_A = img_list(:,:,1);
img_B = img_list(:,:,2);

hist_A = hist(img_A(:));
hist_B = hist(img_B(:));

D = pdist2( hist_A, hist_B )
D = pdist2( hist_A, hist_A )