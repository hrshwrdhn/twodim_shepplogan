clc;
clear all;
close all;

npixel = 256;  % no. of pixel in x direction


shepp_original = slphantom(npixel,1);    % p= slphantom(n,m) m=0 no plot m=1 shepplogan image plot


nang= 100;
nt= 250;
t= -1*sqrt(2): 2*sqrt(2)/(nt-1) : sqrt(2);
ang= 0:180/(nang):179.99;


proj_2=projectionfbm(nang,nt);


shepp_rec = wedgefilter_1(proj_2,ang,npixel);%Reconstruction using FBP

figure
imagesc(shepp_rec,[1 1.03]);
title('Shepp Logan Phantom : Reconstruction')


