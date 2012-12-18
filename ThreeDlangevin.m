%Langevin�������B
%Brown�^���̎O�������@�[�W����
NUMBER=500;
sigma=3.3;              %a�̓����_�����̋���
gamma=2.2;               %b�͖��C�W��
h=1;                    %h�͎��ԕ��Bsigma,gamma,h�̓��f���ɂ���ēK���ɕω�������B
hg=h*gamma/2;           %hg��0�ɂȂ�Ȃ��悤�ɒ��ӁB

L = randn(1,NUMBER+1);     %�z���C�g�m�C�Y����
u=0;
r=0;
for t=1:NUMBER
    u(t+h)=(1-hg)*(1-hg+(hg.^2)/4)*u(t)+(h/2)*(1-hg)*(L(t)+L(t+h));%���x�A�����l0
    Langevin(t) = sigma*L(t) - gamma*u(t);%v�͑��x�ALangevin
    r(t+h) = r(t)+h*u(t)+((h.^2)/2)*Langevin(t);
end
u2=0;
L2 = randn(1,NUMBER+1);     %�z���C�g�m�C�Y����
r2=0;
for t=1:NUMBER
    u2(t+h)=(1-hg)*(1-hg+(hg.^2)/4)*u2(t)+(h/2)*(1-hg)*(L2(t)+L2(t+h));%���x�A�����l0
    Langevin2(t) = sigma*L2(t) - gamma*u2(t);%v�͑��x�ALangevin
    r2(t+h) = r2(t)+h*u2(t)+((h.^2)/2)*Langevin2(t);
end
u3=0;
L3 = randn(1,NUMBER+1);     %�z���C�g�m�C�Y����
r3=0;
for t=1:NUMBER
    u3(t+h)=(1-hg)*(1-hg+(hg.^2)/4)*u3(t)+(h/3)*(1-hg)*(L3(t)+L3(t+h));%���x�A�����l0
    Langevin3(t) = sigma*L3(t) - gamma*u3(t);%v�͑��x�ALangevin
    r3(t+h) = r3(t)+h*u3(t)+((h.^2)/2)*Langevin3(t);
end

%{
figure(1);
plot3(Langevin,Langevin2,Langevin3);
title('Langevin Equation');

figure(2);
plot3(u,u2,u3);
title('Velosity of Brownian Particles');
%}
%figure(3);

%plot3(r,r2,r3);
plot(r,r2)
%title('Potential of Brownian Particles');
%grid on;

