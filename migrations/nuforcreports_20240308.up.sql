CREATE TABLE nuforc_reports (
    id BIGSERIAL PRIMARY KEY,
    summary VARCHAR(135),
    country VARCHAR(50),
    city VARCHAR(60),
    state VARCHAR(38),
    date_time TIMESTAMP WITHOUT TIME ZONE,
    shape VARCHAR(9),
    duration VARCHAR(25),
    stats VARCHAR(702),
    report_link VARCHAR(57),
    "text" TEXT,
    posted TIMESTAMP WITHOUT TIME ZONE,
    city_latitude DOUBLE PRECISION,
    city_longitude DOUBLE PRECISION,
    received_at TIMESTAMP WITHOUT TIME ZONE DEFAULT current_timestamp
)
;
