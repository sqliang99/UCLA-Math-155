%% Question 4

image=im2double(imread('Fig3.40(a).jpg'));

lap_filter=[1,1,1;
            1,-8,1;
            1,1,1];

output=zeros(size(image));

for x = 2:size(image,1)-1
    for y=2:size(image,2)-1
        temp=image(x-1:x+1,y-1:y+1).*lap_filter;
        output(x,y)=image(x,y)-sum(temp(:));
    end
end

figure();
imagesc(output);colormap(gray(256));
