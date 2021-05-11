%% hwk1q1
img128 = reducegray(128);
imwrite(img128,'img128.jpg');
img64 = reducegray(64);
imwrite(img64,'img64.jpg')
img32 = reducegray(32);
imwrite(img32,'img32.jpg')
img16 = reducegray(16);
imwrite(img16,'img16.jpg')
img8 = reducegray(8);
imwrite(img8,'img8.jpg')
img4 = reducegray(4);
imwrite(img4,'img4.jpg')
img2 = reducegray(2);
imwrite(img2,'img2.jpg')

function out = reducegray(level)
image = imread('Fig2.21(a).jpg');
 imageSize = size(image);
 num = 256/level;
 step = 255/(level-1);
 %make an empty array first
 out = uint8(zeros(imageSize(1), imageSize(2)));
        
for x = 1:1:imageSize(1)
 for y = 1:1:imageSize(2)
  out(x, y) = fix(double(image(x, y)) / num) * step;
 end
end
end