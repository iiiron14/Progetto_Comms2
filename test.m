clear;
close all;
clc;

an = rand(1, 10) > 0.5;
g = [ones(1, 50) zeros(1, 50)];

s = kron(an, g);
figure;
plot(s);
ylabel("s(t)");

[rxTau, lags] = xcorr(s);
figure;
plot(lags, rxTau);
ylabel("rxTau");

gf = fft(rxTau);
figure;
plot(abs(gf));
ylabel("G(f)");