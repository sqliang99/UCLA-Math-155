%% Question 1a: draw histogram

image=imread('Fig3.08(a).jpg');
pixelnum=size(image,1)*size(image,2);

HIm=uint8(zeros(size(image,1),size(image,2)));
freq=zeros(256,1);

for i=1:size(image,1)
    for j = 1:size(image,2)
        value=image(i,j);
        freq(value+1)=freq(value+1)+1;
    end
end

figure,plot(freq),title('original image histogram')

%% Question 1b: histogram equalization
[M,N]=size(image);
p = freq/(M*N);
T=@(r) round(255*sum(p(1:r+1)));
x=0:255; % 
Tx=zeros(256,1); %to store the transformation on x

for j=1:256
    Tx(j) = T(j-1);
end
figure()
plot(x,Tx);
title('Equalizing Transformation')

%% Question 1c: image transformation
Output=freq/numel(image);
CSum=cumsum(Output);

HIm=CSum(image+1);

HIm=uint8(HIm*255);

figure,imshow(HIm),title('transformed image');

freqn=zeros(256,1);

for i=1:size(HIm,1)
    for j = 1:size(HIm,2)
        value=HIm(i,j);
        freqn(value+1)=freqn(value+1)+1;
    end
end

figure,plot(freqn),title('histogram after transformation')
