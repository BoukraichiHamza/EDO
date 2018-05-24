Ns = [30 40 80 100];
option = [ 10 , 40 , 1e-6];
t0 = 0;
tf = 1.5;
y0 = 10;
figure(1)
for i = 1:length(Ns)
    N = Ns(i);
    subplot(2,2,i)
    [Te,Ye] = ode_euler(@phi1,[t0,tf],y0,N);
    [Tr,Yr] = ode_runge(@phi1,[t0,tf],y0,N);
    [Th,Yh] = ode_heun(@phi1,[t0,tf],y0,N);
    [Tr4,Yr4] = ode_rk41(@phi1,[t0,tf],y0,N);
    [Tr42,Yr42] = ode_rk42(@phi1,[t0,tf],y0,N);
    option(1) = N;
    [Tfp,Yfp,nphi,ifail] = ode_gauss_fp(@phi1,[t0 tf],y0,option);
    plot(Te,Ye,'b')
    hold on
    plot(Tr,Yr,'k')
    hold on
    plot(Th,Yh,'y')
    hold on
    plot(Tr4,Yr4,'g')
    hold on
    plot(Tr42,Yr42,'m')
    hold on
    plot(Tfp,Yfp,'r')
    hold on
    legend('euler','runge','heun','rk41','rk42','gauss\_fp')
end

figure(2)
Ns = [floor(50*tf/1.974) floor(50*tf/1.875) 50 100];
option = [ 10 , 40 , 1e-6];
t0 = 0;
tf = 1.5;
y0 = 0;

for i = 1:length(Ns)
    N = Ns(i);
    subplot(2,2,i)
    [Te,Ye] = ode_euler(@phi2,[t0,tf],y0,N);
    [Tr,Yr] = ode_runge(@phi2,[t0,tf],y0,N);
    [Th,Yh] = ode_heun(@phi2,[t0,tf],y0,N);
    [Tr4,Yr4] = ode_rk41(@phi2,[t0,tf],y0,N);
    [Tr42,Yr42] = ode_rk42(@phi2,[t0,tf],y0,N);
    option(1) = N;
    [T,Y,nphi,ifail] = ode_gauss_fp(@phi2,[t0 tf],y0,option);
    plot(Te,Ye,'b')
    hold on
    plot(Tr,Yr,'k')
    hold on
    plot(Th,Yh,'y')
    hold on
    plot(Tr4,Yr4,'g')
    hold on
    plot(Tr42,Yr42,'m')
    hold on
    plot(T,Y,'r')
    hold on
    legend('euler','runge','heun','rk41','rk42','gauss\_fp')
end





