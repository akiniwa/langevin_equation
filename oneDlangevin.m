NUMBER=80000;
%L = randn(NUMBER+1,1);
sigma=1.1;              %aはランダム項の強さ
gamma=1.1;               %bは摩擦係数
h=0.01;                    %hは時間幅。sigma,gamma,hはモデルによって適当に変化させる。
hg=h*gamma/2;           %hgが0にならないように注意。
r=0;
i=0;
u_memory=0;
n_memory=randn(1);
for i=1:NUMBER
    w_noise = sigma*randn(1);
    
    u=(1-hg)*(1-hg+(hg.^2))*u_memory+(h/2)*(1-hg)*(n_memory)+(w_noise);%速度、初期値0
    
    a(i)=u;
    n_memory = w_noise;
    u_memory = u;
end

x = 1:NUMBER;
plot(x,a);