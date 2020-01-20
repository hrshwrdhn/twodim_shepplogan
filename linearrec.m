function[shepp_rec] = linearrec(Q,ang,~,nt,npixel,N)
tau = 2*sqrt(2)/(nt-1);

t1= ((0:N)*tau)- 2*sqrt(2);
ind= find(t1<=sqrt(2)+eps & t1>= -sqrt(2)-eps);



shepp_rec = zeros(npixel,npixel);

tic
for m=1:npixel
    for n=1:npixel
        
        x=(1-2*(n-1)/npixel)*-1;
        y=(1-2*(m-1)/npixel);
        
        
        
        
        for i=1:length(ang)
            
            tdash=round(( x*cosd(ang(i))+y*sind(ang(i)))*1000)/1000;
            
            tmin= find(t1<= tdash & t1> tdash -tau   ) ;
            tmax= tmin+1;
            rem1= tdash-t1(tmin);
            if t1(tmin)>-sqrt(2) && t1(tmax)<sqrt(2)
                shepp_rec(m,n) = shepp_rec(m,n)+ Q(i,tmin)*(1-rem1/tau)+(rem1/tau)*Q(i,tmax);
                %shepp_rec(n,m)=shepp_rec(n,m)+ abs(Qbr(i, floor(tdash/taudash +1)));
            end
        end
        
    end
end
toc
shepp_rec= shepp_rec*pi/length(ang);

end
