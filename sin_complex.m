clear;
clc;
close all;

% 1. Definizione del Dominio
x = linspace(0, 2*pi, 1000);
y = linspace(0, 2*pi, 1000);
[X, Y] = meshgrid(x, y);
Z = X + 1i*Y;

% 2. Calcolo della Funzione Complessa
W = sin(Z);

% 3. Definizione della Maschera Logica con Tolleranza
Tolleranza = 1e-10; 
% Condizione: Re(W) > 1 E |Im(W)| < Tolleranza
maschera = (real(W) > 1) & (abs(imag(W)) < Tolleranza); 

% 4. Creazione delle Superfici Mascherate
Re_W_masked = real(W);
Im_W_masked = imag(W);

% Assegna NaN dove la maschera è falsa
Re_W_masked(~maschera) = NaN;
Im_W_masked(~maschera) = NaN;


figure;

% --- Subplot 1: Parte Reale mascherata ---
subplot(2, 1, 1);
surf(X, Y, Re_W_masked);
xlabel('Re(z) (x)');
ylabel('Im(z) (y)');
zlabel('Re(f(z))');
title('Parte Reale di sin(z) (dove Re(W) > 1 e Im(W) \approx 0)');
view(3); 
shading interp; 
axis tight; 
camlight; % Aggiunge luce per una migliore visualizzazione

% --- Subplot 2: Parte Immaginaria mascherata ---
subplot(2, 1, 2);
surf(X, Y, Im_W_masked); 
xlabel('Re(z) (x)');
ylabel('Im(z) (y)');
zlabel('Im(f(z))'); 
title('Parte Immaginaria di sin(z) (dove Re(W) > 1 e Im(W) \approx 0)');
view(3);
shading interp;
axis tight;
camlight;