# zepto_inventory_health_risk_analysis
End-to-end data analytics project focused on mitigating revenue leakage in a high-velocity Quick-Commerce (Q-Commerce) environment. This project audits 3,700+ transaction records , optimizes a ₹2.49M inventory lifecycle, and segments logistics payload tiering for delivery fleet efficiency. Powered by SQL and Power BI.

# Zepto Inventory Health & Revenue Optimization

## Project Background
Zepto operates in a hyper-competitive quick-commerce market where **Inventory Turnover** and **Fulfillment Velocity** are the primary drivers of profitability. As a data analyst within the operations team, my objective was to address "leakage" caused by inefficient stock allocation—specifically where high-value items are overstocked (creating **Dead Stock**) while high-demand items frequently go **Out of Stock**, leading to lost revenue.

Insights and recommendations are provided on the following key areas:
* **Inventory Health & Fill Rates:** Auditing the "Digital Shelf" for stock density.
* **Revenue Opportunity Gaps:** Identifying lost GMV from high-ticket OOS items.
* **Pricing & Markdown Efficiency:** Evaluating price sensitivity and markdown depth.
* **Logistics & Payload Optimization:** Segmenting inventory by weight for fleet allocation.

The SQL queries used to clean, transform the raw inventory data, and answer critical business questions can be found here: [SQL/Data_Cleaning_queries](https://github.com/vivek1dv/zepto_inventory_health_risk_analysis/blob/main/zepto_inventory_sql.sql).

An interactive Power BI dashboard used to report and explore sales trends can be found here: [Power_bi_dashboard](https://github.com/vivek1dv/zepto_inventory_health_risk_analysis/blob/main/zepto_inventory_analysis_bi.pbix)


---

## 📊 Data Structure & Initial Checks
The primary inventory dataset consists of **3,727 high-frequency transaction records** with 9 specialized attributes.

* **zepto_1 (Processed Table):** The optimized SQL table featuring SKU IDs, category taxonomies, MRP, and stock status.
* **Attributes:** Key features include **Customer Demographics**, **Purchase Architecture** (Item details), and **Behavioral Metrics** (Discount application).

![Alt text](https://github.com/vivek1dv/zepto_inventory_health_risk_analysis/blob/main/columns%20zepto.png)

---

## 🚀 Executive Summary
### Overview of Findings
The audit identified critical operational inefficiencies: a significant portion of **"Hero Products"** (high-demand) are frequently out of stock, while high-MRP items with low discounts are experiencing **Velocity Stagnation**. By reclaiming lost GMV from high-ticket OOS items and optimizing the delivery fleet based on payload tiering, Zepto can significantly improve unit economics and fulfillment reliability.

---

## 🔍 Insights Deep Dive

### 🛒 Inventory Health & Risk
* **Hero Categories:** "Cooking Essentials," "Munchies," and the "Paan Corner" were identified as the primary hero categories driving volume.
* **OOS Mix:** The analysis revealed a total of **453 SKUs** that are currently out of stock, representing a significant fill-rate gap.
* **Financial Audit:** The total inventory value sits at **₹2.49M**, while total potential revenue is **₹2.24M**; the variance is attributed to applied discount strategies.
* **Inventory Space:** "Cooking Essentials," "Munchies," and "Chocolates & Candy" are the dominant categories occupying warehouse storage space.
  
![Alt text](https://github.com/vivek1dv/zepto_inventory_health_risk_analysis/blob/main/inventory%20health%20Dashboard%20zepto.png)

### 💸 Revenue Opportunity & Pricing
* **High-Ticket Leakage:** Items with an **MRP > ₹300** that are currently Out-of-Stock represent immediate procurement failure points and lost revenue.
* **Velocity Stagnation:** Premium items (**MRP > ₹500**) with minimal discounts (**<10%**) are moving significantly slower than the organizational average.
* **Markdown Depth:** Isolated the **Top 10 products by Markdown Depth** to identify the "Hero Products" that drive app traffic and customer acquisition.

![Alt text](https://github.com/vivek1dv/zepto_inventory_health_risk_analysis/blob/main/Revenue%20Opportunity%20zepto.png)

### 🚛 Logistics & Payload Tiering
* **Logistics Classing:** The catalog was segmented into **Low, Medium, and Bulk** weight classes for optimized handling.
* **Fleet Allocation:** Payload data supports the dynamic allocation of the delivery fleet between **Bikes** and **Electric Three-wheelers**.
* **Floor-Loading Planning:** Cumulative weight calculations per category assist in Dark Store warehouse storage and shelf-loading planning.
* **Unit-Value Engineering:** Analyzed the price-per-gram for bulk products to identify cost-effective options for consumers.

![Alt text](https://github.com/vivek1dv/zepto_inventory_health_risk_analysis/blob/main/Logistics%20%26%20Payload%20Tiering%20zepto.png)
---

## 💡 Recommendations
Based on the analysis, I recommend the **Operations and Procurement** teams consider the following:

* **Recover Lost GMV:** Prioritize the immediate restocking of **"High-Ticket OOS" items (> ₹300)** to increase Average Order Value (AOV) with minimal marketing spend. Restocking high-value items is the fastest path to revenue recovery.
* **Fleet Optimization:** Use **Payload Tiering** to auto-flag "Bulk" category orders for high-capacity vehicles. Dynamic routing reduces rider fatigue and prevents delivery delays.
* **Velocity Re-engagement:** For stagnant high-MRP items, implement a **tiered discount increase (5-10%)** to unlock liquidity from slow-moving stock. Aggressive markdowns on stagnant stock improves inventory turnover.
* **SKU Rationalization:** Consolidate redundant SKUs found in the audit to simplify the UI and reduce picking errors. Assortment cleanup improves fulfillment accuracy at Dark Stores.
* **Margin Realignment:** Evaluate the margin contribution of categories with the highest average discounts to ensure they are not exceeding **"Loss Leader"** thresholds. Balance value perception with long-term profitability.

---

## ⚠️ Assumptions and Caveats
* **Data Density:** Assumed **100% data density** for critical attributes like MRP and stock status after initial cleaning.
* **Revenue Assumptions:** Realizable revenue calculations assume current pricing and markdown strategies remain constant during the turnover period.
* **Weight Mapping:** Products **over 100g** were utilized for price-per-gram engineering to ensure bulk consumer insights were statistically significant.
