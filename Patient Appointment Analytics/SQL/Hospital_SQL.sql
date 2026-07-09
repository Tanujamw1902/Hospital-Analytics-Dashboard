CREATE DATABASE data_analytics_projects;

USE data_analytics_projects;

SELECT DATABASE();

SHOW TABLES;

SELECT * FROM clean_hospital LIMIT 5;

SELECT * FROM clean_hospital;

SELECT * FROM clean_hospital LIMIT 5;

SELECT patient_id, department, total_bill FROM clean_hospital LIMIT 5;

SELECT DISTINCT department FROM clean_hospital;

SELECT * FROM clean_hospital WHERE emergency_case = 1;

SELECT * FROM clean_hospital WHERE department = 'Cardiology';

SELECT * FROM clean_hospital WHERE department = 'Cardiology' OR department = 'Neurology';

SELECT patient_id, total_bill FROM clean_hospital ORDER BY total_bill DESC;

SELECT patient_id, risk_score FROM clean_hospital ORDER BY risk_score DESC;

SELECT patient_id, risk_score FROM clean_hospital ORDER BY risk_score DESC LIMIT 10;

SELECT COUNT(*) FROM clean_hospital;

SELECT SUM(total_bill) FROM clean_hospital;

SELECT AVG(waiting_time_minutes) FROM clean_hospital;

SELECT MIN(total_bill) FROM clean_hospital;

SELECT MAX(total_bill) FROM clean_hospital;

SELECT department, COUNT(*) AS Total_Patients FROM clean_hospital GROUP BY department;

SELECT department, ROUND(AVG(total_bill),2) AS Avg_Bill FROM clean_hospital GROUP BY department;

SELECT department, ROUND(AVG(waiting_time_minutes),2) AS Avg_Waiting FROM clean_hospital GROUP BY department;

SELECT department, COUNT(*) AS Patients FROM clean_hospital GROUP BY department HAVING COUNT(*) > 1000;

SELECT department, ROUND(AVG(total_bill),2) AS Avg_Bill FROM clean_hospital GROUP BY department HAVING AVG(total_bill) > 8000;

SELECT COUNT(*) AS Total_Patients,
    ROUND(AVG(waiting_time_minutes),2) AS Avg_Waiting_Time FROM clean_hospital;
    
SELECT patient_id, risk_score,
    CASE WHEN risk_score >= 8 THEN 'High Risk'
        WHEN risk_score >= 5 THEN 'Medium Risk'
        ELSE 'Low Risk' END AS Risk_Category FROM clean_hospital;

SELECT Risk_Category, COUNT(*) AS Patients
FROM(SELECT
        CASE WHEN risk_score >= 8 THEN 'High Risk'
            WHEN risk_score >= 5 THEN 'Medium Risk'
            ELSE 'Low Risk' END AS Risk_Category FROM clean_hospital) AS t GROUP BY Risk_Category;
            
SELECT CURDATE() AS Today;

SELECT NOW() AS Current_Date_Time;

SELECT YEAR(CURDATE()) AS Current_Year;

SELECT patient_id, total_bill FROM clean_hospital
	WHERE total_bill >(SELECT AVG(total_bill) FROM clean_hospital);

SELECT patient_id, waiting_time_minutes FROM clean_hospital
	WHERE waiting_time_minutes >(SELECT AVG(waiting_time_minutes) FROM clean_hospital);

SELECT patient_id, patient_satisfaction_score FROM clean_hospital
	WHERE patient_satisfaction_score >(SELECT AVG(patient_satisfaction_score) FROM clean_hospital);
    
CREATE VIEW High_Risk_Patients AS
	SELECT patient_id, risk_score, department FROM clean_hospital WHERE risk_score >= 8;

SELECT * FROM High_Risk_Patients;

SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';

SELECT department, ROUND(AVG(waiting_time_minutes),2) AS Avg_Waiting
	FROM clean_hospital GROUP BY department HAVING AVG(waiting_time_minutes) > 30;

DESCRIBE clean_hospital;

SELECT department, ROUND(AVG(waiting_time_minutes), 2) AS Avg_Waiting
	FROM clean_hospital GROUP BY department HAVING AVG(waiting_time_minutes) > 30;

SELECT department, ROUND(SUM(total_bill), 2) AS Total_Hospital_Bill
	FROM clean_hospital GROUP BY department ORDER BY Total_Hospital_Bill DESC LIMIT 5;

SELECT satisfaction_level, COUNT(*) AS Total_Patients
	FROM clean_hospital GROUP BY satisfaction_level ORDER BY Total_Patients DESC;

SELECT emergency_case, ROUND(AVG(total_bill), 2) AS Average_Total_Bill
	FROM clean_hospital GROUP BY emergency_case;

