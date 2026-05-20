clc;
clear;
close all;

%% LOAD DATA

skin_data = readmatrix('../raw_data/Original_Skin_633nm.xlsx');

caffeine_data = readmatrix('../raw_data/Original_Skin_Caffeine_633nm.xlsx');

%% EXTRACT RAMAN SHIFT

raman_shift = skin_data(1,2:end);

%% EXTRACT INTENSITY

skin_intensity = skin_data(2:end,2:end);

caffeine_intensity = caffeine_data(2:end,2:end);

%% CHECK SIZE

disp(size(raman_shift))
disp(size(skin_intensity))

%% PLOT RAW SPECTRA

figure;

plot(raman_shift, skin_intensity');

xlabel('Raman Shift (cm^{-1})');
ylabel('Intensity');

title('Raw Skin Raman Spectra');

grid on;

figure;

plot(raman_shift, caffeine_intensity');

xlabel('Raman Shift (cm^{-1})');
ylabel('Intensity');

title('Raw Caffeine Skin Raman Spectra');

grid on;