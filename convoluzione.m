clear;
close all;
clc;

t =  -5:0.01:4.99;
T = 200;
dt = 0.01;
% pratica
r = zeros(1,1000);
r(1, 500-T:499+T) = 1;
e = exp(-t);
e(t < 0) = 0;

c = conv(r, e, "same")*dt;


T = T*dt;

% teorica
re_conv = zeros(size(t));
idx1 = (t>=-T) & (t<T);
re_conv(idx1) = 1-exp(-(t(idx1) + T));
idx2=t>=T;
re_conv(idx2) = exp(T-t(idx2))-exp(-(T+t(idx2)));

figure
subplot(2,1,1);
plot(t,c);
subplot(2,1,2);
plot(t, re_conv);