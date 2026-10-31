# Brighton & Hove Albion FC: Moneyball Transfer Recruitment Analytics (2016–2024)

## 📌 Research Question

> **"How effectively has Brighton & Hove Albion generated transfer market value and high-margin player sales while maintaining financial sustainability since 2016?"** 

This project analyzes Brighton & Hove Albion’s transfer market efficiency, evaluating how their scouting model identifies undervalued talent, drives high-margin player sales, and executes a disciplined, reinvestment-driven recruitment cycle.

  
---

## 💡 Key Analytical Findings

1. **The Profit Pivot (2021–2024):** Following initial squad-building phases, Brighton scaled into a high-margin "talent extractor" model driven by marquee outbound player sales.
2. **High-Margin Player Flipping:** Major outbound transfers—such as Moisés Caicedo (€116M), Marc Cucurella (€65.3M), and Ben White (€58.5M)—generated substantial capital gains relative to acquisition costs\[cite: 4\].
3. **Sustainable Net-Neutral Reinvestment:** Rather than accumulating a passive cash surplus, Brighton ran a tight net spend (-€10.1M across the period), continuously recycling sale proceeds directly back into squad depth to sustain Premier League competitiveness.

---

## 🛠️ End-to-End Workflow 
    
    `+-----------------------------------+    
    |  1. Excel Data Prep & Cleaning    |    
    |  - Kaggle Transfermarkt Data      |    
    |  - Inbound & Outbound Data        |    
    |  - Standardized CSV Exports       |    
    +-----------------------------------+    
    │    
    ▼    
    +-----------------------------------+    
    |  2. SQL Server Engineering        |    
    |  - Staging flat files & cleaning  |    
    |  - Creating SQL views (season &   |    
    |    trading partner aggregations)  |    
    +-----------------------------------+    
    │    
    ▼    
    +-----------------------------------+    
    |  3. Power BI Analytics Dashboard  |    
    |  - Executive KPI Summary Cards    |    
    |  - Net Balance YoY Column Chart   |    
    |  - Top 10 Outbound Sales Table    |    
    +-----------------------------------+    
    `

### 1\. Excel (Data Preprocessing)

* Extracted raw inbound and outbound transfer data from Kaggle (Transfermarkt).
* Cleaned and filtered records to isolate **Brighton & Hove Albion** across seasons from **2016/17 through 2023/24**.
* Formatted numerical values, standardized currency metrics into Euros (€), and exported clean datasets (`transfer_inbound_clean.csv` and `transfers_outbound_clean.csv`).

### 2\. SQL Server (Data Engineering & Transformation)

* Staged flat files into SQL Server (`SSMS`) tables.
* Developed structured **SQL views** (`vw_brighton_season_summary`, `vw_brighton_trading_partners`, and clean transfer tables) to aggregate annual financial metrics and isolate high-value transfer deals:
  * Calculated seasonal spend, sales revenue, and net balance using conditional logic and aggregations.
  * Mapped buying club distributions and ranked top outbound sales by overall transfer fee.

### 3\. Power BI (Data Visualization & Executive Dashboard)

Built a focused, executive-ready single-page dashboard to present key financial insights:

* **Executive KPI Cards:** Displayed overall net transfer balance (€), total transfer revenue generated, and total spend.
* **Seasonal Net Balance Chart:** Visualized year-over-year transfer spend vs. income, highlighting the inflection point where player sales scaled exponentially.
* **Top 10 Sales Breakdown:** Highlighted the top 10 most profitable player sales with clean conditional formatting and custom currency display units.

---

## 📊 Dataset & Metric Definitions

* **Source: **Football Data from Transfermarkt by David Cariboo
* **Primary Metrics:**
  * **`transfer_fee`:** Agreed transfer fee measured in Millions of Euros (€M)
  * **`net_transfer_balance`:** Total Outbound Sales (€) minus Total Inbound Spend (€)
* **Why these metrics matter:** Tracking net transfer balance alongside player acquisition costs proves whether a club's recruitment model operates as a self-sustaining financial cycle rather than relying purely on external owner subsidies
* **Some notes:** There are a lot of 0’s and Nulls on the database,this constitutes loans or free tranfers.
* There are also nulls that means that there non disclosed transfers.
