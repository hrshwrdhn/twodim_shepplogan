clc;
clear all;
close all;
Shp_log_phantom = phantom('Shepp-Logan',128);
% shp_gray=mat2gray(Shp_log_phantom);
d_the=1.8;
theta=0:d_the:180-d_the;
Proj_data_method_2=radon(Shp_log_phantom,theta);
nt=size(Proj_data_method_2,1);
nang=size(theta,2);
tau = 2*sqrt(2)/(nt-1);
shepp_rec_method2 = wedgefilter_1(Proj_data_method_2,tau,theta);%Reconstruction using FBP
figure
imagesc(shepp_rec_method2);

