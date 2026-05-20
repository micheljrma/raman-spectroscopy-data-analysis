%Show complete dataset
SELECT *
FROM raman_data;

%Average peak intensity
SELECT Condition,
AVG(Peak_Max) AS Average_Peak
FROM raman_data
GROUP BY Condition;

%Average peak area
SELECT Condition,
AVG(Peak_Area) AS Average_Area
FROM raman_data
GROUP BY Condition;

%High intensity samples
SELECT *
FROM raman_data
WHERE Peak_Max > 500;