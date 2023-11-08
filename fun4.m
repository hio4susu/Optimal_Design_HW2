function[f,gradf]=fun4(x)
f=2*x(1)^2-3*x(1)*x(2)+8*x(2)^2+x(1)-x(2);
df1=4*x(1) - 3*x(2) + 1;
df2=16*x(2) - 3*x(1) - 1;
gradf=[df1;df2];
end


