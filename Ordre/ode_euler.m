function [T,Y] = ode_euler(phi,time,y0,N)
h = (time(2) - time(1))/N;
tactu = time(1);
yactu = y0;

T = [tactu];
Y = [yactu];
for i = 1:N
    tactu = tactu + h;
    T = [ T , tactu];
    A = [0];
    B = [1];
    C = [0];
    yactu = schema_explicite(A,B,C,phi,h,tactu,yactu);
    Y = [ Y ; yactu];
end
end

