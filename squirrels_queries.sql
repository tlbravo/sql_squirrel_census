-- Drop table if exists
DROP TABLE squirrel_data;

-- Create table and view column datatypes
CREATE TABLE squirrel_data (
	X DECIMAL,
	Y DECIMAL,
	Unique_Squirrel_ID VARCHAR, 
	Hectare VARCHAR, 
	Shift VARCHAR,
	Date_found INT,
	Hectare_Squirrel_Number Int,
	Age VARCHAR, 
	Primary_Fur_Color VARCHAR, 
	Highlight_Fur_Color VARCHAR,
	Combination_of_Primary_and_Highlight_Color VARCHAR,
	Color_notes VARCHAR, 
	Location_found VARCHAR,
	Above_Ground_Sighter_Measurement VARCHAR, 
	Specific_Location VARCHAR, 
	Running BOOLEAN,
	Chasing BOOLEAN,
	Climbing BOOLEAN, 
	Eating BOOLEAN, 
	Foraging BOOLEAN,
	Other_Activities VARCHAR,
	Kuks BOOLEAN,
	Quaas BOOLEAN, 
	Moans BOOLEAN, 
	Tail_flags BOOLEAN,
	Tail_twitches BOOLEAN, 
	Approaches BOOLEAN, 
	Indifferent BOOLEAN, 
	Runs_from BOOLEAN, 
	Other_Interactions VARCHAR, 
	Lat_Long VARCHAR
);

COPY squirrel_data
FROM 'C:\Users\Public\2018_Central_Park_Squirrel_Census_-_Squirrel_Data_20240503.csv'
WITH (FORMAT CSV, HEADER);


SELECT * 
FROM squirrel_data;

--What was the date for the highest number of sightings?
SELECT Date_found,
COUNT(Unique_Squirrel_ID) AS squirrel_count
FROM squirrel_data
GROUP BY Date_found 
ORDER BY squirrel_count DESC;
--434 squirrels were recorded on 10/13/28

SELECT age,
COUNT(Location_found) AS location_count
FROM squirrel_data
GROUP BY age;
--There were mostly adults found vs juveniles. There are about 110 rows where the volunteer couldn't determine the age.

--Removing rows where the age information is blank or '?'.
DELETE FROM squirrel_data 
WHERE age IS NULL OR age ='?'; 