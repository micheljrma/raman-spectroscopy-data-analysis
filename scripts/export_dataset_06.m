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

%% PEAK REGION

peak_region = 100:150;

raman_peak = raman_shift(peak_region);

skin_peak = skin_filtered(peak_region,:);

caffeine_peak = caffeine_filtered(peak_region,:);

%% FEATURE EXTRACTION

skin_max = max(skin_peak);
skin_mean = mean(skin_peak);
skin_area = trapz(raman_peak, skin_peak);

caffeine_max = max(caffeine_peak);
caffeine_mean = mean(caffeine_peak);
caffeine_area = trapz(raman_peak, caffeine_peak);

%% CREATE DATASET

Condition = [
    repmat("Without_Caffeine",21,1);
    repmat("With_Caffeine",21,1)
    ];

Peak_Max = [
    skin_max';
    caffeine_max'
    ];

Mean_Intensity = [
    skin_mean';
    caffeine_mean'
    ];

Peak_Area = [
    skin_area';
    caffeine_area'
    ];

Sample_ID = (1:length(Condition))';

raman_dataset = table( ...
    Sample_ID,...
    Condition,...
    Peak_Max,...
    Mean_Intensity,...
    Peak_Area);

%% EXPORT CSV

writetable(raman_dataset,...
    '../exports/raman_dataset.csv');

disp('Dataset exported successfully')