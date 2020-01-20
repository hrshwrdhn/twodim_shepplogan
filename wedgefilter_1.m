function [shepp_rec] = wedgefilter_1(proj_2,ang,npixel)
% calculate 2 dim recontruction
[nang,nt]= size(proj_2);

tau = 2*sqrt(2)/(nt-1);
W=(2*tau)^-1; % W is maximum frequency, (*-W,W) is frequncy domain
N= 2^floor(log2(2*nt) +1); %FFT size
Pt=proj_2;
proj_2 = [proj_2 zeros(nang,N-nt)];
%  w= abs(-W:2*W/(N-1):W);


ht= zeros(1,nt);
if rem(nt,2)== 1
    for j=1:nt
        i=j-(nt+1)/2;
        if i==0
            ht(j)= 1/(4*tau^2);
        elseif rem(i,2)==0
            ht(j)=0;
        elseif abs(rem (i,2))==1
            ht(j)= -1/(i*pi*tau)^2;
        end
    end
else
    for j=1:nt-1
        i=j-(nt)/2;
        if i==0
            ht(j)= 1/(4*tau^2);
        elseif rem(i,2)==0
            ht(j)=0;
        elseif abs(rem (i,2))==1
            ht(j)= -1/(i*pi*tau)^2;
        end
        ht(nt)= 0;
    end
end
%hf= fftshift(fft([ht zeros(1,N-nt)]));
hf= (fft([ht zeros(1,N-nt)]));
%qconv=zeros(100,127+127-1);
%  figure(6)
% plot(abs(hf))
WS=zeros(length(ang),N);
for i=1:length(ang)
    WS(i,:) =((fft(proj_2(i,:))).*hf);
    %Q(i,:)= tau*ifft(ifftshift(WS(i,:)));
    Q(i,:)= tau*ifft((WS(i,:)));
    %qconv(i,:)= tau*conv(Pt(i,:),ht);
end

% Q(i,:)= tau*ifft(ifftshift(WS(i,:)));
% hf= fftshift(fft([ht zeros(1,129)]));
%
%
%  figure(6)
% plot(abs(hf))
%  WS=zeros(length(angles),N);
%  for i=1:length(angles)
%      WS(i,:) =(fftshift(fft(projection_1(i,:))).*hf);
%  Q(i,:)= tau*ifft(ifftshift(WS(i,:)).*[hamming(128)' zeros(1,128)]);
% % Q(i,:)= tau*ifft(ifftshift(WS(i,:)));

shepp_rec = linearrec(Q,ang,nang,nt,npixel,N);
%  end







end
