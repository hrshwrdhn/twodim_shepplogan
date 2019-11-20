function [shepp_rec] = wedgefilter_1(projection_1,tau,angles)
% calculate 2 dim recontruction 
[I,J]= size(projection_1); 
W=(2*tau)^-1; % W is maximum frequency, (*-W,W) is frequncy domain
 N= 256; %FFT size
 Pt=projection_1;
 projection_1 = [projection_1 zeros(I,N-J)];
%  w= abs(-W:2*W/(N-1):W);

 
 ht= zeros(1,127);

for j=1:127
   i=j-64;
if i==0
 ht(j)= 1/(4*tau^2);
elseif rem(i,2)==0
    ht(j)=0;
elseif abs(rem (i,2))==1;
    ht(j)= -1/(i*pi*tau)^2;
end
end

hf= fftshift(fft([ht zeros(1,129)]));

qconv=zeros(100,127+127-1);
%  figure(6)
% plot(abs(hf))
 WS=zeros(length(angles),N);
 for i=1:length(angles)
    WS(i,:) =(fftshift(fft(projection_1(i,:))).*hf);
Q(i,:)= tau*ifft(ifftshift(WS(i,:)));
 
 qconv(i,:)= tau*conv(Pt(i,:),ht);
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

shepp_rec = linearrec(Q,angles)
%  end
 
  





end
