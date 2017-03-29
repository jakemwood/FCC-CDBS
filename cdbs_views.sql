CREATE VIEW fm_longitude_latitude AS
SELECT fm_eng_data.*,
	lat_deg + lat_min/60 + lat_sec/3600 AS latitude,
	lon_deg + lon_min/60 + lon_sec/3600 AS longitude
FROM fm_eng_data

CREATE VIEW call_sign_max_dates AS
	SELECT `call_sign_history`.`facility_id` AS `facility_id`,
		max(`call_sign_history`.`begin_date`) AS `begin_date`
	FROM `call_sign_history`
	GROUP BY `call_sign_history`.`facility_id`;

CREATE VIEW latest_call_signs AS
	SELECT callsign, a.facility_id
	FROM call_sign_history a
	JOIN call_sign_max_dates c ON a.facility_id=c.facility_id AND a.`begin_date`=c.begin_date
