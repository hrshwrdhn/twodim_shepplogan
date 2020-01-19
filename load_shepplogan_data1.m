function [x0,y0,A,B,alpha,rho] = load_shepplogan_data1()
  %loading data of shepp logan
  %rh0=[0 0 0 0 0  0 0 2 0 0 ]; 
  rho=[2 -0.98 -0.02 -0.02 0.01 0.01 0.01 0.01 0.01 0.01];  %value of n or rho inside ellipse
  A=[0.92 0.874 0.31 0.41 0.25 0.046 0.046 0.046 0.023 0.046]; %mazor axis
  B=[0.69 0.6624 0.11 0.16 0.21 0.046 0.046 0.023 0.023 0.023]; %minor axis
  alpha =[90 90 72 108 90 0 0 0 0 90];    %angleof rotation of ellipse
  x0=[0 0 0.22 -0.22 0 0 0 -0.08 0 0.06]; %centre x
  y0=[0 -0.0184 0 0 0.35 0.1 -0.1 -0.605 -0.605 -0.605]; % centre y
end
