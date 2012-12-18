NUMBER=80000;
%L = randn(NUMBER+1,1);
sigma=1.1;              %a�̓����_�����̋���
gamma=1.1;               %b�͖��C�W��
h=0.01;                    %h�͎��ԕ��Bsigma,gamma,h�̓��f���ɂ���ēK���ɕω�������B
hg=h*gamma/2;           %hg��0�ɂȂ�Ȃ��悤�ɒ��ӁB
r=0;
i=0;
u_memory=0;
n_memory=randn(1);
for i=1:NUMBER
    w_noise = sigma*randn(1);
    
    u=(1-hg)*(1-hg+(hg.^2))*u_memory+(h/2)*(1-hg)*(n_memory)+(w_noise);%���x�A�����l0
    
    a(i)=u;
    n_memory = w_noise;
    u_memory = u;
end

x = 1:NUMBER;
plot(x,a);