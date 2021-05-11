A=imread('Fig0507(b).tif');
A=im2double(A);
[M,N]=size(A);
B=zeros(M,N);

for i=2:M-2
    for j=2:N-2
        value=0;
        %loop through filter
            for x=1:3
                for y=1:3
                   value=A(i+x-1,j+y-1)+value; 
                end
            end
        B(i,j)=value/9;
    end
end
figure();
imshow(B)

O=imread('Fig0507(a).tif');
O=im2double(O);
top=0;
bottom=0;
for i=1:M
    for j=1:N
        top=top+(B(i,j)^2);
        bottom=bottom+(O(i,j)-B(i,j))^2;
    end
end

SNR=10*log10(top/bottom);
SNR
