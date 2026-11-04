--? USE and SET ---------------------------------------------------------------
USE fixpoint_group4;

SET
    GLOBAL local_infile = 1;

--? INSERT ---------------------------------------------------------------

LOAD DATA LOCAL INFILE
'C:/Users/Disa/Documents/GRIT/MySql_BE26/Group2/Assets/customers_raw.csv'
INTO TABLE customers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(customer_id,customer_name,@email,phone,@city)
SET email = NULLIF(@email, '');

LOAD DATA LOCAL INFILE 'C:/Users/Disa/Documents/GRIT/MySql_BE26/Group2/Assets/devices_raw.csv'
INTO TABLE devices
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(devices_id,customer_id,brand,model,@serial_model)
SET serial_model = NULLIF(@serial_model, '');

LOAD DATA LOCAL INFILE 'C:/Users/Disa/Documents/GRIT/MySql_BE26/Group2/Assets/parts_raw.csv'
INTO TABLE parts
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(part_id,part_name,unit_price_sek);

LOAD DATA LOCAL INFILE 'C:/Users/Disa/Documents/GRIT/MySql_BE26/Group2/Assets/technicians_raw.csv'
INTO TABLE technicians
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(technicians_id,technicians_name,email,specialty);

LOAD DATA LOCAL INFILE 'C:/Users/Disa/Documents/GRIT/MySql_BE26/Group2/Assets/repair_jobs_raw.csv'
INTO TABLE repair_jobs
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(job_id,devices_id,@technicians_id,@customer_name,@device_brand,fault_description,status,@labor_cost_sek)
SET 
    technicians_id = NULLIF(@technicians_id, ''),
    labor_cost_sek = NULLIF(@labor_cost_sek, '');

LOAD DATA LOCAL INFILE 'C:/Users/Disa/Documents/GRIT/MySql_BE26/Group2/Assets/job_parts_raw.csv'
INTO TABLE job_parts
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(job_id,part_id,@part_name,quantity);