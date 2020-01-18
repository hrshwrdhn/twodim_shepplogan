function profbm= projectionfbm(nang,nt)
[cenx,ceny,A,B,alpha,rh] = load_shepplogan_data1();
t= -1*sqrt(2): 2*sqrt(2)/(nt-1) : sqrt(2);
ang= 0:180/(nang):179.99;
[t1,ang1]=meshgrid(t,ang);


profbm = zeros(nang,nt);


 for k= 1: length(cenx)
  s=sqrt(  (  cenx(k)^2  )+(  ceny(k)^2   )   ) ;
  phi=ang1-alpha(k);
  a2= ( A(k).*cosd(phi) ).^2   + ( B(k)*sind(phi) ).^2;
  
    if cenx(k)==0 && ceny(k)==0
         tnew=t1;         
     elseif cenx(k)==0 && ceny(k)>0
        
         tnew= t1-s*(sind(ang1));
     elseif cenx(k)==0  && ceny(k)<0
             tnew= t1+s*(sind(ang1));
     elseif cenx(k)<0 
        gamma=atand(ceny(k)/cenx(k));
         tnew=t1+s*(cosd(gamma-ang1)); 
     else
         gamma=atand(ceny(k)/cenx(k));
             tnew=t1-s*(cosd(gamma-ang1));   
     end    
  
  
  
  
       ind= find(abs(tnew) <=  sqrt(a2) );
       
     
 profbm(ind) = profbm(ind) + 2*rh(k)*A(k)*B(k)*sqrt(a2(ind) - (tnew(ind).^2) )  ./a2(ind);
 
 
 
 
 
 end








end
