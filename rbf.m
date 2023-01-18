clear all
x=linspace(0.1,1,20);
d=(1 + 0.6 * sin (2 * pi * x / 0.7) + 0.3 * sin (2 * pi * x)) / 2;
plot(x,d,'r*');
c1=0.2;
c2=0.9;
r1=0.15;
r2=0.15;
F1 = exp(-(x-c1).^2/(2*r1^2));
F2 = exp(-(x-c2).^2/(2*r2^2));
w1=randn(1);
w2=randn(1);
w0=randn(1);
ler=0.15;

for i=1:1000
 for   j=1:20
     y=F1(j)*w1+F2(j)*w2+w0;
     e=d(j)-y;
     if e~=0
         w1=w1+ler*e*F1(j);
         w2=w2+ler*e*F2(j);
         w0=w0+ler*e;
     end
 end
end
for i=1:20
    y(i)=F1(i)*w1+F2(i)*w2+w0;
end
