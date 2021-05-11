A=imread('Fig5.08(b).jpg');
A=im2double(A);
[M,N]=size(A);
B=zeros(M,N);

Q=-1.5;
for i=2:M-2
    for j=2:N-2
        top=0;
        bottom=0;
        %loop through filter
            for x=1:3
                for y=1:3
                   top=(A(i+x-1,j+y-1)^(Q+1))+top; 
                   bottom=(A(i+x-1,j+y-1)^(Q))+bottom; 
                end
            end
        B(i,j)=top/bottom;
    end
end
figure();
imshow(B)

