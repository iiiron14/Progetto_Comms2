clear;
close all;
clc;

bits = int8( rand(1024*10, 1) >= 0.5);
bits(bits == 1) = -1;
bits(bits == 0) = 1;
fs = 1024;

kw = kaiser(1024, 19);

src = dsp.SignalSource(bits, 1024);
plotter = timescope(SampleRate=fs, PlotType="stem");
analyzer = spectrumAnalyzer(SampleRate=fs, Method="Welch", PlotAsTwoSidedSpectrum=false, Window="kaiser", OverlapPercent=50);
plotter2 = timescope(SampleRate=fs, PlotType="stem");

while ~isDone(src)
    frame = src();
    [rx, lags] = xcorr(frame);
    plotter(frame);
    plotter2(rx);
    analyzer(frame);
    pause(0.5);
    
end

release(analyzer);
release(plotter);
release(src);