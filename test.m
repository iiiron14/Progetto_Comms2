clear;
close all;
clc;

x = -10:0.01:10;
y = sinc(x);

[rxTau, lags] = xcorr(y);
plot(lags,rxTau);
%xlim([-100 100]);