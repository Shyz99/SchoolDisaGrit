```
Data removed and reasoning:

- JOB_PARTS
    -> Part_nam, Only relates to part ID and FYLL P{ SEN}

- REPAIR_JOBS
    -> removed costumer_name, cuz costrumer_name exisrs in relashion in YES FYLL P{ SEN}
    ->  device_brand is removved cuz it already exists in device_id

- CUSTOMERS
    -> city removed
```

```
Data added and reasoning:

- From name to
    -> first_name
    -> last_name

```

```mermaid
erDiagram

CUSTOMERS ||--o{ DEVICES : owner
DEVICES ||--o{ REPAIR_JOBS : has
TECHNICIANS o|--o| REPAIR_JOBS : assigned
REPAIR_JOBS ||--o{ JOB_PARTS : uses
PARTS ||--o{ JOB_PARTS : uses


CUSTOMERS {
    INT customer_id PK "AUTO INCREMENT"
    VARCHAR(50) first_name "NOT NULL"
    VARCHAR(50) last_name "NOT NULL"
    VARCHAR(100) email UK "NOT NULL"
    INT phone UK "NOT NULL"
}

DEVICES {
    INT device_id PK "AUTO INCREMENT"
    INT customer_id FK "NOT NULL"
    VARCHAR(50) brand "NOT NULL"
    VARCHAR(80) model "NOT NULL"
    VARCHAR(100) serial_model UK "NOT NULL"
}

JOB_PARTS {
    INT job_id PK "AUTO INCREMENT"
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
    VARCHAR(50) status "NOT NULL"
    INT labor_cost_sek "NOT NULL"
}

TECHNICIANS {
    INT technician_id PK "AUTO INCREMENT"
    VARCHAR(50) technician_first_name "NOT NULL"
    VARCHAR(50) technician_last_name "NOT NULL"
    VARCHAR(100) email UK "NOT NULL"
    VARCHAR(50) speciality "NULL"
}

```
