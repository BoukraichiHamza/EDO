function [T,Y] = ode_heun(phi,time,y0,N)
h = (time(2) - time(1))/N;
tactu = time(1);
yactu = y0;

T = [tactu];
Y = [yactu];
for i = 1:N
    tactu = tactu + h;
    T = [ T , tactu];
    A = [0 0 0 ; 1/3 0 0; 0 2/3 0];
    B = [1/4 ; 0 ; 3/4];
    C = [0 ; 1/3 ; 2/3];
    yactu = schema_explicite(A,B,C,phi,h,tactu,yactu);
    Y = [ Y ; yactu];
end
end

