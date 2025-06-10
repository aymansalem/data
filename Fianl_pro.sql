-- =========================
-- DROP TABLES IF THEY EXIST
-- =========================
DROP TABLE IF EXISTS public.hbwz_nat;
DROP TABLE IF EXISTS public.version_1;
DROP TABLE IF EXISTS public.hotel_data;

-- =========================
-- TABLE: hbwz_nat
-- =========================
CREATE TABLE public.hbwz_nat (
    hotel_id VARCHAR(50),
    hotel_property VARCHAR(100),
    arrival_date DATE,
    year INT,
    arrival_months VARCHAR(10),
    seasons VARCHAR(20),
    country VARCHAR(5),
    available_rooms INT,
    room_sold INT,
    occupancy FLOAT,
    adr NUMERIC(10,2),
    revenue NUMERIC(12,2),
    market_segment VARCHAR(50),
    distribution_channel VARCHAR(50),
    to_name VARCHAR(100),
    company VARCHAR(100),
    customer_type VARCHAR(50),
    lead_time INT,
    reservation_status_date DATE,
    reservation_status VARCHAR(50)
);

ALTER TABLE hbwz_nat OWNER TO postgres;
-- Insert data into hbwz_nat
COPY public.hbwz_nat(
    hotel_id, hotel_property, arrival_date, year, arrival_months, seasons, country,
    available_rooms, room_sold, occupancy, adr, revenue, market_segment,
    distribution_channel, to_name, company, customer_type, lead_time,
    reservation_status_date, reservation_status
)
FROM 'hotel_data_synthetic_nationality.csv'
WITH (FORMAT csv, HEADER true);

-- =========================
-- TABLE: version_1
-- =========================
CREATE TABLE public.version_1 (
    hotel_id VARCHAR,
    hotel_property VARCHAR,
    arrival_date VARCHAR,
    year VARCHAR,
    arrival_months VARCHAR,
    seasons VARCHAR,
    country VARCHAR,
    ttl_rooms VARCHAR,
    sold1 VARCHAR,
    room_sold VARCHAR,
    occupancy VARCHAR,
    adr VARCHAR,
    adr_modifier VARCHAR,
    revenue VARCHAR,
    relocation VARCHAR,
    room_ob VARCHAR,
    revenue_ob VARCHAR,
    relocation_rev VARCHAR,
    market_segment VARCHAR,
    distribution_channel VARCHAR,
    to_name VARCHAR,
    company VARCHAR,
    customer_type VARCHAR,
    lead_time VARCHAR,
    reservation_status_date VARCHAR,
    reservation_status VARCHAR,
    projected_pick_up VARCHAR
);
ALTER TABLE version_1 OWNER TO postgres;
-- Insert data into version_1
COPY public.version_1(
    hotel_id, hotel_property, arrival_date, year, arrival_months, seasons, country,
    ttl_rooms, sold1, room_sold, occupancy, adr, adr_modifier, revenue, relocation,
    room_ob, revenue_ob, relocation_rev, market_segment, distribution_channel,
    to_name, company, customer_type, lead_time, reservation_status_date,
    reservation_status, projected_pick_up
)
FROM 'Verision-06-Lead-date.csv'
WITH (FORMAT csv, HEADER true);


-- =========================
-- TABLE: hotel_data
-- =========================
CREATE TABLE public.hotel_data (
    hotel_id INT,
    hotel_name VARCHAR(255),
    arrival_date DATE,
    arrival_year INT,
    arrival_month VARCHAR(20),
    booking_date DATE,
    lead_time INT,
    booking_type VARCHAR(50),
    demand_type VARCHAR(50),
    room_sold INT,
    room_available INT,
    occupancy NUMERIC(5,2),
    room_revenue NUMERIC(10,2),
    adr NUMERIC(10,2),
    revpar NUMERIC(10,2),
    market_segment VARCHAR(50),
    country VARCHAR(50)
);
ALTER TABLE hotel_data OWNER TO postgres;

-- Insert data into hotel_data
COPY public.hotel_data(
    hotel_id, hotel_name, arrival_date, arrival_year, arrival_month, booking_date,
    lead_time, booking_type, demand_type, room_sold, room_available, occupancy,
    room_revenue, adr, revpar, market_segment, country
)
FROM 'Hotel-Bookings.csv'
WITH (FORMAT csv, HEADER true);

-- =========================
-- TABLE: hotel.dat
-- =========================


CREATE TABLE hotel.dat (
    hotel_id VARCHAR,
    hotel_property VARCHAR,
    arrival_date VARCHAR,
    year VARCHAR,
    arrival_months VARCHAR,
    seasons VARCHAR,
    country VARCHAR,
   available_Rooms VARCHAR,
    room_sold VARCHAR,
    occupancy VARCHAR,
    adr VARCHAR,
    market_segment VARCHAR,
    distribution_channel VARCHAR,
    to_name VARCHAR,
    company VARCHAR,
    revenue VARCHAR,
    customer_type VARCHAR,
    lead_time VARCHAR,
    reservation_status_date VARCHAR,
    reservation_status VARCHAR,
    projected_pick_up VARCHAR
);


COPY public.hotel.dat(
    hotel_id, hotel_property, arrival_date, year, arrival_months, seasons,
    country , available_Rooms, room_sold, room_sold, room_available, occupancy,
    adr, market_segment, distribution_channel, to_name, company, revenue, customer_type, lead_time, reservation_status_date, reservation_status, projected_pick_up
)
FROM 'hotel.data.csv'
WITH (FORMAT csv, HEADER true);