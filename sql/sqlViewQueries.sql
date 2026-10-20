--Query 1: Devices with anomalous readings(outside normal range)
--Quesry  returns only devices whose latest reading is outside the normal range.It leaves out offline devices, never - reported devices and failed readings, because those aren’t out - of - range readings.
SELECT 
	"DEVICE_ID",
	"DEVICE_NAME",
	"SITE_NAME",
	"METRIC_NAME",
	"METRIC_VALUE",
	"UNIT_OF_MEASURE",
	"LAST_RECORDED_DATETIME",
	"HEALTH_INDICATOR",
	"ANOMALY_DETAIL"
FROM "V_DEVICE_HEALTH"
WHERE ("SEVERITY" IN (2, 3))
ORDER BY 
	-- 2 = WARNING, 3 = CRITICAL
"SEVERITY" DESC, 
	"SITE_NAME" ASC, 
	"DEVICE_NAME" ASC;

--Query 2: Device health status and maintenance alerts
--maintenance worklist, with the worst problems first:
--offline, then never reported, then failed reading, then critical, then warning.
SELECT 
	"DEVICE_ID",
	"DEVICE_NAME",
	"DEVICE_TYPE",
	"SITE_NAME",
	"HEALTH_INDICATOR",
	"MAINTENANCE_ALERT",
	"ANOMALY_DETAIL",
	"LAST_RECORDED_DATETIME"
FROM "V_DEVICE_HEALTH"
WHERE "MAINTENANCE_ALERT" = 'YES'
ORDER BY 
	"SEVERITY" DESC, 
	"SITE_NAME" ASC, 
	"DEVICE_NAME" ASC;
