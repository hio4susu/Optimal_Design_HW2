function[f,gradf]=fun(x)
f=x(1)^2+2*x(1)*x(2)+4*x(1)*x(3)+3*x(2)^2+2*x(2)*x(3)+5*x(3)^2;
df1=2*x(1) + 2*x(2) + 4*x(3);
df2=2*x(1) + 6*x(2) + 2*x(3);
df3=4*x(1) + 2*x(2) + 10*x(3);
gradf=[df1;df2;df3];
end