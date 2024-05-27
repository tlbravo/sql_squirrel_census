-- Drop table if exists
DROP TABLE squirrel_data;

-- Create table and view column datatypes
CREATE TABLE squirrel_data (
	X DECIMAL,
	Y DECIMAL,
	Unique_Squirrel_ID VARCHAR(25), 
	Hectare VARCHAR(3), 
	Shift VARCHAR(2),
	Date_found INTEGER,
	Hectare_Squirrel_Number INTEGER,
	Age VARCHAR(20), 
	Primary_Fur_Color VARCHAR(30), 
	Highlight_Fur_Color VARCHAR(50),
	Combination_of_Primary_and_Highlight_Color VARCHAR(50),
	Color_notes VARCHAR(50), 
	Location_found VARCHAR(100),
	Above_Ground_Sighter_Measurement VARCHAR(20), 
	Specific_Location VARCHAR(50), 
	Running BOOLEAN,
	Chasing BOOLEAN,
	Climbing BOOLEAN, 
	Eating BOOLEAN, 
	Foraging BOOLEAN,
	Other_Activities VARCHAR(50),
	Kuks BOOLEAN,
	Quaas BOOLEAN, 
	Moans BOOLEAN, 
	Tail_flags BOOLEAN,
	Tail_twitches BOOLEAN, 
	Approaches BOOLEAN, 
	Indifferent BOOLEAN, 
	Runs_from BOOLEAN, 
	Other_Interactions VARCHAR(50), 
	Lat_Long VARCHAR(100)
);

COPY squirrel_data
FROM 'C:\Users\Public\2018_Central_Park_Squirrel_Census_-_Squirrel_Data_20240503.csv'
WITH (FORMAT CSV, HEADER);


SELECT * 
FROM squirrel_data;

SELECT age,
COUNT(Location_found) AS location_count
FROM squirrel_data
GROUP BY age;
--There were mostly adults found vs juveniles. There are about 110 rows where the volunteer couldn't determine the age.

--Removing rows where the age information is blank or '?'.
DELETE FROM squirrel_data 
WHERE age IS NULL OR age ='?'; 


--What was the date for the highest number of sightings?
SELECT Date_found,
COUNT(Unique_Squirrel_ID) AS squirrel_count
FROM squirrel_data
GROUP BY Date_found 
ORDER BY squirrel_count DESC
LIMIT 1;
--400 squirrels were recorded on 10/13/18

--Most squirrel sightings occured during the PM hours for both adults and juveniles.
SELECT shift, age, COUNT (shift) AS am_or_pm
FROM squirrel_data
GROUP BY shift, age;

--Most squirrels were found on the ground plane.
SELECT location_found, COUNT (age) AS age_count
FROM squirrel_data
GROUP BY location_found;

--Which squirrels are more willing to approach humans, and in which areas?
SELECT unique_squirrel_id, location_found, approaches
FROM squirrel_data
WHERE approaches = 'true'
ORDER BY location_found;
--most squirrels who approached humans were found on the ground plane. makes sense.

--Do squirrels who approach humans eat more frequently?
SELECT unique_squirrel_id, location_found, approaches, eating
FROM squirrel_data
WHERE approaches = 'true' AND eating = 'false'
ORDER BY location_found;
--more squirrels who approached humans were not found eating

--Primary fur color counts
SELECT primary_fur_color, count( primary_fur_color) AS color
FROM squirrel_data
GROUP BY primary_fur_color
ORDER BY primary_fur_color;

--Exploring what sounds did the squirrels make most often when observed 
SELECT COUNT(*) AS Kuks_count
FROM squirrel_data
WHERE Kuks = 'true';
--90 kuks

SELECT COUNT(*) AS Quaas_count
FROM squirrel_data
WHERE Quaas = 'true';
--45 quaas

SELECT COUNT(*) AS Moans_count
FROM squirrel_data
WHERE Moans = 'true';
--2 moans

--Comparing squirrel sounds per unique squirrel id
SELECT unique_squirrel_id, 
    SUM(CASE WHEN Kuks = 'true' THEN 1 ELSE 0 END) AS Kuks_count, 
    SUM(CASE WHEN Quaas = 'true' THEN 1 ELSE 0 END) AS Quaas_count, 
    SUM(CASE WHEN Moans = 'true' THEN 1 ELSE 0 END) AS Moans_count
FROM squirrel_data
GROUP BY unique_squirrel_id;

