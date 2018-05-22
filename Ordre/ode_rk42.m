function [T,Y] = ode_rk42(phi,time,y0,N)
h = (time(2) - time(1))/N;
tactu = time(1);
yactu = y0;

T = [tactu];
Y = [yactu];
for i = 1:N
    tactu = tactu + h;
    T = [ T , tactu];
    A = [0 0 0 0; 1/3 0 0 0; 0-1/3 1 0 0 ; 1 -1 1 0];
    B = [1/8 ; 3/8 ; 3/8 ; 1/8];
    C = [0 ; 1/3; 2/3; 1];
    yactu = schema_explicite(A,B,C,phi,h,tactu,yactu);
    Y = [ Y ; yactu];
end
end

