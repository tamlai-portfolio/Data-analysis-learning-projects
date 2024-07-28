-- 1. Count the customer base based on customer type to identify current customer preferences and sort them in descending order. 
SELECT cust_type, COUNT(*) FROM Customer GROUP BY cust_type ORDER BY COUNT(*) DESC;

-- 2. Count the customer base based on their status of payment in descending order.  
SELECT payment_status, COUNT(*) FROM payment_details GROUP BY payment_status ORDER BY COUNT(*) DESC;

-- 3. Count the customer base based on their payment mode in descending order of count.  
SELECT payment_mode, COUNT(*) FROM payment_details GROUP BY payment_mode ORDER BY COUNT(*) DESC;

-- 4. Count the customers as per shipment domain in descending order.  
SELECT sd_domain, COUNT(customer_cust_id) FROM shipment_details GROUP BY sd_domain ORDER BY COUNT(customer_cust_id) DESC;

-- 5. Count the customer according to service type in descending order of count.  
SELECT sd_type, COUNT(customer_cust_id) FROM shipment_details GROUP BY sd_type ORDER BY COUNT(customer_cust_id) DESC;

-- 6. Explore employee count based on the designation-wise count of employees' IDs in descending order.  
SELECT emp_designation, COUNT(*) FROM employee_details GROUP BY emp_designation ORDER BY COUNT(*) DESC;

-- 7. Branch-wise count of employees for efficiency of deliveries in descending order.  
SELECT emp_branch, COUNT(*) FROM employee_details GROUP BY emp_branch ORDER BY COUNT(*) DESC;

-- 8. Finding C_ID, M_ID, and tenure for those customers whose membership is over 10 years.  
SELECT cust_id, m_id, (EXTRACT(YEAR FROM end_date) -EXTRACT(YEAR FROM start_date)) AS tenure FROM customer c 
LEFT JOIN membership m ON m.m_id = c.membership_m_id WHERE (EXTRACT(YEAR FROM end_date) -EXTRACT(YEAR FROM start_date)) >= 10;

-- 9. Considering average payment amount based on customer type having payment mode as COD in descending order.  
SELECT cust_type, ROUND(AVG(amount),2)::text::money FROM customer c
JOIN payment_details p ON c.cust_id = p.shipment_client_c_id
GROUP BY cust_type;

-- 10. Calculate the average payment amount based on payment mode where the payment date is not null.  
SELECT payment_mode, ROUND(AVG(amount),2)::text::money FROM payment_details WHERE payment_date IS NOT NULL GROUP BY payment_mode;

-- 11. Calculate the average shipment weight based on payment_status where shipment content does not start with "H." 
SELECT payment_status, ROUND(AVG(sd_weight::numeric),2) AS average_weight FROM payment_details p 
JOIN shipment_details s ON p.shipment_sh_id = s.sd_id WHERE sd_content NOT LIKE 'H%' GROUP BY payment_status;

-- 12. Retrieve the names and designations of all employees in the 'NY' E_Branch. 
SELECT emp_name, emp_designation FROM employee_details WHERE emp_branch = 'NY';

-- 14. Find the membership start and end dates for customers with 'Paid' payment status. 
SELECT cust_name, membership_m_id FROM customer c
JOIN membership m ON c.membership_m_id = m.m_id
JOIN payment_details p ON c.cust_id = p.shipment_client_c_id
WHERE payment_status = 'PAID';

-- 15. List the clients who have made 'Card Payment' and have a 'Regular' service type. 
SELECT cust_name, cust_id FROM customer c
JOIN shipment_details s ON c.cust_id = s.sd_id
JOIN payment_details p ON p.shipment_sh_id = s.sd_id
WHERE payment_mode = 'CARD PAYMENT' AND sd_type = 'Regular';

-- 16. Calculate the average shipment weight for each shipment domain (International and Domestic). 
SELECT sd_domain, ROUND(AVG(sd_weight::numeric),2) FROM shipment_details GROUP BY sd_domain;

-- 17. Identify the shipment with the highest charges and the corresponding client's name. 
SELECT cust_name, MAX(sd_charges) FROM customer c 
JOIN shipment_details s ON s.customer_cust_id = c.cust_id GROUP BY cust_id ORDER BY MAX(sd_charges) DESC LIMIT 1;

-- 18. Count the number of shipments with the 'Express' service type that are yet to be delivered. 
SELECT COUNT(sd_id) FROM shipment_details s
JOIN emp_shipment es ON s.sd_id = es.shipment_sh_id
JOIN status st ON st.sh_id = es.status_sh_id
WHERE current_st = 'NOT DELIVERED' AND sd_type = 'Express';

-- 19. List the clients who have 'Not Paid' payment status and are based in 'CA'. 
SELECT * FROM customer c 
JOIN payment_details p ON p.shipment_client_c_id = c.cust_id
WHERE cust_addr LIKE '%CALIFORNIA%' AND payment_status = 'NOT PAID';

-- 20. Retrieve the current status and delivery date of shipments managed by employees with the designation 'Delivery Boy'. 
SELECT current_st, delivery_date FROM status st 
JOIN emp_shipment es ON es.status_sh_id = st.sh_id
JOIN employee_details e ON e.emp_id = es.employee_e_id
WHERE emp_designation = 'Delivery Boy';

-- 21. Find the membership start and end dates for customers whose 'Current Status' is 'Not Delivered'
SELECT m_id, start_date, end_date FROM membership m 
JOIN customer c ON m.m_id = c.membership_m_id
JOIN shipment_details s ON s.customer_cust_id = c.cust_id
JOIN emp_shipment es ON es.shipment_sh_id = s.sd_id
JOIN status st ON st.sh_id = es.status_sh_id
WHERE current_st = 'NOT DELIVERED';