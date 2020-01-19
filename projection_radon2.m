function Projection_2 = projection_radon2(theta,t)
[x0,y0,A,B,alpha,rho] = load_shepplogan_data1();

Projection_2= zeros(length(theta),length(t));
for j= 1: length(theta)
    for i=1:10
        th = theta(j) - alpha(i);
        if  x0(i)==0 && y0(i) == 0
            t1 = t;
        else
            
            gm= atand(y0(i)/x0(i));
            
            s= sqrt( x0(i)^2 + y0(i)^2);
            
            t1= t - s*cosd(gm-theta(j));
        end
        
        a2= (A(i)^2*(cosd(th)^2))+(B(i)^2*(sind(th)^2));
        ind= find (t1.^2 - a2 <= 0);
        Projection_2(j,ind)=  Projection_2(j,ind)+2 * rho(i)* A(i)*B(i)* sqrt(a2 - t1(ind).^2) / a2;
        
    end
end


end
