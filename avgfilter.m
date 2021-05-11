function [after] = avgfilter(image,m)
a=(m-1)/2;
mm=m.^2;
output=uint8(zeros(size(image)));
%since we leave the borders unchanged, so we can leave out some borders
for i=(1+a):(size(image,1)-a)
    for j=(1+a):(size(image,2)-a)
        sum=0;
        for x=i-a:i+a
            for y=j-a:j+a
                tmp=image(x,y);
                tmp=int32(tmp);
                sum = sum + tmp;
                sum=int32(sum);
            end
        end
        output(i,j)=ceil(sum/mm);
    end
end

%now we replace the border values

for r=1:a
    for c=1:size(image,2)
    output(r,c)=image(r,c);
    end
end

for r=size(image,1)-a:size(image,1)
    for c=1:size(image,2)
        output(r,c)=image(r,c);
    end
end

for r=a+1:size(image,1)-a-1
    for c=size(image,2)-a:size(image,2)
        output(r,c)=image(r,c);
    end
end

for r=a+1:size(image,1)-a-1
    for c=1:a
        output(r,c)=image(r,c);
    end
end

after=uint8(output);
end

