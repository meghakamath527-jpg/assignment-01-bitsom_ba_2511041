Storage Systems

The system uses multiple specialized storage solutions to handle diverse healthcare data efficiently. A relational OLTP database (such as PostgreSQL) is used for storing real-time patient records, appointments, and transactional updates, ensuring strong consistency and fast reads/writes for operational use. For real-time ICU monitoring data, a time-series database like TimescaleDB or InfluxDB is chosen because it is optimized for high-frequency writes and time-based queries, making it ideal for storing vitals such as heart rate and oxygen levels.

A data lake (e.g., Amazon S3) is used to store raw data in its native format, including structured records, semi-structured logs, and unstructured doctor notes. This allows flexibility and scalability for future AI use cases. For reporting and analytics, a data warehouse (such as Snowflake or BigQuery) is used, where cleaned and transformed data is stored in a structured format optimized for complex queries. This supports monthly reporting like bed occupancy and department costs.

For AI capabilities, historical data from the data lake and warehouse is used to train a machine learning model for predicting patient readmission risk. Additionally, an NLP model is deployed to allow doctors to query patient history in natural language by translating queries into structured database queries.

OLTP vs OLAP Boundary

The OLTP system consists of the hospital’s operational database, where live patient interactions, treatments, and updates occur. This system prioritizes speed, consistency, and transactional integrity. The OLAP boundary begins once data is extracted from the OLTP system and moved into the data lake or data warehouse through ETL pipelines.

In this design, the data lake acts as a staging and archival layer, while the data warehouse serves as the primary OLAP system for analytics and reporting. All heavy analytical queries, such as monthly reporting or trend analysis, are executed in the warehouse, ensuring that the OLTP system remains unaffected by resource-intensive workloads.

Trade-offs

A key trade-off in this design is increased architectural complexity due to the use of multiple storage systems (OLTP database, data lake, warehouse, and time-series database). While this improves performance and scalability, it also introduces challenges in data consistency, maintenance, and cost management.

To mitigate this, a unified data governance and orchestration layer (using tools like Airflow or DBT) can be implemented to manage data pipelines and ensure consistency across systems. Additionally, adopting a lakehouse approach in the future could reduce complexity by combining data lake and warehouse functionalities into a single platform, simplifying data management while retaining analytical performance.