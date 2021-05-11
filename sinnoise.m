function [output] = sinnoise(input,A,u0,v0)
    [M,N] = size(input);
    noise=zeros(M,N);
    for i= 1:M
        for j= 1:N
            noise(i,j)=A*sin((2*pi*u0*i)+(2*pi*v0*j));
        end
    end
    output=zeros(M,N);
     
    for j = 1:M
        for l=1:N
            output(j,l)=noise(j,l)+input(j,l);
        end
    end
end