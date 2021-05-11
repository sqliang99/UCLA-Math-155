%% Question 5a

image=im2double(imread('Fig5.26a.jpg'));

MX=[-1,0,1;-2,0,2;-1,0,1];
MY=[-1,-2,-1;0,0,0;1,2,1];
output=zeros(size(image));

for x = 2:size(image,1)-1
    for y=2:size(image,2)-1
       Gx=sum(sum(MX.*image(x-1:x+1,y-1:y+1)));
       Gy=sum(sum(MY.*image(x-1:x+1,y-1:y+1)));
       output(x,y)=sqrt(Gx.^2+Gy.^2);
    end
end

imshow(output)