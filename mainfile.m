clc;
clear all;
close all;

n = 128;  % size of pixel


shepp = slphantom(n,1);    % p= slphantom(n,m) m=0 no plot m=1 shepplogan image plot
figure
imagesc(shepp);


nang= 100;
nt= 127;
t= -1*sqrt(2): 2*sqrt(2)/(nt-1) : sqrt(2);
ang= 0:180/(nang):179.99;

tic
proj_2=projectionfbm(nang,nt);
toc
tau = 2*sqrt(2)/(nt-1);shepp_rec = wedgefilter_1(proj_2,tau,ang);%Reconstruction using FBP

figure
imagesc(shepp_rec);
figure
imshow(shepp_rec);
