% 
% �P���ȃ����_���E�H�[�N���O���t�ŕ\���B
% 1/2�̊m����-1,+1�i�ށB
% a��0��1��\���ANUMBER�͎��s�񐔁B
% 
close all;
clear all;
NUMBER=1000;
b_memory = 0;
d=zeros(1,NUMBER);
for i=1:NUMBER
    a=randi(2,1)-1;
    if a;
        c = -0.01*randi(10,1);
    else
        
        c = 0.01*randi(10,1);
    end

    b=b_memory+c;

    b_memory=b;
    d(i)=b;
end
t=0:NUMBER-1;

bb_memory = 0;
dd=zeros(1,NUMBER);
for ii=1:NUMBER
    aa=randi(2,1)-1;
    if aa;
        cc = -0.01*randi(100,1);
    else
        
        cc = 0.01*randi(100,1);
    end

    bb=bb_memory+cc;

    bb_memory=bb;
    dd(ii)=bb;
end


plot(dd,d);
