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
 for k=1:length(x0)
  
  check1 = find(   (( ( ( X-x0(k) )*cosd(alpha(k)) + ( Y-y0(k) )*sind(alpha(k)) ).^2) / A(k)^2 ) + ( ( ( (X-x0(k) )*sind(alpha(k)) - ( Y-y0(k) )*cosd(alpha(k)) ).^2) / B(k).^2 ) <= 1 );
   slphantom(check1) = slphantom(check1) + rho(k); 
     

 end

 if mageshow == 1
  shepp1= mat2gray(slphantom);
  figure
  imagesc(shepp1);
  slpclear= imadjust(shepp1,[.5 .52], []); 
  figure, imshow(slpclear);
  title('Shepp Logan Phantom : Original')
 end

end
%
