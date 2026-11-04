--? CREATE DATABASE ---------------------------------------------------------------
CREATE DATABASE fixpoint_group4 CHARACTER
SET
    utf8mb4;

--? USE ---------------------------------------------------------------------
USE fixpoint_group4;

--? Display all ---------------------------------------------------------------
SHOW TABLES;

SELECT
    *
FROM
    customers;

SELECT
    *
FROM
    devices;

SELECT
    *
FROM
    technicians;

SELECT
    *
FROM
    repair_jobs;

SELECT
    *
FROM
    parts;

SELECT
    *
FROM
    job_parts;

--? CREATE TABLES ---------------------------------------------------------------
CREATE TABLE
    customer (
        customer_id INT NOT NULL AUTO_INCREMENT,
        customer_name VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        phone INT NOT NULL UNIQUE,
        PRIMARY KEY (customer_id)
    ) ENGINE = InnoDB;

CREATE TABLE
    devices (
        devices_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        customer_id INT NOT NULL,
        brand VARCHAR(50) NOT NULL,
        model VARCHAR(80) NOT NULL,
        serial_model VARCHAR(100) NOT NULL UNIQUE,
        FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB;

CREATE TABLE
    technicians (
        technicians_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        technicians_name VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        specialty VARCHAR(50) NULL
    ) ENGINE = InnoDB;

CREATE TABLE
    repair_jobs (
        job_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        devices_id INT NOT NULL,
        technicians_id INT NOT NULL,
        fault_description VARCHAR(100) NOT NULL,
        status VARCHAR(50) NULL,
        labor_cost_sek INT NOT NULL,
        FOREIGN KEY (devices_id) REFERENCES devices (devices_id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (technicians_id) REFERENCES technicians (technicians_id) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB;

CREATE TABLE
    parts (
        part_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        part_name VARCHAR(50) NOT NULL,
        unit_price_sek INT NOT NULL
    ) ENGINE = InnoDB;

CREATE TABLE
    job_parts (
        job_id INT NOT NULL,
        part_id INT NOT NULL,
        quantity INT NULL,
        PRIMARY KEY (job_id, part_id),
        FOREIGN KEY (job_id) REFERENCES repair_jobs (job_id) ON UPDATE CASCADE,
        FOREIGN KEY (part_id) REFERENCES parts (part_id) ON UPDATE CASCADE
    ) ENGINE = InnoDB;

--? ALTER TABLES ---------------------------------------------------------------
DELETE FROM customer;

ALTER TABLE customer
RENAME TO customers;

DELETE FROM devices;

DELETE FROM technicians;

DELETE FROM repair_jobs;

DELETE FROM parts;

DELETE FROM job_parts;

DROP VIEW service_tickets;

--? VIEW TABLES ---------------------------------------------------------------
CREATE VIEW
    service_tickets AS
SELECT
    c.customer_name,
    t.technicians_name,
    d.brand,
    d.model,
    r.status
FROM
    customers AS c
    JOIN devices AS d ON d.customer_id = c.customer_id
    JOIN repair_jobs AS r ON r.devices_id = d.devices_id
    LEFT JOIN technicians AS t ON t.technicians_id = r.technicians_id;

--?------------------------------------------------------------------------------------