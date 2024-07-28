-- create employee_details table
CREATE TABLE IF NOT EXISTS public.employee_details (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR (30),
    emp_designation VARCHAR (40),
    emp_addr VARCHAR (100),
    emp_branch VARCHAR (15),
    emp_cont_no BIGINT
);

--create status table
CREATE TABLE IF NOT EXISTS public.status (
    sh_id INT PRIMARY KEY,
    current_st VARCHAR (15),
    sent_date DATE,
    delivery_date DATE
);

-- create membership table
CREATE TABLE IF NOT EXISTS public.membership (
    m_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

-- create custom customer table
CREATE TABLE IF NOT EXISTS public.customer (
    cust_id INT PRIMARY KEY,
    membership_m_id INT,
    cust_name VARCHAR (30),
    cust_email_id VARCHAR (50),
    cust_type VARCHAR (30),
    cust_addr VARCHAR (100),
    cust_cont_no BIGINT,
    FOREIGN KEY (membership_m_id) REFERENCES public.membership(m_id)
);

--create shipment details table
CREATE TABLE IF NOT EXISTS public.shipment_details(
    sd_id INT PRIMARY KEY,
    customer_cust_id INT,
    sd_content VARCHAR (40),
    sd_domain VARCHAR (15),
    sd_type VARCHAR (15),
    sd_weight VARCHAR (10),
    sd_charges INT,
    sd_addr VARCHAR (100),
    ds_addr VARCHAR (100),
    FOREIGN KEY (customer_cust_id) REFERENCES public.customer(cust_id)
);

-- create payment details
CREATE TABLE IF NOT EXISTS public.payment_details (
    payment_id VARCHAR(36) PRIMARY KEY,
    shipment_client_c_id INT,
    shipment_sh_id INT,
    amount INT,
    payment_status VARCHAR (10),
    payment_mode VARCHAR (25),
    payment_date DATE,
    FOREIGN KEY (shipment_client_c_id) REFERENCES public.customer(cust_id),
    FOREIGN KEY (shipment_sh_id) REFERENCES public.shipment_details(sd_id)
);

-- create employee_shipment table
CREATE TABLE IF NOT EXISTS public.emp_shipment (
    employee_e_id INT,
    shipment_sh_id INT,
    status_sh_id INT,
    FOREIGN KEY (employee_e_id) REFERENCES public.employee_details(emp_id),
    FOREIGN KEY (shipment_sh_id) REFERENCES public.shipment_details(sd_id),
    FOREIGN KEY (status_sh_id) REFERENCES public.status (sh_id)
);

-- set ownership of the tables to postgres user

ALTER TABLE public.employee_details OWNER to postgres;
ALTER TABLE public.status OWNER to postgres;
ALTER TABLE public.membership OWNER to postgres;
ALTER TABLE public.customer OWNER to postgres;
ALTER TABLE public.shipment_details OWNER to postgres;
ALTER TABLE public.payment_details OWNER to postgres;
ALTER TABLE public.emp_shipment OWNER to postgres;


-- drop table
DROP TABLE employee_details, status, membership, customer, shipment_details, payment_details,emp_shipment;
DROP TABLE payment_details;


-- copy data to tables

COPY employee_details
FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Employee_Details.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY status
FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Status.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY membership
FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Membership.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY customer
FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Customer.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY shipment_details
FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Shipment_Details.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY payment_details
FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Payment_Details.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY emp_shipment
FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\employee_manages_shipment.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- configure reading permission 
\COPY employee_details FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Employee_Details.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY status FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Status.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY membership FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Membership.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY customer FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Customer.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY shipment_details FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Shipment_Details.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY payment_details FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\Payment_Details.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY emp_shipment FROM 'C:\Users\tamla_f1yewqh\OneDrive\Desktop\SQL\Projects\Logistic\datalfile\employee_manages_shipment.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
