NUMBER=100;
sigma=3.0;              
gamma=1.8;               
beta=gamma/((sigma.^2));
h=0.1;                    
u_memory=0;
n_memory=sigma*randn(1);

haba=0.01;
U=-8:haba:8;

r_memory=0;

%--- Langevin algorithm (Ermak's method)

for i=1:NUMBER
  
    u=u_memory*exp(-gamma*h)+(1/gamma)*(1-exp(-gamma*h))*0+sqrt((1/beta)*(1-exp(-2*gamma*h)))*randn(1);
    
    r=r_memory+(1/gamma)*(1-exp(-gamma*h))*u_memory+randn(1)*sqrt(h*i*(1/beta)*(1/(gamma*h))*(2-(1/(gamma*h))*(3-4*exp(gamma*h)+exp(-2*gamma*h))));
    
    a(i)=u;         %配列の中に速度uを代入。
    u_memory = u;   %次の式で利用するので、u_memoryに格納する。
    
    b(i)=r;         %配列の中に座標rを代入。
    r_memory = r;   %次の式で利用するので、r_memoryに格納する。
end


%--- Gaussian distribution
%{
 f = (sqrt(beta/(2*pi))*exp((-beta*(U.^2))/2));
 plot(U,f,'r');
 grid on;
hold on;
%}

%--- histogram  potential 
figure(2);
i=1:NUMBER;
plot(i,a,'g');
grid on;
% legend('S=1.0,G=0.8','S=3.0,G=0.8','S=3.0,G=1.8');

%--- histogram  velocity
%{
figure(2);
V=histc(a,U)/(NUMBER*haba);
scatter(U,V,'+')
%}
%--- confirm normalization

% sum(V)*haba