clear all;clc;
x0=[1;1;1];
space1=zeros(3,4);
space1(:,1)=x0;
space2=zeros(3,4);
space2(:,1)=x0;
H=zeros(3,3);
step_len = 1;
%% (a) The simple steepest descent direction method
for k = 1:3
    [f,gradf]=fun(space1(:,k));
    space1(:,k+1)=space1(:,k)-step_len*gradf;
end
space1
%% (b) The Newton's method
for k = 1:3
    [f,gradf,H]=fun2(space2(:,k));
    space2(:,k+1)=space2(:,k)-inv(H)*gradf;
end
space2
%% (c) Confirm results analytically
syms x1 x2 x3
f=x1^2+2*x1*x2+4*x1*x3+3*x2^2+2*x2*x3+5*x3^2;
diff_x1 = diff(f,x1);
diff_x2 = diff(f,x2);
diff_x3 = diff(f,x3);
H = hessian(f,[x1,x2,x3]);
H1 = H(2,2)*H(3,3)- H(3,2)*H(2,3);
H2 = H(1,1)*H(3,3)- H(3,1)*H(1,3);
H3 = H(1,1)*H(2,2)- H(1,2)*H(2,1);
if H1>0 && H2>0 && H3>0
    eq1 = diff_x1 == 0;
    eq2 = diff_x2 == 0;
    eq3 = diff_x3 == 0;

    solutions = solve([eq1, eq2, eq3], [x1, x2, x3])
end




%% 