A=imread('Fig4.45(a).jpg');
[M N] = size(A); 
A=double(A);

after=shifting(A);

F=fft2(after);

FH=GHF(F,25);

g=real(ifft2(FH));
g=shifting(g);

figure()
image(g); colormap(gray(256));
title('Guassian Lowpass');

function FH=GHF(F,D0)
    [M,N]=size(F);
    % we need a distance function D(u,v)
    D=@(u,v,M,N) sqrt( (u-M/2)^2+ (v-N/2)^2 );
    
    FH=zeros(M,N);
    for u=1:M
        for v=1:N
            FH(u,v) = F(u,v)*(1-exp(-(D(u,v,M,N))^2/(2*(D0^2))));
        end
    end
end

function g=shifting(f)
    g=zeros(size(f));
    for x=1:size(f,1)
        for y=1:size(f,2)
            g(x,y) = f(x,y)*(-1)^(x+y);
        end
    end
end
