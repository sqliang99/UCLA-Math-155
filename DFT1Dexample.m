%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% For length N input vector x, the DFT is a length N vector X,
%%%    with elements
%%%
%%%               N
%%%     X(k) =   sum  x(n)*exp(-j*2*pi*(k-1)*(n-1)/N), 1 <= k <= N.
%%%              n=1
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% NOTE: NEEDS TO DEVIDE BY N


M=100;

%%% define a discrete 1D function x(i) 
for i=1:M/2
    x(i)=10;
end

for i=(M/2)+1:M
    x(i)=0;
end

plot(x,'*-'); title('the function x(i)'); 

%%% compute the 1D DFT of x(i) 
x1=fft(x); 

%%% compute the spectrum 
x2=abs(x1);

%%% plot the spectrum 
figure
plot(x2); title('spectrum of the Fourier transform of x(i)'); 


%%% multiply the original function by (-1)^i 
for i=1:M
    w(i)=x(i)*(-1)^(i-1);
end

%%% take the DFT of w(i) 
w1=fft(w);

%%% compute its spectrum 
w2=abs(w1);

%%% plot the new spectrum 
figure 
plot(w2); title('spectrum of the Fourier transform of x(i)*(-1)^i');