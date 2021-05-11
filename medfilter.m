function [after] = medfilter(image)
output = zeros(size(image));
for i = 2:size(image,1) - 1
    for j = 2:size(image,2)-1
        list = [0 0 0 0 0 0 0 0 0];
        count = 1;

for x = 1:3
for y = 1:3
list(count) = image(i + x - 2, j + y - 2);
count = count + 1;
end
end

        
        output(i,j)=uint8(median(list,'all'));
    end
end

    for c=1:size(image,2)
    output(1,c)=image(1,c);
    end


    for c=1:size(image,2)
        output(size(image,1),c)=image(size(image,1),c);
    end

    for r=1:size(image,1)
        output(r,1)=image(r,1);
    end
    
    for r=1:size(image,1)
        output(r,size(image,2))=image(r,size(image,2));
    end

after = uint8(output);

end

