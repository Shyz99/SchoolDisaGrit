--?--------------------------------------------------------------------------
--? A. Visa serviceärenden med kund, enhet och ansvarig tekniker.
--? Om ingen tekniker är tilldelad ska ärendet fortfarande kunna visas.
--?--------------------------------------------------------------------------
--* Select from VIEW TABEL
SELECT
    *
FROM
    service_tickets
ORDER BY
    customer_name,
    status;

--* Select from TABELS
SELECT
    rj.job_id,
    c.customer_name,
    d.brand,
    d.model,
    t.technicians_name
FROM
    repair_jobs AS rj
    JOIN devices AS d ON rj.devices_id = d.devices_id
    JOIN customers AS c ON d.customer_id = c.customer_id
    LEFT JOIN technicians AS t ON rj.technicians_id = t.technicians_id;

--?--------------------------------------------------------------------------
--? B. Visa antalet ärenden per tekniker. Även en tekniker utan ärenden ska synas med antalet noll.
--?--------------------------------------------------------------------------
--* COUNT(r.job_id) gör så att tekniker utan ett jobb kommer få 0
SELECT
    t.technicians_id,
    t.technicians_name,
    COUNT(r.job_id) AS repair_jobs
FROM
    technicians AS t
    LEFT JOIN repair_jobs AS r ON r.technicians_id = t.technicians_id
GROUP BY
    t.technicians_id,
    t.technicians_name
ORDER BY
    repair_jobs DESC;

--?--------------------------------------------------------------------------
--? C. Visa vilka reservdelar som hör till varje serviceärende och hur många av
--? varje del som används.
--* Shows all data even if it is NULL data
SELECT
    r.job_id,
    p.part_name,
    j.quantity
FROM
    repair_jobs AS r
    LEFT JOIN job_parts AS j ON j.job_id = r.job_id
    LEFT JOIN parts AS p ON p.part_id = j.part_id
ORDER BY
    r.job_id;

--* Sets all NULLs to 'NO PART' or 0
SELECT
    r.job_id,
    COALESCE(p.part_name, 'NO PART') AS part_name,
    COALESCE(j.quantity, 0) AS quantity
FROM
    repair_jobs AS r
    LEFT JOIN job_parts AS j ON j.job_id = r.job_id
    LEFT JOIN parts AS p ON p.part_id = j.part_id
ORDER BY
    r.job_id;

--?--------------------------------------------------------------------------
--?--------------------------------------------------------------------------
--? D. Räkna antalet ärenden per status och använd HAVING för att visa statusar med minst två ärenden.
--* Select from VIEW TABEL
SELECT
    status,
    COUNT(*) AS number_of_jobs
FROM
    service_tickets
GROUP BY
    status
HAVING
    COUNT(status) >= 2
ORDER BY
    status;

--* Select from TABEL
SELECT
    status,
    COUNT(*) AS total_jobs
FROM
    repair_jobs
GROUP BY
    status
HAVING
    COUNT(*) >= 2;

--?--------------------------------------------------------------------------
--?--------------------------------------------------------------------------
--? E. Visa genomsnittlig arbetskostnad per tekniker med AVG. Välj en lämplig avrundning.
--* Only counts the labor_cost_sek and not the labor_cost_sek + (part_cost_sek*quantity)
--* In this fictional senario: Its because the customer only pays for the labor cost and not the part cost, the part cost is covered by the company
SELECT
    t.technicians_id,
    t.technicians_name,
    ROUND(AVG(rj.labor_cost_sek), 2) AS average_labor_cost
FROM
    technicians AS t
    JOIN repair_jobs AS rj ON t.technicians_id = rj.technicians_id
GROUP BY
    t.technicians_id,
    t.technicians_name;

--?--------------------------------------------------------------------------
--?--------------------------------------------------------------------------