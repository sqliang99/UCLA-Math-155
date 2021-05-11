f=imread('Fig5.26a.jpg');

[M N] = size(f); 

B=double(f);

% multiply f by (-1)^(x+y) to shift the center 
for i = 1:M,
   for j = 1:N,
         d=(i-1)+(j-1);
         C(i,j)=B(i,j)*(-1)^d;
   end
end

% compute the DFT of f*(-1)^{x+y} 
fourier_trans=fft2(C); 

% compute the spectrum 
D=abs(fourier_trans);

%%%%%%%%%%%%%%
% Plot the centered spectrum, after rescaling using the log transform 
%%%%%%%%%%%%%%

c=5; 
for i = 1:M,
             for j = 1:N,

                 E(i,j)=c*log(1+D(i,j));
             end
         end

% plot the spectrum (transformed by log for visualisation purposes) 
figure 
image(E); colormap(gray); title('spectrum of FT of f'); 

%%%%%%%%%%%%%
% compute the IFFT2 to go back to f 
%%%%%%%%%%%%%

%% for average

scum=0;
for i = 1:M
   for j = 1:N
         scum=B(i,j)+scum;
   end
end

ave=scum/(M*N);
ave

%% apply IFFT and take the real part 
ff=real(ifft2(F));

% multiply ff by (-1)^(x+y) to shift the center back to the origin 
for i = 1:M,
   for j = 1:N,
         d=(i-1)+(j-1);
         fff(i,j)=ff(i,j)*(-1)^d;
   end
end

% the result (equal with the input image) 
figure
image(fff); colormap(gray); axis image; title('the result f obtained by taking the IFT'); 
