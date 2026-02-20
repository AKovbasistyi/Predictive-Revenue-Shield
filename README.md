  Predictive Revenue Shield: 
Industrial Churn Analytics This repository hosts a data-driven Revenue Protection Framework designed for the industrial sector. By moving beyond reactive reporting, this project utilizes a Personalized Early-Warning System to detect behavioral anomalies in commercial accounts before high-value partnerships are lost.
Hearing the "Silent Churn":
  1.The Business Challenge In the world of Industrial Partnerships, customers don't "cancel"—they simply drift away. Traditional analytics often rely on a "one-size-fits-all" rule, such as flagging any account that hasn't ordered in 90 days. However, this logic is flawed because every Commercial Account has a different "pulse." A high-volume distributor might order weekly, while a specialized factory orders once a quarter.
The goal of this project was to move beyond these rigid rules and build a Personalized Early-Warning System. By analyzing the unique rhythm of every client, I aimed to detect behavioral anomalies before a strategic relationship was permanently lost to a competitor.
  2.The Approach: Listening to the Data’s Rhythm Step:
  A: Defining the Individual Baseline Rather than comparing customers to a global average, I established a custom baseline for every client. By calculating the average time between their purchases and the statistical variance in their behavior, I engineered a model that respects individual buying patterns.
  Step B: Organizing the Audience Using K-Means Clustering (validated via the Elbow Method), I organized over 200,000 transactions into three distinct behavioral stories:
  -The Loyalists: High-value partners who are active and on schedule.
  -The Consistent Middle: Smaller, but highly predictable accounts.
  3.The Anomalies: Once-reliable customers whose "pulse" has skipped a beat.
  Step C: Mapping the Financial Exposure By mapping these segments against total financial value, I identified the "Danger Zone"—high-value commercial relationships that were drifting away but were still within the window of being saved.
  3.The Conclusion: Turning Insights into Strategy Quantifying the Risk: Transitioned from "feeling" that business was slow to identifying $55M in high-risk revenue. A Prioritized Action Plan: Generated a focused "Hit List" for the sales team to prioritize outreach based on dollar-value exposure.
Strategic Growth: Aligned production and inventory with predicted industrial re-order cycles.
Installation & Usage:
  1. Prerequisites SQL Server (or T-SQL compatible environment) Python 3.8+ Dataset: Product Sales Dataset (2023-2024) - https://www.kaggle.com/datasets/yashyennewar/product-sales-dataset-2023-2024
  2. Setup Clone the repository and install dependencies: Bash git clone : https://github.com/AKovbasistyi/Predictive-Revenue-Shield.git pip install -r requirements.txt
  3. Execution Run the Analysis.sql script on your database to engineer the purchase cycle metrics. Export the result as Churn_Metric.csv. Open Clustering_Model.ipynb and run all cells to generate the segments and the High-Risk Intervention List.
Tech Stack SQL: Data Engineering, Window Functions (LEAD), and CTEs. Python: pandas, scikit-learn (K-Means), matplotlib, seaborn.

