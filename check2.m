 
 
 error= abs(shepp_original - shepp_rec );
% imshow(error)
ep=zeros(npixel)
ind= find(shepp_original > eps);
 ep(ind)= error(ind)./ shepp_original(ind);
%imshow(ep)
surf(ep)
