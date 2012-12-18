
%Langevin�������B
%Brown�^����2�����o�[�W����

STEP = 200
L = randn(1,STEP+1);     %�z���C�g�m�C�Y����
sigma=4.3;              %sigma�̓����_�����̋���
gamma=1.2;              %gamma�͖��C�W��
h=1;                    %h�͎��ԕ��Bsigma,gamma,h�̓��f���ɂ���ēK���ɕω�������B
hg=h*gamma/2;           %hg��0�ɂȂ�Ȃ��悤�ɒ��ӁB
u=0;
r=0;

for t=1:STEP
    u(t+h)=(1-hg)*(1-hg+(hg.^2)/4)*u(t)+(h/2)*(1-hg)*(L(t)+L(t+h));
    Langevin(t) = sigma*L(t) - gamma*u(t);
    
    r(t+h) = r(t)+h*u(t)+((h.^2)/2)*Langevin(t);
end

%��������
L2 = randn(1,STEP+1);     %�z���C�g�m�C�Y����
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

%----- 2�����ł�brown���q�̓��� -------
figure(3);
plot(r,r2);
title('Potential of Brownian Particles');