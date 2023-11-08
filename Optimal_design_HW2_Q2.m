clear all;clc;
%% Problem 2-1.
syms x1 x2 
f=2*x1^2-3*x1*x2+8*x2^2+x1-x2;
diff_x1 = diff(f,x1);
diff_x2 = diff(f,x2);
H = hessian(f,[x1,x2]);

if det(H)>0 
    eq1 = diff_x1 == 0;
    eq2 = diff_x2 == 0;
    solutions = solve([eq1, eq2], [x1, x2])
end

f_solutions = subs(f, solutions)
%% Problem 2-2.
x0=[1;1];
space=zeros(2,6);
space(:,1)=x0;
H=zeros(2,2);
delta = 1e-6;
for k = 1:5
    [f,gradf,H]=fun3(space(:,k));
    space(:,k+1)=space(:,k)-inv(H)*gradf;

    e = norm(space(:, k + 1) - space(:, k));
    if e < delta
        break;
    end

end
space


%% Problem 2-3.
x0=[1;1];
k=10;
space2=zeros(2,k);
space2(:,1)=x0;
delta = 1e-6;

for i = 1:k
    [f, gradf] = fun4(space2(:, i));
    
    alpha_k = find_alpha_k(@fun4, space2(:, i), gradf);
    space2(:,i+1) = space2(:,i)-alpha_k*gradf;
   
    if norm(gradf) < delta
        break;
    end
end
space2

%% 