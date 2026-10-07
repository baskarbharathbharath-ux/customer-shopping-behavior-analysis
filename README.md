# Customer Shopping Behavior Analysis

## Overview

This project analyzes customer shopping behavior to identify purchasing patterns, customer preferences, product performance, and business trends.

The analysis follows an end-to-end data analytics workflow using **Python, Oracle SQL, and Power BI**, with a professional report and presentation created to communicate the key findings.

## Dataset

The dataset contains customer shopping and purchase-related information such as:

- Customer ID
- Age
- Gender
- Category
- Product
- Purchase Amount
- Location
- Season
- Payment Method
- Subscription Status
- Previous Purchases
- Review Rating
- Shipping Type
- Discount Applied

The dataset was initially loaded and explored using Python before being cleaned and analyzed.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| **Python** | Data loading, cleaning and EDA |
| **Pandas** | Data manipulation and analysis |
| **NumPy** | Numerical analysis |
| **Matplotlib / Seaborn** | Data visualization |
| **Oracle SQL** | SQL analysis and business queries |
| **Power BI** | Interactive dashboard |
| **Gamma** | Presentation / PPT creation |
| **Excel / CSV** | Dataset and data preparation |

## Project Workflow

### 1. Data Loading

The dataset was loaded into Python using Pandas.

```python
import pandas as pd

df = pd.read_csv("customer_shopping_behavior.csv")
```

### 2. Exploratory Data Analysis

EDA was performed to understand the dataset and identify important patterns.

Key activities included:

- Dataset structure analysis
- Missing-value analysis
- Duplicate-value detection
- Descriptive statistics
- Category analysis
- Customer behavior analysis
- Purchase amount analysis
- Correlation analysis
- Data visualization

### 3. Data Cleaning

The dataset was cleaned and prepared for further analysis.

Major steps included:

- Handling missing values
- Removing duplicate records
- Correcting data types
- Standardizing categorical values
- Validating numerical columns
- Preparing analysis-ready data

### 4. Oracle SQL Analysis

The cleaned dataset was analyzed using **Oracle SQL** to answer business questions.

Example analysis areas:

- Total number of customers
- Average purchase amount
- Total sales
- Category-wise sales
- Customer segmentation
- Payment method analysis
- Subscription analysis
- Location-wise performance
- Product performance
- High-value customers

SQL techniques used include:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- Aggregate Functions
- `CASE`
- Subqueries
- Joins
- Analytical Queries

### 5. Power BI Dashboard

The analyzed data was connected to Power BI to create an interactive dashboard.

The dashboard focuses on:

- Total Customers
- Total Sales
- Average Purchase Amount
- Average Rating
- Category Performance
- Customer Demographics
- Payment Method Analysis
- Subscription Analysis
- Purchase Trends
- Customer Behavior

Interactive features include:

- Cards
- Bar Charts
- Column Charts
- Donut Charts
- Slicers
- Filters
- KPI visuals

## Dashboard

The Power BI dashboard provides an interactive view of customer shopping behavior and allows users to explore the data based on different customer and purchase attributes.

**Dashboard:**  
`Add your Power BI dashboard screenshot here`

Example:

```markdown
![Customer Shopping Behavior Dashboard](images/dashboard.png)
```

## Results & Key Insights

The analysis helps identify important customer and business patterns, including:

- Customer purchasing behavior
- Top-performing product categories
- Average customer spending
- Preferred payment methods
- Subscription behavior
- Customer demographic patterns
- High-value customer segments
- Product and category performance
- Opportunities for improving customer engagement

These insights can support better **marketing strategies, customer segmentation, product planning, and business decision-making**.

## Report

A professional project report was created covering:

- Project Overview
- Dataset Description
- Data Cleaning
- Exploratory Data Analysis
- Oracle SQL Analysis
- Power BI Dashboard
- Key Findings
- Business Recommendations

**Report:**  
`Add your report file/link here`

## Presentation

A professional presentation was created using **Gamma** to communicate the project workflow, analysis, dashboard, insights, and business recommendations.

**Presentation:**  
`Add your Gamma/PPT link here`

## How to Run

### Step 1 — Clone the Repository

```bash
git clone https://github.com/yourusername/customer-shopping-behavior-analysis.git
```

### Step 2 — Install Python Libraries

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### Step 3 — Load the Dataset

Place the dataset inside the project folder and update the file path in the Python notebook/script.

```python
df = pd.read_csv("customer_shopping_behavior.csv")
```

### Step 4 — Run Python Analysis

Open the Jupyter Notebook or Python script and run the data loading, cleaning, EDA, and visualization sections.

### Step 5 — Run Oracle SQL Analysis

Import the cleaned dataset into Oracle Database and execute the SQL queries provided in the `sql` folder.

### Step 6 — Open Power BI Dashboard

Open the `.pbix` file in Power BI Desktop and refresh the data if required.

## Project Structure

```text
customer-shopping-behavior-analysis/
│
├── dataset/
│   └── customer_shopping_behavior.csv
│
├── python/
│   └── customer_shopping_analysis.ipynb
│
├── sql/
│   └── customer_shopping_analysis.sql
│
├── powerbi/
│   └── customer_shopping_behavior.pbix
│
├── report/
│   └── customer_shopping_behavior_report.pdf
│
├── presentation/
│   └── customer_shopping_behavior.pptx
│
├── images/
│   └── dashboard.png
│
├── README.md
└── .gitignore
```

## Business Recommendations

Based on the analysis, businesses can:

- Focus marketing efforts on high-value customer segments.
- Identify and promote high-performing product categories.
- Improve customer retention strategies.
- Use customer purchase patterns for personalized offers.
- Optimize promotional and discount strategies.
- Monitor customer satisfaction through review ratings.
- Use dashboard insights for data-driven decision-making.

## Skills Demonstrated

**Python | Pandas | NumPy | EDA | Data Cleaning | Data Visualization | Oracle SQL | Power BI | DAX | Business Analytics | Data Storytelling | Generative AI**

## Project Outcome

This project demonstrates an end-to-end **Data Analytics workflow**, from raw dataset preparation and exploratory analysis to SQL-based business analysis, interactive Power BI visualization, professional reporting, and presentation.

It showcases practical skills required for a **Data Analyst / Business Analyst** role.

---

### Author

**Bharath**  
Aspiring Data Analyst  
Python | SQL | Excel | Power BI | Data Analytics
