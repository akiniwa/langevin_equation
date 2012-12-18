%Langevin方程式。
%Brown運動のアルゴリズム

%------- 変数定義 -------
STEP = 20000;
L = randn(1,STEP+1);     %ホワイトノイズ準備
sigma=2.6;              %シグマはランダム項の強さ
gamma=0.16;             %ガンマは摩擦係数
h=1;                    %hは時間幅。sigma,gamma,hはモデルによって適当に変化させる。
hg=h*gamma/2;           %hgが0にならないように注意。
u=0;                    %速度、初期値0
r=0;                    %座標、初期値0


for t=1:20000
    u(t+h)=(1-hg)*(1-hg+(hg.^2)/4)*u(t)+(h/2)*(1-hg)*(L(t)+L(t+h));
    Langevin(t) = sigma*L(t) - gamma*u(t);
    
    r(t+h) = r(t)+h*u(t)+((h.^2)/2)*Langevin(t);
end

x=1:20000;
figure(1);
plot(x,Langevin);
title('Langevin Equation');

%------- Brown粒子の速度 -------
y=0:20000;
figure(2);
plot(y,u);
title('Velosity of Brownian Particles');

%------- Brown粒子の位置変化 -------
figure(3);
plot(y,r);
title('Potential of Brownian Particles');