function [T,Y,nphi,ifail] = ode_gauss_fp(phi,time,y0,option)
N = option(1);
fpitermax = option(2);
fpeps = option(3);
h = (time(2)-time(1))/N;
t0 = time(1);
T = [t0];
Y = [y0];
nphi = 0;
ifail = [];

for l = 1:N
    k1 = phi(t0+(0.5-sqrt(3)/6)*h,y0);
    k2 = phi(t0+(0.5+sqrt(3)/6)*h,y0);
    nphi = nphi + 2;
    normprog = 1;
    nbiter = 0;
    
    while(normprog>fpeps) && (nbiter < fpitermax)
        newk1 = phi(t0 + (0.5-sqrt(3)/6)*h,   y0 + h * (1/4*k1 + (1/4 - sqrt(3)/6)*k2));
        newk2 = phi(t0 + (0.5+sqrt(3)/6)*h,   y0 + h * ((1/4 + sqrt(3)/6)*k1 + 1/4 *k2));
        nphi = nphi + 2;
        normprog = norm([newk1 - k1; newk2 - k2]);
        k1 = newk1;
        k2 = newk2;
        nbiter = nbiter +1;
    end
    if (normprog>fpeps)
        ifail = [ ifail , -1];
    else
        ifail = [ifail, nbiter];
    end
    t0 = t0+h;
    y0 = y0 + h*(0.5*k1 + 0.5*k2);
    Y = [ Y ; y0];
    T = [ T t0];
end