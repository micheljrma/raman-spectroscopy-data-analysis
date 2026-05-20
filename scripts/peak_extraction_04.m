clc;
clear;
close all;

%% LOAD DATA

skin_data = readmatrix('../raw_data/Original_Skin_633nm.xlsx');

caffeine_data = readmatrix('../raw_data/Original_Skin_Caffeine_633nm.xlsx');

%% EXTRACT RAMAN SHIFT

raman_shift = skin_data(1,2:end)';

%% EXTRACT INTENSITY

skin_intensity = skin_data(2:end,2:end);

caffeine_intensity = caffeine_data(2:end,2:end);

%% BASELINE CORRECTION

skin_corrected = msbackadj(raman_shift, skin_intensity');

caffeine_corrected = msbackadj(raman_shift, caffeine_intensity');

%% SIGNAL SMOOTHING

skin_filtered = sgolayfilt(skin_corrected,3,13);

caffeine_filtered = sgolayfilt(caffeine_corrected,3,13);

%% PEAK REGION SELECTION

peak_region = 100:150;

raman_peak = raman_shift(peak_region);

skin_peak = skin_filtered(peak_region,:);

caffeine_peak = caffeine_filtered(peak_region,:);

%% PLOT PEAK REGION

figure;

plot(raman_peak, skin_peak);

xlabel('Raman Shift (cm^{-1})');
ylabel('Intensity');

title('Skin Peak Region');

grid on;

figure;

plot(raman_peak, caffeine_peak);

xlabel('Raman Shift (cm^{-1})');
ylabel('Intensity');

title('Caffeine Skin Peak Region');

grid on;