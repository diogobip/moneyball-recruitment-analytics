# Brighton & Hove Albion FC: Moneyball Transfer Recruitment Analytics (2017–2024)

## 📌 Research Question

> **"How effectively has Brighton & Hove Albion generated a net transfer financial surplus and high-margin player sales since their promotion to the Premier League in 2017?"** 

This project analyzes Brighton & Hove Albion’s transfer market efficiency, evaluating how their scouting model identifies undervalued talent, drives high-margin player sales, and maintains financial sustainability in the Premier League.

---

## 💡 Key Analytical Findings

1. **The Profit Pivot (2021–2024):** After initial capital investment upon Premier League promotion in 2017, Brighton transitioned into a massive net financial surplus driven by marquee player sales.
2. **High-Margin Player Flipping:** Major outbound transfers—such as Moisés Caicedo, Marc Cucurella, Ben White, and Alexis Mac Allister—generated substantial profit margins relative to their acquisition costs.
3. **Sustainable Net Spend:** While competing against traditional "Big Six" clubs with significantly higher wage structures and transfer budgets, Brighton maintained one of the lowest net transfer spends in the league while staying competitive on the pitch.

---

## 🛠️ End-to-End Workflow 
    
    +-----------------------------------+  
    |  1. Excel Data Prep & Cleaning    |  
    |  - Kaggle Transfermarkt Data      |  
    |  - Inbound & Outbound Data        |  
    |  - Standardized CSV Exports       |  
    +-----------------------------------+  
    │  
    ▼  
    +-----------------------------------+  
    |  2. SQL Server Engineering        |  
    |  - Schema staging & flat file import|  
    |  - Aggregations: Total Spend/Sales|  
    |  - Financial net balance by season|  
    +-----------------------------------+  
    │  
    ▼  
    +-----------------------------------+  
    |  3. Power BI Analytics Dashboard  |  
    |  - Executive KPI Summary Cards    |  
    |  - Net Balance YoY Column Chart   |  
    |  - Top 5 Outbound Sales Breakdown |  
    +-----------------------------------+  

### 1. Excel (Data Preprocessing)

* Extracted raw inbound and outbound transfer data from Kaggle (Transfermarkt).
* Cleaned and filtered records to isolate **Brighton & Hove Albion (`Brighton`)** across seasons from **2017/18 through 2023/24**.
* Formatted numerical values, standardized currency metrics into Euros (€), and exported clean datasets (`transfer_inbound_clean.csv` and `transfers_outbound_clean.csv`).

### 2. SQL Server (Data Engineering & Transformation)

* Staged flat files into SQL Server (`SSMS`) tables (`transfer_inbound` and `transfers_outbound`).
* Wrote T-SQL queries to aggregate annual financial metrics and isolate high-value transfer deals:
  * Calculated seasonal spend, sales revenue, and net balance using `SUM()` and `CASE` conditional logic.
  * Ranked top outbound sales by overall transfer fee using `ORDER BY transfer_fee DESC`.

### 3. Power BI (Data Visualization & Executive Dashboard)

Built a focused executive dashboard to present key financial insights:

* **Executive KPI Cards:** Displayed overall net transfer profit (€), total transfer revenue generated, and total players traded.
* **Seasonal Net Spend Chart:** Visualized year-over-year transfer spend vs. income, highlighting the inflection point where player sales outpaced acquisition costs.
* **Top Sales Breakdown:** Highlighted the top 5 most profitable player sales to showcase Brighton's scouting and player development pipeline.

---

## 📊 Dataset & Metric Definitions

* **Source:** Kaggle Transfermarkt Historical Dataset
* **Primary Metrics:**
  * **`transfer_fee`:** Agreed transfer fee measured in Euros (€).
  * **`market_value_in_eur`:** Estimated player market valuation at the time of transfer.
  * **`net_transfer_balance`:** Total Outbound Sales (€) minus Total Inbound Spend (€).
* **Why these metrics matter:** Tracking net transfer balance alongside player acquisition costs proves whether a club's recruitment model operates as a self-sustaining financial cycle rather than relying on owner subsidies.