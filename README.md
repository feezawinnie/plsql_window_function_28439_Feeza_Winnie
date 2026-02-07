# plsql_window_function_28439_Feeza_Winnie

# Municipal Rubbish Collection Analysis  
SQL JOINs and Window Functions Project

## Business Context
This project analyzes rubbish collection operations for a Municipal Waste Management Authority responsible for sanitation services across multiple districts and zones.

## Data Challenge
Although waste collection data is recorded daily, it is not analyzed to identify trends, inefficiencies, or high waste–generating areas. Decision-makers lack clear insights for optimizing collection schedules and resource allocation.

## Expected Outcome
The analysis identifies top waste-generating zones, tracks monthly waste trends, segments districts by waste volume, and supports data-driven planning.

---

## Success Criteria
1. Identify top waste-generating zones per month using RANK()  
2. Calculate running waste totals per district using SUM() OVER()  
3. Analyze month-over-month waste change using LAG()  
4. Segment districts into quartiles using NTILE(4)  
5. Compute three-month moving averages using AVG() OVER()

---

## Database Schema
Three tables were designed:

- districts  
- zones  
- collections  

A one-to-many relationship exists between districts and zones, and between zones and collections.

ER diagram is provided in the screenshots folder.

---

## Part A — SQL JOINs

### INNER JOIN
Retrieves valid rubbish collection records with district and zone details.

### LEFT JOIN
Identifies districts without any collection records.

### RIGHT JOIN
Detects zones with no rubbish collection activity.

### FULL OUTER JOIN
Shows all districts and zones including unmatched records.

### SELF JOIN
Compares zones within the same district.

All JOIN queries are provided in `sql/joins.sql`.

---

## Part B — Window Functions

### Ranking Functions
RANK() used to identify top waste-generating zones per month.

### Aggregate Window Functions
SUM() OVER used to compute running waste totals per district.

### Navigation Functions
LAG() used to calculate month-to-month waste change.

### Distribution Functions
NTILE(4) used to segment districts into four waste quartiles.

### Moving Average
AVG() OVER used to compute three-month moving averages.

All window function queries are provided in `sql/window_functions.sql`.

---

## Key Insights
- A small number of zones generate a large proportion of total waste.  
- Waste collection shows consistent monthly growth.  
- High-population districts dominate the top waste quartiles.

---

## Recommendations
- Increase collection frequency in high-waste zones.  
- Implement waste reduction programs in top quartile districts.  
- Reallocate resources from low-activity zones.

---

## References
- PostgreSQL Official Documentation  
- Oracle SQL Analytical Functions Guide  
- W3Schools SQL Window Functions Tutorial  

---

## Integrity Statement
“All sources were properly cited. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation.”
