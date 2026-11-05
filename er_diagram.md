## JOB_PARTS:

Uses `part_id` and `job_id` as a combined primary key to work as a junction table.
M:M relation, several parts for several repair jobs.

## REPAIR_JOBS:

Removed `customer_name` since it already exists in `CUSTOMERS`
`device_brand` is removed because it already exists in `device_id`
Quantity is `NULL`, part quantity can be 0.

## CUSTOMER:

Tried adding first och last name but decided to use `customer_name` for now. Can be discussed with the company.
Removed city-column with the reasoning that it is unnecessary, should probably be discussed with the company.
`phone` and `email` is `UNIQUE` to be different for every customer.
1:M relation, one customer can have several devices.

## TECHNICIANS:

Tried adding first och last name but decided to use `customer_name` for now. Can be discussed with the company.
1:M relation, one technician can have multiple `repair_jobs`.
Email is `UNIQUE`.
Specialty is `NULL`, a technician doesn’t need a specialty.

## DEVICES:

serial_model is `UNIQUE`.
1:M Relation, one device can have several repair jobs.

```mermaid
erDiagram

CUSTOMERS ||--o{ DEVICES : owner
DEVICES ||--o{ REPAIR_JOBS : has
TECHNICIANS o|--o{ REPAIR_JOBS : assigned
REPAIR_JOBS ||--o{ JOB_PARTS : uses
PARTS ||--o{ JOB_PARTS : uses


CUSTOMERS {
    INT customer_id PK "AUTO INCREMENT"
    VARCHAR(100) customer_name "NOT NULL"
    VARCHAR(100) email UK "NOT NULL"
    VARCHAR(20) phone UK "NOT NULL"
}

DEVICES {
    INT device_id PK "AUTO INCREMENT"
    INT customer_id FK "NOT NULL"
    VARCHAR(50) brand "NOT NULL"
    VARCHAR(80) model "NOT NULL"
    VARCHAR(100) serial_model UK "NOT NULL"
}

JOB_PARTS {
    INT job_id FK "NOT NULL"
    INT part_id FK "NOT NULL"
    INT quantity "NULL"
}

PARTS {
    INT part_id PK "AUTO INCREMENT"
    VARCHAR(50) part_name "NOT NULL"
    INT unit_price_sek "NOT NULL"
}


REPAIR_JOBS {
    INT job_id PK "AUTO INCREMENT"
    INT device_id FK "NOT NULL"
    INT technician_id FK "NOT NULL"
    VARCHAR(100) fault_description "NOT NULL"
    VARCHAR(50) status "NULL"
    INT labor_cost_sek "NOT NULL"
}

TECHNICIANS {
    INT technician_id PK "AUTO INCREMENT"
    VARCHAR(100) technician_name "NOT NULL"
    VARCHAR(100) email UK "NOT NULL"
    VARCHAR(50) speciality "NULL"
}

```
