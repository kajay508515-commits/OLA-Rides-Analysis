-- OLA Rides Analysis - SQL Queries

-- 1. Booking Status Overview
SELECT `Booking Status`,
COUNT(*) AS Total_Rides,
ROUND(COUNT(*) * 100.0 / 50000, 2) AS Percentage
FROM ola_data
GROUP BY `Booking Status`
ORDER BY Total_Rides DESC;

-- 2. Vehicle Type Performance
SELECT `Vehicle Type`,
COUNT(*) AS Total_Rides,
ROUND(AVG(`Driver Ratings`), 2) AS Avg_Driver_Rating,
ROUND(AVG(`Customer Rating`), 2) AS Avg_Customer_Rating,
ROUND(AVG(`Ride Distance`), 2) AS Avg_Distance_KM
FROM ola_data
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY Total_Rides DESC;

-- 3. Revenue Analysis
SELECT `Vehicle Type`,
COUNT(*) AS Successful_Rides,
ROUND(SUM(`Booking Value`), 2) AS Total_Revenue,
ROUND(AVG(`Booking Value`), 2) AS Avg_Fare
FROM ola_data
WHERE `Booking Status` = 'Success'
GROUP BY `Vehicle Type`
ORDER BY Total_Revenue DESC;

-- 4. Cancellation Reasons by Customer
SELECT `Reason for Cancelling by Customer`,
COUNT(*) AS Total_Cancellations
FROM ola_data
WHERE `Booking Status` = 'Cancelled by Customer'
GROUP BY `Reason for Cancelling by Customer`
ORDER BY Total_Cancellations DESC;

-- 5. Peak Hours Analysis
SELECT HOUR(`Time`) AS Hour_of_Day,
COUNT(*) AS Total_Rides
FROM ola_data
GROUP BY HOUR(`Time`)
ORDER BY Total_Rides DESC;

-- 6. Top Pickup Locations
SELECT `Pickup Location`,
COUNT(*) AS Total_Pickups
FROM ola_data
WHERE `Booking Status` = 'Success'
GROUP BY `Pickup Location`
ORDER BY Total_Pickups DESC
LIMIT 10;

-- 7. Payment Method Analysis
SELECT `Payment Method`,
COUNT(*) AS Total_Rides,
ROUND(SUM(`Booking Value`), 2) AS Total_Revenue
FROM ola_data
WHERE `Booking Status` = 'Success'
GROUP BY `Payment Method`
ORDER BY Total_Rides DESC;