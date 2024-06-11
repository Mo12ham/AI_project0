clear all
clc
i=0.022;
b=0.5e-3;
kb=1.2;
kt=1.2;
r=2.45;
l=0.035;
syms x1 x2 x3 x ty y lmis u sys
[X1,X2,X3]=solve(x1==0,x2-7811.38*x3==0,x3+0.00685*x2==0)
j=jacobian([x2;-b/i*x2+kt/i*x3;-kb/l*x2-r/l*x3],[x1,x2,x3])
a=subs(j,{x1,x2,x3},{0,0,0})
eig(a)
t=0:0.1:10;
u=1*t;
A=[0 1 0;0 -b/i kt/i;0 -kb/l -r/l];
B=[0;0;1/l];
C=[1 0 0;0 1 0];
D=[0;0];
sys=ss(A,B,C,D)
[y,ty,x]=lsim(sys,u,t)
plot(x(:,1),x(:,2))