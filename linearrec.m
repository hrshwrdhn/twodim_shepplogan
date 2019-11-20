function[shepp_rec] = linearrec(Q,angles);

 shepp_rec = zeros(128,128);
 Qbr= zeros(100,127);
   Qbr= Q(:,64:190);

for m=1:128
    for n=1:128
          
    x=(1-2*(n-1)/127)*-1;
    y=(1-2*(m-1)/127);
    taudash=2*sqrt(2)/126;
 
   
 
  for i=1:length(angles)  
   
     tdash=( x*cosd(angles(i))+y*sind(angles(i)));
     tdash= round(tdash*1000/taudash)/1000;
     
     t1= floor(tdash) +64;
     t2=ceil(tdash)+64;
     rem= abs(tdash-floor(tdash));
 
  shepp_rec(m,n) = shepp_rec(m,n)+ Qbr(i,t1)*(1-rem)+(rem)*Qbr(i,t2); 
%shepp_rec(n,m)=shepp_rec(n,m)+ abs(Qbr(i, floor(tdash/taudash +1)));
        
end
    
end
end

shepp_rec= shepp_rec*pi/length(angles);;

end
