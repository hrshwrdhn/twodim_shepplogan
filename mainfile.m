clc;
clear;

n = 128;  % size of pixel


shepp = slphantom(n,0);    % p= slphantom(n,m) m=0 no plot m=1 shepplogan image plot



nang= 100;
nt= 127;
t= -1*sqrt(2): 2*sqrt(2)/(nt-1) : sqrt(2);
ang= 0:180/(nang):179.99;
proj= testproj(ang,t);
tau = 2*sqrt(2)/(nt-1);
shepp_rec = wedgefilter_1(proj,tau,ang);
