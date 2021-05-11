%% Question 5 continue

image=im2double(imread('Fig5.26a.jpg'));

output=zeros(size(image));

for x = 2:size(image,1)-1
    for y=2:size(image,2)-1
       Gx=abs(image(x+1,y)-image(x-1,y));
       Gy=abs(image(x,y+1)-image(x,y-1));
       output(x,y)=Gx+Gy;
    end
end

imagesc(output);colormap(gray(256))
