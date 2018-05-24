t0 = 0;
tf = 6.6632868593231301896996820305;
y0 = [ 2.00861986087484313650940188 , 0];
option = [ 10 , 15 , 1e-12];
Nval = [ 120:60:1080 1200:600:10800];
Yerr_euler = [];
Yerr_runge = [];
Yerr_heun = [];
Yerr_r41 = [];
Yerr_r42 = [];
Yerr = [];
Yerrgn = [];
Lnfe = [];

for N = Nval;
    [T,Ye] = ode_euler(@phi,[t0,tf],y0,N);
    Yerr_euler = [ Yerr_euler ; abs(Ye(end,:) - y0)];
    Lnfe = [ Lnfe , log10(N)];
    [T,Yr] = ode_runge(@phi,[t0,tf],y0,N/2);
    Yerr_runge = [ Yerr_runge ; abs(Yr(end,:) - y0)];
    [T,Yh] = ode_heun(@phi,[t0,tf],y0,N/3);
    Yerr_heun = [ Yerr_heun ; abs(Yh(end,:) - y0)];
    [T,Yr4] = ode_rk41(@phi,[t0,tf],y0,N/4);
    Yerr_r41 = [ Yerr_r41 ; abs(Yr4(end,:) - y0)];
    [T,Yr42] = ode_rk42(@phi,[t0,tf],y0,N/4);
    Yerr_r42 = [ Yerr_r42 ; abs(Yr42(end,:) - y0)];
    option(1) = N/4;
    [T,Y,nphi,ifail] = ode_gauss_fp(@phi,[t0 tf],y0,option);
    Yerr = [ Yerr ; abs(Y(end,:) - y0)];
     [T,Ygn,nphi,ndphi,ifail] = ode_gauss_newton(@phi,@dphi,[t0 tf],y0,option);
    Yerrgn = [ Yerrgn ; abs(Ygn(end,:) - y0)];
    

end

figure(1)
plot(Lnfe,log10(Yerr_euler(:,1)));
hold on
plot(Lnfe,log10(Yerr_runge(:,1)));
hold on
plot(Lnfe,log10(Yerr_heun(:,1)));
hold on
plot(Lnfe,log10(Yerr_r41(:,1)));
hold on
plot(Lnfe,log10(Yerr_r42(:,1)));
hold on
plot(Lnfe,log10(Yerr(:,1)));
hold on
plot(Lnfe,log10(Yerrgn(:,1)));
title('Erreur pour x1')
legend('euler','runge','heun','rk41','rk42,gauss_fp','gauss_newton')

figure(2)
plot(Lnfe,log10(Yerr_euler(:,2)));
hold on
plot(Lnfe,log10(Yerr_runge(:,2)));
hold on
plot(Lnfe,log10(Yerr_heun(:,2)));
hold on
plot(Lnfe,log10(Yerr_r41(:,2)));
hold on
plot(Lnfe,log10(Yerr_r42(:,2)));
hold on
plot(Lnfe,log10(Yerr(:,2)));
hold on
plot(Lnfe,log10(Yerrgn(:,2)));
title('Erreur pour x2')
legend('euler','runge','heun','rk41','rk42,gauss\_fp','gauss\_newton')


N = 25;
[Te,Ye] = ode_euler(@phi,[t0,tf],y0,N);
[Tr,Yr] = ode_runge(@phi,[t0,tf],y0,N);
[Th,Yh] = ode_heun(@phi,[t0,tf],y0,N);
[Tr4,Yr4] = ode_rk41(@phi,[t0,tf],y0,N);
[Tr42,Yr42] = ode_rk42(@phi,[t0,tf],y0,N);
option = [ 25 , 15 , 1e-12];
[T,Y,nphi,ifail] = ode_gauss_fp(@phi,[t0 tf],y0,option);
[Tgn,Ygn,nphi,ndphi,ifail] = ode_gauss_newton(@phi,@dphi,[t0 tf],y0,option);

figure(3)
plot(Te,Ye(:,1))
hold on
plot(Tr,Yr(:,1))
hold on
plot(Th,Yh(:,1))
plot(Tr4,Yr4(:,1))
hold on
plot(Tr42,Yr42(:,1))
hold on
plot(T,Y(:,1))
hold on
plot(Tgn,Ygn(:,1))
hold on
title('Erreur pour x2')
legend('euler','runge','heun','rk41','rk42,gauss\_fp','gauss\_newton')

figure(4)
plot(Te,Ye(:,2))
hold on
plot(Tr,Yr(:,2))
hold on
plot(Th,Yh(:,2))
hold on
plot(Tr4,Yr4(:,2))
hold on
plot(Tr42,Yr42(:,2))
hold on
plot(T,Y(:,2))
hold on
plot(Tgn,Ygn(:,2))
legend('euler','runge','heun','rk41','rk42,gauss\_fp','gauss\_newton')

figure(5)
plot(Ye(:,1),Ye(:,2))
hold on
plot(Yr(:,1),Yr(:,2))
hold on
plot(Yh(:,1),Yh(:,2))
hold on
plot(Yr4(:,1),Yr4(:,2))
hold on
plot(Yr42(:,1),Yr42(:,2))
hold on
plot(Y(:,1),Y(:,2))
hold on
plot(Ygn(:,1),Ygn(:,2))
legend('euler','runge','heun','rk41','rk42,gauss\_fp','gauss\_newton')
