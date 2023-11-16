# DWBI
Data Warehouse and Business Intelligence
![image](https://github.com/Javen05/DWBI/assets/107395637/4cf95a5b-a453-44f6-8695-d0f2f4ff1c9f)


## Takeaway from Project:
Through this project, I learnt to design a star schema for storing data in a format that enables intuitive usage and analysis. I also learnt to use stored procedures for updating SCDs in my dimension tables and using an SQL script to import data from CSV files, along with learning a new ETL tool, Alteryx, for data cleaning and transformation. Finally, I understood how to extract insights and generate actionable recommendations from data, and present them effectively to business stakeholders to help them make informed business decisions.

## About Project:
### CASE SCENARIO 
You are part of a new data analytics team within an established online retail company. The company aims to leverage big data and analytics to establish a Data Warehouse, enhancing its business intelligence capabilities.
Having recognized the advantages of data warehousing, the company has decided to create a data warehouse to provide business intelligence and improve overall business performance. Your manager has assigned you and your team to work on the Data Warehousing and Business Intelligence project, utilizing the company's historical transactional data and customer database.
Your manager expects the team to collaborate in building a Data Warehouse using MySQL Workbench. However, for the Business Intelligence aspect, he prefers each team member to focus on a specific country. Additionally, the manager wants to explore the features of Alteryx and wishes for the Business Intelligence to be developed using the Alteryx Designer.
The manager has expressed an interest in viewing performance metrics on a monthly, weekly, and daily basis. Furthermore, Incorporating supplier information into the Business Intelligence would enhance its completeness.
During a preliminary meeting, your manager had provided you with a transactional dataset and customer demographic data. He also shared several potential insights he hopes to uncover through the Data Warehousing project:
1.	Identify the best and worst-performing products.
2.	Analyze the sales trends of our products across different time periods (day, week, month).
3.	Develop a data-driven plan to increase sales performance.
4.	Identify any missed opportunities.
5.	Examine the variations in product sales across different countries.
6.	Identify seasonal or periodic patterns in product sales.
7.	Identify cross-selling and upselling opportunities based on customer purchase patterns.
   
### Group
1. Design a data warehouse using star schema format for the company.
2. Perform data transformations on datasets using Alteryx, to prepare the datasets before loading relevant data into the data warehouse.
3. Load data into the tables of the data warehouse.

### Individual
1. Extract data from data warehouse.
2. Create visualizations that reveals insights and allow stakeholders understand the business performance from the data.
3. Submit a report to present visualizations and insights of business.

### About files:
Alteryx Workflows
> files that end with .yxmd

STAR SCHEMA
> design of data warehouse schema
> 
CREATE DATA WAREHOUSE
> for creating the data warehouse

saved procedures
> for updating SCD columns

Load_into_schema
> for loading the transformed datasets created by Alteryx into the data warehouse

## Project Specifications:

###	Dataset
The provided dataset, derived from the Online Retail transactions Dataset on Kaggle [https://www.kaggle.com/datasets/abhishekrp1517/online-retail-transactions-dataset], contains comprehensive information about customer transactions conducted on the company's online retail platform. It encompasses details such as the purchased products, quantity of each product, transaction date and time, product prices, unique customer identifiers, and the respective countries of the customers. Additionally, a separate Excel file named “Customers”,containing customer demographic data, sourced and modified from the KPMG Data Analytics Virtual Internship Dataset on Kaggle [https://www.kaggle.com/datasets/sudiptog81/kpmg-virtual-internship], is provided.
 
###	PROJECT DELIVERABLES 

The deliverables are based on the case scenario described in Section 2. 
Group Report (20 marks) 
a.	Designing the Data Warehouse using the Star Schema:
For the Data Warehouse design, you will follow the star schema approach, incorporating one fact table and at least three dimension tables. One of the dimension tables will be the customer dimension, which can be created using the provided customer demographic dataset. The team will create the remaining dimension tables.
The following guidelines should be adhered to:
•	Utilize a single star schema.
•	Include one fact table and a minimum of three dimension tables.
•	Ensure the customer dimension table is created using the customer demographic dataset.
•	Clearly label all table names, attributes, primary keys (PK), and foreign keys (FK).
•	Suffix the attribute names of primary keys with "(PK)" and foreign keys with "(FK)".
•	Name the dimension tables as dim_xxxxx and the fact table as fact_xxxxx.
Account for slowly changing dimensions (SCD) to accommodate changes across historical records.

b.	 Drawing the Star Schema with MySQL Workbench:
The star schema should be visually represented using MySQL Workbench, showcasing the structure and relationships of the fact table and dimension tables.

Individual Report (60 marks)
a.	Designing and Performing the ETL Process:
To perform the ETL process, follow these steps:
•	Obtain a random sample of 200,000 records from the transactional dataset.
•	Use the first five digits of your admission number as the random seed for the sampling process.
•	Utilize the random generation function available in Excel's data analysis tools to conduct the sampling task.
•	Use Alteryx to load data from various data sources (MySQL,XML,EXCEL,CSV,DataStax etc.) into the schema design submitted in the group report.
•	Implemnt SCD in some of the dimension tables.
•	Ensure your ETL process differs from your peers' processes.
•	Each team member should select a different country to focus on for their Business Intelligence work.


b.	Creating Visualizations with Alteryx for the Chosen Country:
Using Alteryx, create visualizations specific to the country you have chosen. These visualizations should be tailored to provide insights related to the identified Business Intelligence statements.
c.	Documenting Data Sources, ETL Packages, and Explaining Transformation and Blending:
In the report, include screen captures of your data sources and ETL packages. Explain the transformations and blending techniques employed during the ETL process. Provide a clear understanding of how the data was prepared and integrated into the schema design.
