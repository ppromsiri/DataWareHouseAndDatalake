# **Data warehouse**

<img src="https://images.squarespace-cdn.com/content/v1/603409d67a6eba1a0befdfb9/1655807062239-CJNOW2JHGLOTP612L6AW/What+is+a+Data+Warehouse.png?format=2500w">

image from: [What is a Data Warehouse --- Computerisation Limited](https://computerisation.co.uk/blog/what-is-a-data-warehouse)

# Data Warehouse คืออะไร?

- **Data Warehouse**:
 คลังข้อมูลที่รวมข้อมูลจากแหล่งข้อมูลหลากหลายที่มีโครงสร้างแบบรวมศูนย์
- **ลักษณะเฉพาะ**:
  - Subject Oriented
  - Integrated
  - Nonvolatine
  - Time-variant

# ความสำคัญของ Data Warehousing

- **OLTP** vs. **OLAP**
  - Online Transactional Processing (OLTP): **Operational data keeping**
  - Online Analytical Processing (OLAP): **Analytical decision making**
- **สนับสนุนการตัดสินใจ**: วิเคราะห์ข้อมูล เพื่อเป็นพื้นฐานในการตัดสินใจ
- **การรวมข้อมูล**: รวบรวมข้อมูลจากแหล่งต่างๆ เพื่อให้มุมมองที่รวมศูนย์
- **การวิเคราะห์แนวโน้ม**: ช่วยในการวิเคราะห์แนวโน้มจากข้อมูลในอดีต เพื่อการวางแผน

# แนวคิดของ Data Warehouse

<img src="https://www.ssp.sh/brain/Enterprise%20Data%20Warehouse%20Modeling%20Inmon%20vs%20Star%20Schema%20Kimball%20vs%20data%20vault%20modeling%20and%20OBT.png">

image from: [Inmon vs Kimball: Data Warehousing Approaches](https://www.ssp.sh/brain/inmon-vs-kimball/)

### Bill Inmon

- **แนวทาง**: เน้นโครงสร้างที่มีการทำให้เป็น highly normalized
- **โครงสร้างข้อมูล**: เริ่มต้นด้วย Core ที่สอดคล้องกับระบบต้นทาง และทำให้เป็น highly normalized structure
- **ข้อดี**: ลดการซ้ำซ้อนของข้อมูล
- **ข้อเสีย**: ซับซ้อนในการจัดการและต้องการการออกแบบที่ละเอียด

### Ralph Kimball

- **แนวทาง**: เริ่มต้นด้วยพื้นที่จัดเตรียมข้อมูล (Staging Area) และใช้ Star Schema
- **โครงสร้างข้อมูล**: ใช้ Core ที่มีการทำ Denormalized (Star Schema)
 ใช้งานผ่าน Data Mart
- **ข้อดี**: ง่ายต่อการวิเคราะห์ข้อมูลและการใช้งาน
- **ข้อเสีย**: อาจมีการซ้ำซ้อนของข้อมูล

### Data Vault

- **แนวทาง**: เน้นการเก็บข้อมูลในรูปแบบที่สามารถขยายได้
- **โครงสร้างข้อมูล**: ใช้ Hub, Link และ Satellite
- **ข้อดี**: ยืดหยุ่นและสามารถขยายได้ง่าย
- **ข้อเสีย**: ต้องการการออกแบบที่ซับซ้อน

### One-Big-Table Model

- **แนวทาง**: รวมข้อมูลทั้งหมดในตารางเดียว
- **โครงสร้างข้อมูล**: ตารางเดียวที่มีคอลัมน์จำนวนมาก
- **ข้อดี**: ง่ายต่อการเข้าถึงข้อมูล
- **ข้อเสีย**: ประสิทธิภาพต่ำเมื่อข้อมูลมีขนาดใหญ่

# ส่วนประกอบของ Data Warehouse

<img src="https://www.altexsoft.com/media/2019/10/1-1024x576.png">

image from: [Enterprise Data Warehouse: EDW Components, Key Concepts, and Architecture Types](https://www.altexsoft.com/blog/enterprise-data-warehouse-concepts/)

- **Data sources**: ฐานข้อมูล, API, ไฟล์ CSV ฯลฯ
- **ETL Process**: การดึง, การแปลง, การโหลด
  - **Staging area**: แหล่งพักข้อมูล (optional)
- **Storage layer**: คลังข้อมูลหลักที่จัดเก็บข้อมูล
  - **Data marts**: ส่วนย่อยคลังข้อมูลที่ถูกออกแบบมาเพื่อให้บริการข้อมูลเฉพาะด้านหรือเฉพาะกลุ่มผู้ใช้งาน (optional)
- **Presentation layer**: เครื่องมือสำหรับการวิเคราะห์และออกรายงาน

# กระบวนการ ETL

<img src="https://www.zuar.com/blog/content/images/size/w1000/2023/05/ETL-Pipeline-Diagram.png">

image from: [What is an ETL Pipeline? Use Cases & Best Practices](https://www.zuar.com/blog/what-is-etl-pipeline/)

- **Extract**: การรวบรวมข้อมูลจากแหล่งที่มาหลากหลาย
  - **แหล่งที่มา**: MySQL, MongoDB, ไฟล์ CSV, API
  - **เทคนิค**: ใช้ SQL query, การเรียก API, การจัดการไฟล์
- **Transform**: การทำความสะอาดและแปลงข้อมูลให้ตรงกับรูปแบบที่ต้องการ
  - **การทำความสะอาดข้อมูล**: การจัดการค่าที่ขาดหาย, ค่าซ้ำ
  - **การแปลงข้อมูล**: การทำ normalization, aggregation,
 การจัดรูปแบบข้อมูล
- **Load**: การโหลดข้อมูลที่แปลงแล้วเข้าสู่คลังข้อมูล
  - **เทคนิค**: การโหลดข้อมูลแบบ batch, การโหลดข้อมูลแบบ real-time
  - **เครื่องมือ**: SQL, ไลบรารี Python (เช่น pandas, SQLAlchemy)
- หรือใช้ **ETL Tools**

# ETL Tools

| **Enterprise** | **Open-source** | **Cloud-native** | **Custom** |
|----------------|-----------------|------------------|------------|
| Commercial | Source code | Cloud technology | Own development |
| Most mature | Often free | Data already in cloud? | Customized |
| Graphical interface | Graphical interface | Efficiency | Internal resources |
| Architectural needs | Support? | Flexibility? | Maintenance? |
| Support | Ease of use? | | Training? |

| **Enterprise** | **Open-source** | **Cloud-native** |
|----------------|-----------------|------------------|
| Alteryx | Talend Open Studio | Azure Data Factory |
| Informatica | ***Pentaho Data Integration*** | AWS Glue |
| Oracle Data Integrator | Hadoop | Google Cloud Data Flow |
| Microsoft SSIS | | Stitch |

# Lab 1: ติดตั้ง Pentaho Data Integration (PDI) 

### Lab Environments

- **ETL Tool**
  - [Pentaho Data Integration (PDI)](https://pentaho.com/products/pentaho-data-integration/)
    - [Community Edition](https://github.com/ambientelivre/legacy-pentaho-ce)
  - [webSpoon](https://hub.docker.com/r/hiromuhota/webspoon)
- **Data Storage**
  - [PostgreSQL](https://hub.docker.com/_/postgres)
  - [pgAdmin](https://hub.docker.com/r/dpage/pgadmin4)
- **Automation**
  - [cron](https://en.wikipedia.org/wiki/Cron)
- **Platform**
  - [Docker](https://www.docker.com/)

### สร้างชุด containers

```sh
docker-compose up
```

### เปิด webSpoon

```
localhost:8880
```

### เปิด pgAdmin

```
localhost:8881
```

### Register Server

1. เลือกเมนู Object > Register > Server...
2. Tab General
    - Name: `Postgres`
3. Tab Connection
    - Host name/address: `postgres`
    - Username: `postgres`
    - Password: `Pa55w0rd`
4. เลือก Save password?
5. กดปุ่ม Save

### สร้าง Database

1. เลือก Databases
2. เลือกเมนู Object > Create > Database...
3. Tab General
    - Database: `Data Warehouse`
4. กดปุ่ม Save

### สร้าง Staging area

1. เลือก Data Warehouse
2. เลือกเมนู Object > Create > Schema...
3. Tab General
    - Name: `staging`
4. กดปุ่ม Save

### สร้าง Core storage

1. เลือก Data Warehouse
2. เลือกเมนู Object > Create > Schema...
3. Tab General
    - Name: `core`
4. กดปุ่ม Save

# Dimensional Model

### Fact Table

- **ลักษณะ**: เก็บข้อมูลเชิงปริมาณที่สามารถวัดได้ เช่น ยอดขาย จำนวนสินค้า
- **บทบาท**: ใช้ในการวิเคราะห์และคำนวณข้อมูล
- **โครงสร้าง**: ประกอบด้วย Primary Key ของรายการ และ Foreign Key ที่เชื่อมโยงกับ Dimension Table และคอลัมน์ที่เก็บข้อมูลเชิงปริมาณ
- **ตัวอย่าง**: ตารางยอดขายที่เก็บข้อมูลเกี่ยวกับยอดขายในแต่ละวัน

### Dimension Table

- **ลักษณะ**: เก็บข้อมูลเชิงคุณภาพที่ใช้ในการอธิบายข้อมูลใน Fact Table เช่น ชื่อสินค้า, ชื่อลูกค้า
- **บทบาท**: ใช้ในการให้บริบทและรายละเอียดเพิ่มเติมสำหรับข้อมูลใน Fact Table
- **โครงสร้าง**: ประกอบด้วยคีย์หลัก (Primary Key) และคอลัมน์ที่เก็บข้อมูลเชิงคุณภาพ
- **ตัวอย่าง**: ตารางสินค้าที่เก็บข้อมูลเกี่ยวกับชื่อสินค้า ประเภทสินค้า

### ความแตกต่างหลัก

- **ประเภทของข้อมูล**: Fact Table เก็บข้อมูลเชิงปริมาณ ส่วน Dimension Table เก็บข้อมูลเชิงคุณภาพ
- **บทบาท**: Fact Table ใช้ในการวิเคราะห์และคำนวณข้อมูล ส่วน Dimension Table ใช้ในการให้บริบทและรายละเอียดเพิ่มเติม
- **โครงสร้าง**: Fact Table มีคอลัมน์ที่เชื่อมโยงกับ Dimension Table และเก็บข้อมูลเชิงปริมาณ ส่วน Dimension Table มีคอลัมน์ที่เก็บข้อมูลเชิงคุณภาพ

### Star Schema

<img src="https://cdn.prod.website-files.com/5e6f9b297ef3941db2593ba1/614df58a1f10f92b88f95709_Screenshot%202021-09-24%20at%2017.46.51.png">

image from: [Star Schema vs Snowflake Schema and the 7 Critical Differences](https://www.keboola.com/blog/star-schema-vs-snowflake-schema)

### Snowflake Schema

<img src="https://cdn.prod.website-files.com/5e6f9b297ef3941db2593ba1/614df5d249f1d56f764083ef_Screenshot%202021-09-24%20at%2017.47.02.png">

image from: [Star Schema vs Snowflake Schema and the 7 Critical Differences](https://www.keboola.com/blog/star-schema-vs-snowflake-schema)

# OLAP Operations

<img src="https://images.javatpoint.com/tutorial/datawarehouse/images/olap-operations.png">

<img src="https://images.javatpoint.com/tutorial/datawarehouse/images/olap-operations-1.png">

<img src="https://images.javatpoint.com/tutorial/datawarehouse/images/olap-operations-2.png">

<img src="https://images.javatpoint.com/tutorial/datawarehouse/images/olap-operations-3.png">

<img src="https://images.javatpoint.com/tutorial/datawarehouse/images/olap-operations-5.png">

image from: [OLAP Operations in the Multidimensional Data Model](https://www.javatpoint.com/olap-operations)

# Data Warehouse vs. Data Lake vs. Lakehouse

<img src="https://media.licdn.com/dms/image/v2/D5612AQEMvf-lL0b64Q/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1676637608474?e=1742428800&v=beta&t=T6X73xc323eZs8r9EItLhWZMmO9BQ_5LhgbNF1X5JVc">

image from: The Modern Cloud Data Platform by Alice LaPlante (ISBN:9781492087946)

### Data Lakes

- คลังข้อมูลขนาดใหญ่
- เก็บข้อมูลดิบจำนวนมากในรูปแบบดั้งเดิม
- **PROS**
  - ความสามารถในการขยายตัว (Scalability)
  - ความยืดหยุ่น (Flexibility)
  - ประหยัดค่าใช้จ่าย (Cost-effective)
- **CONS**
  - ความซับซ้อนในการจัดการข้อมูลดิบ (Complexity in managing raw data)
  - ต้องการการกำกับดูแลที่เข้มงวด (Requires robust governance)
  - ความเสี่ยงด้านความปลอดภัย (Security risks)
- **USE CASE**: การเก็บข้อมูลหลากหลายสำหรับการใช้งานในอนาคต

### Data Warehouse

- มีโครงสร้างและการจัดระเบียบขั้นสูง
- เก็บข้อมูลที่ผ่านการประมวลผล กรอง ตามที่ได้มีการกำหนดไว้แล้ว เพื่อตอบโจทย์การใช้งานโดยเฉพาะ
- **PROS**
  - มีประสิทธิภาพ (Efficient)
  - การดึงข้อมูลรวดเร็ว (Fast data retrieval)
  - ข้อมูลถูกจัดระเบียบอย่างดี (Well-organized data)
- **CONS**
  - มีความยืดหยุ่นน้อย (Less flexibility)
  - มีค่าใช้จ่ายสูง (More expensive)
  - โครงสร้างที่เข้มงวด (Rigid structure)
- **USE CASE**: เหมาะสำหรับข้อมูลที่มีโครงสร้าง การออกรายงาน และการแสดงผล BI ในแดชบอร์ด

### Lakehouses

- ความสามารถในการทำการสืบค้นข้อมูลแบบมีโครงสร้างของคลังข้อมูล (Data Warehouses)
- ความยืดหยุ่นในการเก็บข้อมูลดิบของ Data Lakes
- **PROS**
  - ความหลากหลาย (Versatility)
  - การประมวลผลแบบเรียลไทม์ (Real-Time Processing)
  - ความสามารถในการขยายตัว (Scalability)
- **CONS**
  - สถาปัตยกรรมที่ซับซ้อน (Complex Architecture)
  - เทคโนโลยีที่กำลังพัฒนา (Emerging Technology)
  - ความท้าทายในการรวมระบบ (Integration Challenges)
- **USE CASE**: การใช้งานแบบไฮบริดที่ให้ความสามารถในการสืบค้นข้อมูลแบบมีโครงสร้างพร้อมกับความยืดหยุ่นในการเก็บข้อมูลดิบ

# Lab 2: Setup data sources

- copy folder `data` ใส่ใน `pgadmin\storage\pg_admin.com`

- ### **ใช้ pgAdmin**

### สร้างตาราง products

1. เลือก public
2. เลือกเมนู Tools \> Query Tool
3. พิมพ์คำสั่ง
``` sql
CREATE TABLE products (
  product_id varchar(5),
  product_name varchar(100),
  category varchar(50),
  subcategory varchar(50),
  PRIMARY KEY (product_id)
);
```
4. กด F5
5. เลือก products
6. เลือกเมนู Tools \> Import/Export Data\...
7. Tab General
    - เลือก Import
    - Filname: `data/products.csv`
    - Encoding: `UTF8`
8. Tab Options
    - เลือก Header
9. กดปุ่ม OK

### สร้างตาราง sales

1. พิมพ์คำสั่ง
``` sql
CREATE TABLE sales (
  transaction_id integer,
  transactional_date timestamp,
  product_id character varying,
  customer_id integer,
  payment character varying,
  credit_card bigint,
  loyalty_card character varying,
  cost character varying,
  quantity integer,
  price numeric,
  PRIMARY KEY (transaction_id)
);
```
2. กด F5
3. เลือก sales
4. เลือกเมนู Tools \> Import/Export Data\...
5. Tab General
    - เลือก Import
    - Filname: `data/sales_1.csv`
    - Encoding: `UTF8`
6. Tab Options
    - เลือก Header
7. กดปุ่ม OK

# Lab 3: Staging schema

- ### **ใช้ pgAdmin**

### สร้างตาราง staging.products

1. พิมพ์คำสั่ง
``` sql
CREATE TABLE staging.products (
  product_pk integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 ),
  product_id varchar(5),
  product_name varchar(100),
  category varchar(50),
  subcategory varchar(50),
  PRIMARY KEY (product_pk)
);
```
2. กด F5

### สร้างตาราง staging.sales

1. พิมพ์คำสั่ง
``` sql
CREATE TABLE staging.sales (
  transaction_id integer,
  transactional_date timestamp,
  product_id character varying,
  customer_id integer,
  payment character varying,
  credit_card bigint,
  loyalty_card character varying,
  cost numeric,
  quantity integer,
  price numeric,
  PRIMARY KEY (transaction_id)
);
```
2. กด F5

# Lab 4: Core schema (Star schema)

- ### **ใช้ pgAdmin**

### สร้างตาราง core.dim_product

1. พิมพ์คำสั่ง
``` sql
CREATE TABLE core.dim_product (
  product_pk int, 
  product_id varchar(5),
  product_name varchar(100),
  category varchar(50),
  subcategory varchar(50),
  brand varchar(50)
);
```
2. กด F5

### สร้างตาราง core.dim_payment

1. พิมพ์คำสั่ง
``` sql
CREATE TABLE core.dim_payment (
  payment_pk integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 ),
  payment character varying,
  loyalty_card character varying,
  PRIMARY KEY (payment_pk)
);
```
2. กด F5

### สร้างตาราง core.dim_date

1. Open File: `data/dim_date.sql`
2. กด F5

### สร้างตาราง core.sale

1. พิมพ์คำสั่ง
``` sql
CREATE TABLE core.sales (
  transaction_id integer,
  transactional_date timestamp,
  transactional_date_fk bigint,
  product_fk integer,
  customer_fk integer,
  payment_fk integer,
  credit_card bigint,
  cost numeric,
  quantity integer,
  price numeric,
  total_cost numeric,
  total_price numeric,
  profit numeric,  
  PRIMARY KEY (transaction_id)
);
```
2. กด F5

# Lab 5: Staging area (**E**xtract)

- ### **ใช้ webSpoon**

### ตาราง staging.products

#### Initial Load

1. File > New > Transformation
2. เลือก Table input
3. สร้าง Connection
    - Connect name: `PostgreSQL`
    - Connect type: PostgreSQL
    - Host Name: `postgres`
    - Database Name: `Data Warehouse`
    - Username: `postgres`
    - Password: `Pa55w0rd`
4. กดปุ่ม Test
5. กดปุ่ม OK
6. พิมพ์คำสั่ง
``` sql
SELECT * 
FROM public.products
```
7. กดปุ่ม Preview
8. กดปุ่ม OK
9. เลือก Table output
    - Target schema: `staging`
    - Target table: `products` 
10. Save
    - Filename: `file:///home/tomcat/pdi/Initial_load_product`
11. Run
12. Tab View
13. Share Database connection

#### Delta Load

1. File > New > Transformation
2. เลือก Table input
3. พิมพ์คำสั่ง
``` sql
SELECT MAX(product_id) last_product_id 
FROM core.dim_product 
```
4. กดปุ่ม Preview
5. กดปุ่ม OK
9. เลือก Set variables
    - Field name: `last_product_id`
    - Variable name: `last_product_id`
    - Variable scope type: Valid in the Java Virtual Machine
10. กดปุ่ม OK
11. Save
    - Filename: `file:///home/tomcat/pdi/Set_last_product_id`
11. Run
12. File > New > Transformation
13. เลือก Get variables
    - Name: `last_product_id`
    - Variable: `${last_product_id}`
    - Type: String
14. กดปุ่ม Preview
15. กดปุ่ม OK
16. เลือก Table input
17. พิมพ์คำสั่ง
``` sql
SELECT * 
FROM public.products 
WHERE product_id > '${last_product_id}' 
```
18. เลือก Replace variables in script?
19. กดปุ่ม Preview
20. กดปุ่ม OK
21. เลือก Table output
    - Target schema: `staging`
    - Target table: `products` 
    - เลือก Trancate table
    - เลือก Specity database fields
22. กดปุ่ม Get fields
23. ลบ last_product_id
24. กดปุ่ม OK
25. Save
    - Filename: `file:///home/tomcat/pdi/Delta_load_product`

### ตาราง staging.sales

1. File > New > Transformation
2. เลือก Table input
3. พิมพ์คำสั่ง
``` sql
SELECT COALESCE(MAX(transactional_date), '1970-01-01 00:00:00') last_sale_date 
FROM core.sales
```
4. กดปุ่ม Preview
5. กดปุ่ม OK
9. เลือก Set variables
    - Field name: `last_sale_date`
    - Variable name: `last_sale_date`
    - Variable scope type: Valid in the Java Virtual Machine
10. กดปุ่ม OK
11. Save
    - Filename: `file:///home/tomcat/pdi/Set_last_sale_date`
11. Run
12. File > New > Transformation
13. เลือก Get variables
    - Name: `last_sale_date`
    - Variable: `${last_sale_date}`
    - Type: Timestamp
14. กดปุ่ม Preview
15. กดปุ่ม OK
16. เลือก Table input
17. พิมพ์คำสั่ง
``` sql
SELECT * 
FROM public.sales 
WHERE transactional_date > '${last_sale_date}' 
```
18. เลือก Replace variables in script?
19. กดปุ่ม Preview
20. กดปุ่ม OK
21. เลือก Select values
22. เลือก Tab Meta-data
    - Fieldname: cost
    - Type: Number
23. เลือก Table output
    - Target schema: `staging`
    - Target table: `sales` 
    - เลือก Trancate table
    - เลือก Specity database fields
24. กดปุ่ม Get fields
25. ลบ last_sale_date
26. กดปุ่ม OK
27. Save
    - Filename: `file:///home/tomcat/pdi/Load_sale`
28. Run

# Lab 6: Core Storage (**T**ransform and **L**oad)

- ### **ใช้ webSpoon**

### ตาราง core.dim_product

1. File > New > Transformation
2. เลือก Table input
3. พิมพ์คำสั่ง
``` sql
SELECT * 
FROM staging.products 
```
4. กดปุ่ม Preview
5. กดปุ่ม OK
6. เลือก String operations
    - In stream field: product_name
    - Trim type: both
    - Remove special character: horizontal tab
7. กดปุ่ม OK
8. เลือก Split fields
    - Fild to split: product_name
    - Delimiter: `(`
    - 1
      - New field: `product_name`
      - Type: String
      - Trim type: right      
    - 2
      - New field: `brand`
      - Type: String
9. กดปุ่ม OK
10. เลือก Replace in string
    - In stream field: brand
    - Search: `)`
11. กดปุ่ม OK
12. เลือก Insert / update
    - Target schema: `core`
    - Target table: `dim_product` 
    - Table field: product_id
    - Comparator: =
    - Stream field1: product_id
13. กดปุ่ม Get update fields
14. เปลี่ยน product_pk Update เป็น N
15. กดปุ่ม OK
16. Save
    - Filename: `file:///home/tomcat/pdi/Transform_product`
17. File > New > Job
18. เลือก Start
19. เลือก Transformation
    - Entry Name: `Set last product id`
    - Transformation: `file:///home/tomcat/pdi/Set_last_product_id.ktr`
20. กดปุ่ม OK
21. เลือก Transformation
    - Entry Name: `Delta load product`
    - Transformation: `file:///home/tomcat/pdi/Delta_load_product.ktr`
22. กดปุ่ม OK
23. เลือก Transformation
    - Entry Name: `Transform product`
    - Transformation: `file:///home/tomcat/pdi/Transform_product.ktr`
24. กดปุ่ม OK
25. Save
    - Filename: `file:///home/tomcat/pdi/Product_ETL`
26. Run

> ลองเพิ่มข้อมูลใน public.products ('P0750', 'Red Apple (Milstaso)', 'Fruits & Vegetables', 'Fruits')

### ตาราง core.dim_payment

1. File > New > Transformation
2. เลือก Table input
3. พิมพ์คำสั่ง
``` sql
SELECT DISTINCT COALESCE(payment, 'cash') payment, loyalty_card 
FROM staging.sales 
```
4. กดปุ่ม Preview
5. กดปุ่ม OK
6. เลือก Insert / update
    - Target schema: `core`
    - Target table: `dim_payment` 
    - 1
      - Table field: payment
      - Comparator: =
      - Stream field1: payment
    - 2
      - Table field: loyalty_card
      - Comparator: =
      - Stream field1: loyalty_card
13. กดปุ่ม Get update fields
14. เปลี่ยน Update ทั้งหมดเป็น N
15. กดปุ่ม OK
16. Save
    - Filename: `file:///home/tomcat/pdi/Load_payment`
17. Run

### ตาราง core.sale

1. File > New > Transformation
2. เลือก Table input
3. พิมพ์คำสั่ง
``` sql
SELECT 
	transaction_id ,
	transactional_date ,
	EXTRACT(year from transactional_date)*10000 + EXTRACT('month' from transactional_date)*100+EXTRACT('day' from transactional_date)as 	transactional_date_fk,
	f.product_id ,
	p.product_PK as product_FK,
	payment_PK as payment_FK,
    customer_id as customer_fk,
    credit_card ,
   	cost  ,
    quantity ,
   	price
FROM staging.sales f
LEFT JOIN 
core.dim_payment d
ON d.payment = COALESCE(f.payment,'cash') AND d.loyalty_card=f.loyalty_card
LEFT JOIN core.dim_product p on p.product_id=f.product_id
order by transaction_id 
```
4. กดปุ่ม Preview
5. กดปุ่ม OK
6. เลือก Calculator
    - 1
      - New field: `total_price`
      - Calculation: A * B
      - Field A: price
      - Field B: quantity
      - Value type: Number
      - Precision: 2
    - 2
      - New field: `total_cost`
      - Calculation: A * B
      - Field A: cost
      - Field B: quantity
      - Value type: Number
      - Precision: 2
7. กดปุ่ม OK
8. เลือก Calculator
    - 1
      - New field: `profit`
      - Calculation: A - B
      - Field A: total_price
      - Field B: total_cost
      - Value type: Number
      - Precision: 2
9. กดปุ่ม OK
10. เลือก Insert / update
    - Target schema: `core`
    - Target table: `sales` 
    - 1
      - Table field: payment
      - Comparator: =
      - Stream field1: payment
    - 2
      - Table field: loyalty_card
      - Comparator: =
      - Stream field1: loyalty_card
11. กดปุ่ม Get update fields
12. เปลี่ยน Transaction_id Update เป็น N
13. กดปุ่ม OK
14. Save
    - Filename: `file:///home/tomcat/pdi/Load_fact_sale`
15. Run

### Integrated

1. File > New > Job
2. เลือก Start
3. เลือก Job
    - Entry Name: `dim_product`
    - Transformation: `file:///home/tomcat/pdi/Product_ETL.kjb`
3. เลือก Transformation
    - Entry Name: `dim_payment`
    - Transformation: `file:///home/tomcat/pdi/Load_payment.ktr`
4. กดปุ่ม OK
5. เลือก Transformation
    - Entry Name: `fact_sale`
    - Transformation: `file:///home/tomcat/pdi/Load_sale.ktr`
6. กดปุ่ม OK
7. Save
    - Filename: `file:///home/tomcat/pdi/Full_ETL`
8. Run

# Lab7: Automation

- ### **ใช้ terminal**

1. พิมพ์คำสั่ง เพื่อดูชื่อ container
```bash
docker-compose ps
```
2. พิมพ์คำสั่งเพื่อ remote เข้า webspoon
```bash
docker exec -it lab-datawarehouse-webspoon-1 bash
```
- ### **ใช้ webspoon bash**

1. พิมพ์คำสั่งใช้ cron table editor
```bash
crontab -e
```
2. เพิ่มบรรทัด
```
*/3 * * * * /usr/local/tomcat/webapps/spoon/kitchen.sh /file:/home/tomcat/pdi/Full_ETL.kjb

```
3. กด `ctrl+x` > `y` > `Enter` เพื่อ save

- ### **ใช้ pgAdmin**

1. เลือก public.sales
2. เลือกเมนู Tools \> Import/Export Data\...
3. Tab General
    - เลือก Import
    - Filname: `data/sales_2.csv`
    - Encoding: `UTF8`
4. Tab Options
    - เลือก Header
5. กดปุ่ม OK

> ทดสอบด้วยการเพิ่มข้อมูลด้วยไฟล์ data/sales_3.csv และ data/sales_4.csv
