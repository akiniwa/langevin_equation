%Langevin�������B
%Brown�^���̃A���S���Y��

%------- �ϐ���` -------
STEP = 20000;
L = randn(1,STEP+1);     %�z���C�g�m�C�Y����
sigma=2.6;              %�V�O�}�̓����_�����̋���
gamma=0.16;             %�K���}�͖��C�W��
h=1;                    %h�͎��ԕ��Bsigma,gamma,h�̓��f���ɂ���ēK���ɕω�������B
hg=h*gamma/2;           %hg��0�ɂȂ�Ȃ��悤�ɒ��ӁB
u=0;                    %���x�A�����l0
r=0;                    %���W�A�����l0


for t=1:20000
    u(t+h)=(1-hg)*(1-hg+(hg.^2)/4)*u(t)+(h/2)*(1-hg)*(L(t)+L(t+h));
    Langevin(t) = sigma*L(t) - gamma*u(t);
    
    r(t+h) = r(t)+h*u(t)+((h.^2)/2)*Langevin(t);
end

x=1:20000;
figure(1);
plot(x,Langevin);
title('Langevin Equation');

%------- Brown���q�̑��x -------
y=0:20000;
figure(2);
plot(y,u);
title('Velosity of Brownian Particles');

%------- Brown���q�̈ʒu�ω� -------
figure(3);
plot(y,r);
title('Potential of Brownian Particles');