-- RANK
SELECT zone_name, month, total_waste,
RANK() OVER (PARTITION BY month ORDER BY total_waste DESC) AS rank_in_month
FROM (
    SELECT z.zone_name,
    DATE_TRUNC('month', c.collection_date) AS month,
    SUM(c.waste_kg) AS total_waste
    FROM collections c
    JOIN zones z ON c.zone_id = z.zone_id
    GROUP BY z.zone_name, month
) t;

-- RUNNING TOTAL
SELECT district_name, collection_date,
SUM(waste_kg) OVER (
PARTITION BY district_name
ORDER BY collection_date
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_total
FROM (
    SELECT d.district_name, c.collection_date, c.waste_kg
    FROM collections c
    JOIN zones z ON c.zone_id = z.zone_id
    JOIN districts d ON z.district_id = d.district_id
) x;

-- LAG
SELECT month, total_waste,
total_waste - LAG(total_waste) OVER (ORDER BY month) AS monthly_change
FROM (
    SELECT DATE_TRUNC('month', collection_date) AS month,
    SUM(waste_kg) AS total_waste
    FROM collections
    GROUP BY month
) m;

-- NTILE
SELECT district_name, total_waste,
NTILE(4) OVER (ORDER BY total_waste DESC) AS waste_quartile
FROM (
    SELECT d.district_name, SUM(c.waste_kg) AS total_waste
    FROM collections c
    JOIN zones z ON c.zone_id = z.zone_id
    JOIN districts d ON z.district_id = d.district_id
    GROUP BY d.district_name
) t;

-- MOVING AVERAGE
SELECT month, total_waste,
AVG(total_waste) OVER (
ORDER BY month
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS three_month_avg
FROM (
    SELECT DATE_TRUNC('month', collection_date) AS month,
    SUM(waste_kg) AS total_waste
    FROM collections
    GROUP BY month
) m;
