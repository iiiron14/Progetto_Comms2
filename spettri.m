clear;
close all;
clc;

fs = 300;
t = (0:1/fs:3)';

y = sin(2*pi*100*t);

y2 = upsample(y, 3);

pspectrum(y2, 300*3);