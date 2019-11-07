function slphantom=  slphantom(pixelsize,mageshow);

%code is developing data for shepp and logan phanton
% n = size of shepp logan (n*n)
% to generate Shepp Logan phantom of size 20*20 
% P= slpahntom(20,0);
%To display phantom
% p = slphantom(20,1);

x= -1:2/(pixelsize-1):1;
y=1:-2/(pixelsize-1):-1;
[X,Y]= meshgrid(x,y);
[x0,y0,A,B,alpha,rho] = load_shepplogan_data1();
 slphantom = zeros(pixelsize,pixelsize);
 for k=1:length(x0);
  
  check1 = find(   (( ( ( X-x0(k) )*cosd(alpha(k)) + ( Y-y0(k) )*sind(alpha(k)) ).^2) / A(k)^2 ) + ( ( ( (X-x0(k) )*sind(alpha(k)) - ( Y-y0(k) )*cosd(alpha(k)) ).^2) / B(k).^2 ) <= 1 );
   slphantom(check1) = slphantom(check1) + rho(k); 
     

 end

 if mageshow == 1
  shepp1= mat2gray(slphantom);
  slpclear= imadjust(shepp1,[.5 .52], []); 
  figure, imshow(slpclear);
  title('Shepp Logan Phantom : Original')
 end

end
%
function [x0,y0,A,B,alpha,rho] = load_shepplogan_data1();
  %loading data of shepp logan
  %rh0=[0 0 0 0 0  0 0 2 0 0 ]; 
  rho=[2 -0.98 -0.02 -0.02 0.01 0.01 0.01 0.01 0.01 0.01];  %value of n or rho inside ellipse
  A=[0.92 0.874 0.31 0.41 0.25 0.046 0.046 0.046 0.023 0.046]; %mazor axis
  B=[0.69 0.6624 0.11 0.16 0.21 0.046 0.046 0.023 0.023 0.023]; %minor axis
  alpha =[90 90 72 108 90 0 0 0 0 90];    %angleof rotation of ellipse
  x0=[0 0 0.22 -0.22 0 0 0 -0.08 0 0.06]; %centre x
  y0=[0 -0.0184 0 0 0.35 0.1 -0.1 -0.605 -0.605 -0.605]; % centre y
end
