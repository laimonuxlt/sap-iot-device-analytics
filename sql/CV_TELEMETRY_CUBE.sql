-- Average value by site and device for humidity, pressure and temperature
SELECT 
	"SITE_NAME",
	"DEVICE_ID",
	"METRIC_NAME",
	AVG(AVG_METRIC_VALUE) AS "AVG_VALUE",
	"UNIT_OF_MEASURE"
FROM "CV_TELEMETRY_CUBE"
GROUP BY 
	"SITE_NAME",
	"DEVICE_ID",
	"METRIC_NAME",
	"UNIT_OF_MEASURE"
ORDER BY "SITE_NAME" ASC; 

--  Average, ninimum ir maximum values per site in October  2026 
SELECT 
	"SITE_NAME",
	"YEAR",
	"MONTH",
	"METRIC_NAME",
	"UNIT_OF_MEASURE",
	AVG("AVG_METRIC_VALUE") AS "AVG_VALUE",
	MIN("MIN_METRIC_VALUE") AS MIN_VALUE,
	MAX("MAX_METRIC_VALUE") AS MAX_VALUE
FROM "CV_TELEMETRY_CUBE"
WHERE "YEAR" = 2026
	AND "MONTH" = 10
GROUP BY 
	"SITE_NAME",
	"YEAR",
	"MONTH",
	"METRIC_NAME",
	"UNIT_OF_MEASURE";

--Metric trends (hourly averages for 24 hours) fixed date  used as  samle data is  no current
SELECT 
	"SITE_NAME",
	"METRIC_NAME",
	"UNIT_OF_MEASURE",
	"HOUR",
	AVG("AVG_METRIC_VALUE") AS "HOURLY_AVG_VALUE"
FROM "CV_TELEMETRY_CUBE"
WHERE "CALENDAR_DATE" = '2026-09-10'
GROUP BY 
	"SITE_NAME",
	"METRIC_NAME",
	"UNIT_OF_MEASURE",
	"HOUR"
ORDER BY 
	"SITE_NAME" ASC, 
	"METRIC_NAME" ASC, 
	"HOUR" ASC;
