close all
clear all

A1 = [ -1 -4 ; 1 -1];
A2 = [ 1 -4; 1 -1];
A3 = [ 1 1 ; 4 -2];
tf = 2*pi/sqrt(3);

figure(1)
affiche_stab( [0,tf],A1, 0.3, 0.8, 0.8,100, 10, 10)
 
figure(2)
affiche_stab( [0,tf],A2, 0.3, 0.8, 0.8,100, 10, 10)

figure(3)
affiche_stab( [0,1],A3, 0.1, 0.15, -0.6,100, 10, 20)


