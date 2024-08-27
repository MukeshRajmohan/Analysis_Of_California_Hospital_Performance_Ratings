# Create Database
create database Healthcare;

Use Healthcare;

# Create Table for California Hospitals
CREATE TABLE `California_Hospitals` (
  `Year` varchar(50) DEFAULT NULL,
  `County` varchar(50) DEFAULT NULL,
  `Hospital` varchar(64) DEFAULT NULL,
  `OSHPDID` int DEFAULT NULL,
  `system` varchar(50) DEFAULT NULL,
  `Type of Report` varchar(50) DEFAULT NULL,
  `Performance Measure` varchar(50) DEFAULT NULL,
  `# of Adverse Events` double DEFAULT NULL,
  `# of Cases` double DEFAULT NULL,
  `Risk-adjusted Rate` double DEFAULT NULL,
  `Hospital Ratings` int DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Adverse Event Rate` double DEFAULT NULL,
  `Lat Bucket` varchar(50) DEFAULT NULL,
  `Long Bucket` varchar(50) DEFAULT NULL
);

# Calculate the total number of cases for each year
SELECT Year, SUM(`# of Cases`) AS Total_Cases
FROM California_Hospitals
GROUP BY Year;

# Hospital with the highest number of adverse events
SELECT Hospital, MAX(`# of Adverse Events`) AS Max_Adverse_Events
FROM California_Hospitals
GROUP BY Hospital
ORDER BY Max_Adverse_Events desc
LIMIT 20;

# Calculate the average risk-adjusted rate by county
SELECT County, AVG(`Risk-adjusted Rate`) AS Avg_Risk_Adjusted_Rate
FROM California_Hospitals
GROUP BY County;

# Retrieve hospitals with a high adverse event rate (greater than 5)
SELECT Hospital, `Adverse Event Rate`
FROM California_Hospitals
WHERE `Adverse Event Rate` > 5
ORDER BY `Adverse Event Rate` desc
LIMIT 20;

# Find the top-rated hospitals with a high number of cases
SELECT Hospital, 'Better' as `Hospital Ratings`, `# of Cases`
FROM California_Hospitals
WHERE `Hospital Ratings` = 3 AND `# of Cases` > 100
ORDER BY `# of Cases` desc
LIMIT 20;

# Calculate the total number of cases for each performance measure in a specific year
SELECT `Performance Measure`, SUM(`# of Cases`) AS Total_Cases
FROM California_Hospitals
GROUP BY `Performance Measure`
ORDER BY Total_Cases desc;

# Calculate the average risk-adjusted rate for each type of report
SELECT `Type of Report`, AVG(`Risk-adjusted Rate`) AS Avg_Risk_Adjusted_Rate, SUM(`# of Adverse Events`) AS Total_Adverse_Events
FROM California_Hospitals
GROUP BY `Type of Report`;

# Find hospitals with the lowest adverse event rate
SELECT Hospital, `Adverse Event Rate`
FROM California_Hospitals
WHERE `Adverse Event Rate` > 0
ORDER BY `Adverse Event Rate` ASC
LIMIT 20;

# Calculate the total number of cases for each year and county
SELECT Year, County, SUM(`# of Cases`) AS Total_Cases
FROM California_Hospitals
GROUP BY Year, County;

# Retrieve hospitals with a high number of adverse events and a low hospital rating
SELECT Hospital, `# of Adverse Events`,'Worse' as `Hospital Ratings`
FROM California_Hospitals
WHERE `# of Adverse Events` > 5 AND `Hospital Ratings` = 1
ORDER BY `# of Adverse Events` desc
LIMIT 20;

# Retrieve hospitals with a high number of cases and a low risk-adjusted rate
SELECT Hospital, `# of Cases`, `Risk-adjusted Rate`
FROM California_Hospitals
WHERE `# of Cases` > 50 AND `Risk-adjusted Rate` < 10
ORDER BY `# of Cases` desc, `Risk-adjusted Rate`
LIMIT 20;

# Find the counties with the highest average adverse event rates
SELECT County, AVG(`Adverse Event Rate`) AS Avg_Adverse_Event_Rate
FROM California_Hospitals
GROUP BY County
ORDER BY Avg_Adverse_Event_Rate DESC
LIMIT 20;

# Hospitals with a low hospital rating and a high risk-adjusted rate
SELECT Hospital,'Worse' as `Hospital Ratings`, `Risk-adjusted Rate`
FROM California_Hospitals
WHERE `Hospital Ratings` < 2 AND `Risk-adjusted Rate` > 15
ORDER BY `Risk-adjusted Rate` desc
LIMIT 20;

# Find the hospitals located in a specific bucket of latitude and longitude
SELECT COUNT(DISTINCT Hospital), `Lat Bucket`, `Long Bucket`
FROM California_Hospitals
GROUP BY `Lat Bucket`, `Long Bucket`;

# Calculate the average adverse event rate for hospitals in each latitude and longitude bucket
SELECT `Lat Bucket`, `Long Bucket`, AVG(`Adverse Event Rate`) AS Avg_Adverse_Event_Rate
FROM California_Hospitals
GROUP BY `Lat Bucket`, `Long Bucket`;

# Calculate the average hospital ratings in each latitude and longitude bucket
SELECT `Lat Bucket`, `Long Bucket`, AVG(`Hospital Ratings`) AS Average_Hospital_Rating
FROM California_Hospitals
GROUP BY `Lat Bucket`,`Long Bucket`
ORDER BY Average_Hospital_Rating desc;

# How does the number of adverse cases for specific medical conditions vary between different hospitals in California?
SELECT Hospital, `Performance Measure`, SUM(`# of Adverse Events`) AS Total_Adverse_Cases
FROM California_Hospitals
WHERE `Performance Measure` = 'HEART FAILURE'
GROUP BY Hospital, `Performance Measure`
LIMIT 20;

# What is the relationship between hospital performance and geographical location, and how might this 
# information inform healthcare resource allocation?

SELECT County, AVG(`Hospital Ratings`) AS Average_Hospital_Rating, `Lat Bucket`, `Long Bucket`
FROM California_Hospitals
GROUP BY County,`Lat Bucket`,`Long Bucket`;

# Have hospital performance measures for each report gotten better or worse over time, and if they have, what reasons could explain this?
SELECT `Year`, `Performance Measure`, AVG(`Risk-adjusted Rate`) AS Average_Risk_Adjusted_Rate
FROM California_Hospitals
GROUP BY `Year`, `Performance Measure`
ORDER BY `Performance Measure` desc,`Year`;