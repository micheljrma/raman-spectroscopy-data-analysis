clc;
clear;
close all;

%% LOAD DATASET

raman_dataset = readtable('../exports/raman_dataset.csv');

%% DISPLAY FIRST ROWS

head(raman_dataset)

%% BOXPLOT - PEAK MAX

figure;

boxchart(categorical(raman_dataset.Condition),...
    raman_dataset.Peak_Max);

xlabel('Condition');
ylabel('Peak Maximum Intensity');

title('Peak Maximum Comparison');

grid on;

%% BOXPLOT - PEAK AREA

figure;

boxchart(categorical(raman_dataset.Condition),...
    raman_dataset.Peak_Area);

xlabel('Condition');
ylabel('Peak Area');

title('Peak Area Comparison');

grid on;

%% HISTOGRAM

figure;

histogram(raman_dataset.Peak_Max);

xlabel('Peak Maximum');

ylabel('Frequency');

title('Peak Maximum Distribution');

grid on;

%% SCATTER PLOT

figure;

scatter(raman_dataset.Peak_Max,...
    raman_dataset.Peak_Area);

xlabel('Peak Maximum');

ylabel('Peak Area');

title('Peak Max vs Peak Area');

grid on;