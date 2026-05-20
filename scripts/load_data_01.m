clc;
clear;
close all;

%% LOAD RAMAN DATA

% Skin without caffeine
skin_data = readmatrix('../raw_data/Original_Skin_633nm.xlsx');

% Skin with caffeine
caffeine_data = readmatrix('../raw_data/Original_Skin_Caffeine_633nm.xlsx');

%% DISPLAY SIZE

disp('Skin data size:')
size(skin_data)

disp('Caffeine skin data size:')
size(caffeine_data)