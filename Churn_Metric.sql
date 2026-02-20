-- Calculating the 'Deviation from Purchase Cycle'
WITH CustomerOrderStats AS (
    SELECT 
        Customer_Name,
        Region,
        Order_Date,
        LEAD(Order_Date) OVER(PARTITION BY Customer_Name ORDER BY Order_Date) as next_order_date,
        Revenue,
        Profit
    FROM [dbo].[SalesData]
),
OrderIntervals AS (
    SELECT 
        Customer_Name,
        Region,
        DATEDIFF(day, Order_Date, next_order_date) as days_between_orders,
        Revenue,
        Profit,
        Order_Date 
    FROM CustomerOrderStats
    WHERE next_order_date IS NOT NULL
),
CustomerMetrics AS (
    SELECT 
        Customer_Name,
        Region,
        AVG(CAST(days_between_orders AS FLOAT)) as avg_cycle_days, 
        STDEV(days_between_orders) as std_cycle_days,
        SUM(Revenue) as total_revenue,
        SUM(Profit) as total_profit,
        MAX(Order_Date) as last_purchase_date
    FROM OrderIntervals 
    GROUP BY Customer_Name, Region 
)
SELECT 
    *,
    DATEDIFF(day, last_purchase_date, GETDATE()) as days_since_last_order,
    CASE 
        WHEN DATEDIFF(day, last_purchase_date, GETDATE()) > (avg_cycle_days + ISNULL(std_cycle_days, 0)) THEN 'High Risk'
        WHEN DATEDIFF(day, last_purchase_date, GETDATE()) > avg_cycle_days THEN 'Monitor'
        ELSE 'Healthy'
    END as churn_status
FROM CustomerMetrics
ORDER BY total_revenue DESC;