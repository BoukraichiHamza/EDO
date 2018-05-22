close all
clear all

A1 = [ -1 -4 ; 1 -1];
A2 = [ 1 -4; 1 -1];
A3 = [ 1 1 ; 4 -2];
tf1 = 2*pi/sqrt(3);
tf2 = 1;

r = 0.3;
x = 0.8;
y = 0.8;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
Y = [ xunit; yunit];

figure(1)
T = 0:tf1/100:tf1;
fill(Y(1,:),Y(2,:),'g')
hold on

n = size(T,2);
Ysolution = zeros(2,n);
Sol = [];
for j = 0:n-1
    for i = 1:n
        Ysolution(:,i) =  expm(T(i)*A1)*Y(:,j+1);
    end
    Sol(j+1,:,:) = Ysolution;
end

Z = 1:10:n;
for j=Z
    Xc = [];
    Yc = [];
    for i = 1:n
        Xc = [Xc , Sol(i,1,j)];
        Yc  = [ Yc, Sol(i,2,j)];
    end
    fill(Xc,Yc,'g')
    hold on
end

for j = Z
    Ysol1 = reshape(Sol(j,1,:),1,n);
    Ysol2 = reshape(Sol(j,2,:),1,n);
    plot(Ysol1,Ysol2,'b')
    hold on
end

figure(2)
T = 0:tf1/100:tf1;
fill(Y(1,:),Y(2,:),'g')
hold on

n = size(T,2);
Ysolution = zeros(2,n);
Sol = [];
for j = 0:n-1
    for i = 1:n
        Ysolution(:,i) =  expm(T(i)*A2)*Y(:,j+1);
    end
    Sol(j+1,:,:) = Ysolution;
end

Z = 1:10:n;
for j=Z
    Xc = [];
    Yc = [];
    for i = 1:n
        Xc = [Xc , Sol(i,1,j)];
        Yc  = [ Yc, Sol(i,2,j)];
    end
    fill(Xc,Yc,'g')
    hold on
end

for j = Z
    Ysol1 = reshape(Sol(j,1,:),1,n);
    Ysol2 = reshape(Sol(j,2,:),1,n);
    plot(Ysol1,Ysol2,'b')
    hold on
end

figure(3)

r = 0.1;
x = 0.15;
y = -0.6;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
Y = [ xunit; yunit];
T = 0:tf2/100:tf2;

fill(Y(1,:),Y(2,:),'g')
hold on

n = size(T,2);
Ysolution = zeros(2,n);
Sol = [];
for j = 0:n-1
    for i = 1:n
        Ysolution(:,i) =  expm(T(i)*A3)*Y(:,j+1);
    end
    Sol(j+1,:,:) = Ysolution;
end

Z = 1:10:n;
for j=1:20:n
    Xc = [];
    Yc = [];
    for i = 1:n
        Xc = [Xc , Sol(i,1,j)];
        Yc  = [ Yc, Sol(i,2,j)];
    end
    fill(Xc,Yc,'g')
    hold on
end

for j = Z
    Ysol1 = reshape(Sol(j,1,:),1,n);
    Ysol2 = reshape(Sol(j,2,:),1,n);
    plot(Ysol1,Ysol2,'b')
    hold on
end
