-- Drop table if exists
DROP TABLE squirrel_data;

-- Create table and view column datatypes
CREATE TABLE squirrel_data (
	X DEC,
	Y DEC,
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
	Above_Ground_Sighter_Measurement INT, 
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
	Other_Interactions BOOLEAN, 
	Lat_Long VARCHAR
);

SELECT * 
FROM squirrel_data;