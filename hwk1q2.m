%% hwk1 q2
r=0:255;
%since I set grey level to 256, here k=L/2 is 128
y5=stretching(128,5);
y20=stretching(128,20);
y40=stretching(128,40);
y100=stretching(128,100);
plot(r,y5)
hold on
plot(r,y20)
plot(r,y40)
plot(r,y100)
legend({'E=5','E=20','E=40','E=100'},'Location','southwest')
function y = stretching(k,E)
y = zeros(256,1)
for r = 1:256
  y(r,1)=1/(1+((k/(r-1))^E));
end
end