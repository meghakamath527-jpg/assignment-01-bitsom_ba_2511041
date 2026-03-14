## Anomaly Analysis
**Insert Anomaly**: If the company wants to add a new product (compass) to the system but they have no order placed , it cannot be inserted into the table because the table requires, for `eg., order_id, customer_id.` A new product cannot be added without creating a fake order.

**Update Anomaly**: If the same data is in multiple sheets, you must update all of them. Missing one update can cause incorrect results. For  `Eg., Sales representative SR01 (Deepak Joshi) appears with two different office addresses.` Though it is not completely different if we had to update the office address we may lead to misses/inconsistencies. 

**Delete Anomaly**: Deleting an order may remove the only record of a product. `For eg., Product name: Webcam, deleting this entry, will result in data loss.`
