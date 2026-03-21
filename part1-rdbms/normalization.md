## Anomaly Analysis
**Insert Anomaly**: If the company wants to add a new product (compass) to the system but they have no order placed , it cannot be inserted into the table because the table requires, for `eg., order_id, customer_id.` A new product cannot be added without creating a fake order.

**Update Anomaly**: If the same data is in multiple sheets, you must update all of them. Missing one update can cause incorrect results. For  `Eg., Sales representative SR01 (Deepak Joshi) appears with two different office addresses.` Though it is not completely different if we had to update the office address we may lead to misses/inconsistencies. 

**Delete Anomaly**: Deleting an order may remove the only record of a product. `For eg., Product name: Webcam, deleting this entry, will result in data loss.`

## Normalisation Justification

The dataset originally stored all order, customer, product, and sales
representative information in a single table. This created redundancy
because customer details such as name and city were repeated for
every order placed by the same customer.

For eg.,if a customer from placed five orders, their
details would appear five times in the table. This leads to update
anomalies where changing the customer’s city would require updating
multiple rows.

To solve this, the dataset was normalized to Third Normal Form (3NF).
Customer information was separated into a Customers table, product
details into a Products table, and order transactions into Orders and
Order tables. Sales representatives were also stored in a
separate table.

This design reduces redundancy, improves data consistency, and allows
efficient updates without affecting records.

