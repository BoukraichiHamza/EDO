function [T,Y,nphi,ndphi,ifail] = ode_gauss_newton(phi,dphi,time,y0,option)
N = option(1);
fpitermax = option(2);
fpeps = option(3);
h = (time(2)-time(1))/N;
t0 = time(1);
T = [t0];
Y = [y0];
nphi = 0;
ndphi = 0;
ifail = [];

%% Matrice du modele de Gauss
A = [1/4 , (1/4 - sqrt(3)/6) ; (1/4 + sqrt(3)/6) , 1/4];
B = [1/2 ; 1/2];
C = [1/2 - sqrt(3)/6 ; 1/2 + sqrt(3)/6];

for l = 1:N
    %% Initialisation
    k1 = phi(t0 + C(1)*h,y0)';
    k2 = phi(t0 + C(2)*h,y0)';
    k = [ k1 ; k2 ];
    nphi = nphi + 2;
    normprog = 1;
    nbiter = 0;
    
    while(normprog>fpeps) && (nbiter < fpitermax)
        %% Calcul de F(x_k)
        gk1 =phi(t0 + C(1)*h,   y0 + h * (A(1,1)*k(1:2)' + A(1,2)*k(3:4)'))';
        gk2 =phi(t0 + C(2)*h,   y0 + h * (A(2,1)*k(1:2)' + A(2,2)*k(3:4)'))';
        Gk = [gk1  ; gk2 ];
        Fk = k - Gk;
        %% Calcul de JF(x_k)
        dgk1 =  h*dphi(t0 +C(1)*h,   y0 + h * (A(1,1)*k(1:2)' + A(1,2)*k(3:4)'));
        dgk2 =  h*dphi(t0 +C(2)*h,   y0 + h * (A(2,1)*k(1:2)' + A(2,2)*k(3:4)'));
        JFk = eye(4) - [ A(1,1)*dgk1 , A(1,2)*dgk1 ; A(2,1)*dgk2 , A(2,2)*dgk2];
        %% Mise à jour de l'itéré
        d = -JFk\Fk;
        k = k +d;
        nphi = nphi + 2;
        ndphi = ndphi + 2;
        
        %% Calcul de la norme de x_(k+1) - x_k
        normprog = norm(d);
        nbiter = nbiter +1;
    end
    
    if (normprog>fpeps)
        ifail = [ ifail , -1];
    else
        ifail = [ifail , nbiter];
    end
    %% Mise a jour de t0 et y0
    t0 = t0+h;
    y0 = y0 + h*(B(1)*k(1:2)'+B(2)*k(3:4)');
    Y = [ Y ; y0];
    T = [ T t0];
end
end
