A=imread('Fig5.26a.jpg');
input=im2double(A);
[M,N]=size(A);
output=sinnoise(input,200,0.25,0);

for i = 1:M
   for j = 1:N
         d=(i-1)+(j-1);
         D(i,j)=output(i,j)*(-1)^d;
   end
end

fourier_trans=fft2(D); 

Q=abs(fourier_trans);

c=5; 
for i = 1:M
    for j = 1:N

       E(i,j)=c*log(1+Q(i,j));
    end
end

figure();
image(E); colormap(gray); title('spectrum of degraded image'); 

img = imread('Fig5.26a.jpg');
img = im2double(img);

result = sinnoise(img, 200, 0.25, 0);


img = result
[M ,N] = size(img);
center_x = M/2;
center_y = N/2;
transformed = fftshift(fft2(img));

points = [129, 65; 129, 193];

for x = 1 : M
    for y = 1 : N
        for d = 1:2
            y0 = points(d, 1);
            x0 = points(d, 2);
            d1 = ((x - x0)^2 + (y - y0)^2)^0.5;
            d2 = ((x - x0)^2 + (y + y0)^2)^0.5;
            transformed(x, y) = transformed(x, y) * 1.0 / (1+(25 /(d1 * d2)));
        end
    end
end

final = ifft2(ifftshift(transformed));

figure();
imshow(final);