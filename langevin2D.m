
%Langevin方程式。
%Brown運動の2次元バージョン

STEP = 200
L = randn(1,STEP+1);     %ホワイトノイズ準備
sigma=4.3;              %sigmaはランダム項の強さ
gamma=1.2;              %gammaは摩擦係数
h=1;                    %hは時間幅。sigma,gamma,hはモデルによって適当に変化させる。
hg=h*gamma/2;           %hgが0にならないように注意。
u=0;
r=0;

for t=1:STEP
    u(t+h)=(1-hg)*(1-hg+(hg.^2)/4)*u(t)+(h/2)*(1-hg)*(L(t)+L(t+h));
    Langevin(t) = sigma*L(t) - gamma*u(t);
    
    r(t+h) = r(t)+h*u(t)+((h.^2)/2)*Langevin(t);
end

%同じもの
L2 = randn(1,STEP+1);     %ホワイトノイズ準備
u2=0;
r2=0;
for t=1:STEP
    u2(t+h)=(1-hg)*(1-hg+(hg.^2)/4)*u2(t)+(h/2)*(1-hg)*(L2(t)+L2(t+h));
    Langevin2(t) = sigma*L2(t) - gamma*u2(t);
    r2(t+h) = r2(t)+h*u2(t)+((h.^2)/2)*Langevin2(t);
end

%{
figure(1);
plot(Langevin,Langevin2);
title('Langevin Equation');
%}
%{
figure(2);
plot(u,u2);
title('Velosity of Brownian Particles');
%}

%----- 2次元でのbrown粒子の動き -------
figure(3);
plot(r,r2);
title('Potential of Brownian Particles');