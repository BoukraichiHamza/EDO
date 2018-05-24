function  [] = affiche_stab( tspan,mat, r, x, y,pas, pascourbe, pascercle)

t0 = tspan(1);
tf = tspan(2);
T = t0:tf/pas:tf;

th = 0:2*pi/pas:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
Y = [ xunit; yunit];

fill(Y(1,:),Y(2,:),'g')
hold on

n = size(T,2);
Ysolution = zeros(2,n);
Sol = [];
for j = 0:n-1
    for i = 1:n
        Ysolution(:,i) =  expm(T(i)*mat)*Y(:,j+1);
    end
    Sol(j+1,:,:) = Ysolution;
end

Z = 1:pascercle:n;
for j=Z
    Xc = [];
    Yc = [];
    for i = 1:n
        Xc = [Xc , Sol(i,1,j)];
        Yc  =[ Yc, Sol(i,2,j)];
    end
    fill(Xc,Yc,'g')
    hold on
end
Z = 1:pascourbe:n;
for j = Z
    Ysol1 = reshape(Sol(j,1,:),1,n);
    Ysol2 = reshape(Sol(j,2,:),1,n);
    plot(Ysol1,Ysol2,'b')
    hold on
end