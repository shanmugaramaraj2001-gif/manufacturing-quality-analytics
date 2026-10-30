# Manufacturing Quality Analytics

An end-to-end data analytics portfolio project using Python, MySQL, and Power BI to analyze manufacturing inspection data, rejection patterns, supplier performance, machine-level quality, and Cost of Poor Quality (COPQ).

The project demonstrates how manufacturing quality data can be transformed into actionable insights through data analysis, SQL queries, and an interactive Power BI dashboard.

## Project Overview

Manufacturing organizations need reliable quality data to monitor inspection performance, identify recurring defects, evaluate supplier quality, and control rejection costs.

This project analyzes a practice dataset to demonstrate how data analytics can support quality monitoring and decision-making in a manufacturing environment.

## Business Objectives

* Monitor inspection and rejection performance.
* Analyze monthly rejection-rate trends.
* Identify suppliers with high rejected quantities.
* Examine machine-wise rejection quantities.
* Identify frequent defect types.
* Analyze rejection costs and their contribution to overall quality costs.
* Present quality performance through an executive dashboard.

## Tools and Technologies

| Tool             | Application                                 |
| ---------------- | ------------------------------------------- |
| Python           | Data inspection, cleaning, and analysis     |
| Pandas           | Data manipulation and transformation        |
| MySQL            | SQL-based analysis and aggregation          |
| Power BI         | Interactive dashboard and KPI visualization |
| Jupyter Notebook | Python analysis workflow                    |

## Key Findings from the Practice Dataset

The analysis of the practice dataset produced the following observations:

* **Overall rejection rate:** The calculated rejection rate is 5.66%, based on 9,709 rejected units out of 171,489 inspected units.
* **Supplier performance:** Supplier_12 has the highest rejected quantity among the suppliers shown in the dashboard, with 821 rejected units.
* **Monthly trend:** The rejection rate reaches its highest displayed value in June at 6.25%.
* **Machine-level analysis:** CMM-04 has the highest rejected quantity among the five machines, with 2,036 rejected units.
* **Defect analysis:** Scratch is the leading defect category in the displayed Pareto analysis, with 306 occurrences.

These observations identify areas that could warrant further investigation in a manufacturing quality environment. They are based on practice data and should not be interpreted as findings about an actual company.

### Metric Definitions

* **Inspection Records:** Number of records in the inspection dataset.
* **Total Inspected Quantity:** Sum of `Qty_Inspected`.
* **Total Rejected Quantity:** Sum of `Qty_Rejected`.
* **Overall Rejection Rate:** Total rejected quantity divided by total inspected quantity, multiplied by 100.
* **COPQ:** Sum of `Rejection_Cost`, representing rejection-related costs in the practice dataset.

These figures describe the practice dataset and should not be interpreted as actual company performance.

## Power BI Dashboard

The Aerospace Quality Executive Dashboard provides a consolidated view of manufacturing quality performance.

Dashboard components include:

* Executive KPI cards for inspection records, inspected quantity, rejected quantity, rejection rate, and COPQ.
* Monthly rejection-rate trend.
* Supplier rejection analysis.
* Machine-wise rejected quantity.
* Defect Pareto analysis.
* Top defect types.
* Supplier, inspector, month, and machine filters.
* Worst-supplier indicator.

The dashboard is designed to help users explore quality performance and identify areas that may require further investigation.

## Power BI Dashboard Preview

The Aerospace Quality Executive Dashboard provides an overview of manufacturing quality performance through key performance indicators (KPIs), rejection trends, supplier analysis, machine-wise rejection analysis, and defect Pareto analysis.

![Aerospace Quality Executive Dashboard](quality_dashboard.png)

### Key Performance Indicators

| KPI                         |       Value |
| --------------------------- | ----------: |
| Inspection Records          |       2,000 |
| Total Inspected             |     171,489 |
| Total Rejected              |       9,709 |
| Rejection Rate              |       5.66% |
| Cost of Poor Quality (COPQ) | ₹462,632.32 |
| Worst Supplier              | Supplier_12 |

### Dashboard Components

* **Monthly Rejection Rate Trend:** Tracks monthly rejection rates to identify fluctuations in quality performance.
* **Supplier Rejection Analysis:** Compares supplier-wise rejected quantities to identify suppliers requiring further investigation.
* **Machine-wise Rejected Quantity:** Compares rejected quantities across inspection machines.
* **Pareto Analysis:** Ranks defect types by count and displays their cumulative percentage to highlight the most significant defect categories.
* **Top Defect Types:** Highlights the defect categories with the highest rejection counts.

### Interactive Filters

The dashboard includes the following slicers for exploring the data:

* Supplier Name
* Inspector
* Month
* Machine ID

These filters allow users to investigate quality performance across different suppliers, inspectors, months, and machines.

## SQL Analysis

The SQL analysis covers:

* Inspection data completeness and overall KPIs.
* Monthly inspection and rejection trends.
* Supplier-wise rejection quantities and costs.
* Defect-type analysis.
* Machine-wise rejection analysis.
* Machine and defect combinations.
* Top defect types by machine.
* Rejection cost contribution by machine.
* Final KPI validation.

The SQL queries use aggregation, grouping, conditional calculations, common table expressions, and window functions where appropriate.

## Python Analysis

The Jupyter Notebook supports the initial data-analysis workflow, including:

* Data inspection.
* Missing-value review.
* Date parsing.
* Feature creation.
* Summary calculations.
* Preparation of data for further analysis.

## Repository Structure

```text
manufacturing-quality-analytics/
├── README.md
├── .env.example
├── .gitignore
├── dashboard_documentation.md
├── quality_analysis.ipynb
├── quality_analysis.sql
└── quality_dashboard.png
```

**File descriptions:**

* `README.md` — Project overview, results, dashboard preview, and setup instructions.
* `.env.example` — Example environment configuration.
* `.gitignore` — Specifies files excluded from version control.
* `dashboard_documentation.md` — Documentation for the Power BI dashboard.
* `quality_analysis.ipynb` — Python-based data inspection and analysis.
* `quality_analysis.sql` — SQL queries for manufacturing quality analysis.
* `quality_dashboard.png` — Screenshot of the completed Power BI dashboard.

The repository includes a dashboard screenshot for preview. The editable Power BI `.pbix` report file is not currently listed in the repository structure.

## How to Run the Project

### Before You Begin

This repository contains the Python notebook, SQL analysis script, dashboard documentation, and a dashboard screenshot.

To reproduce the analysis, you will also need the practice inspection dataset used by the notebook and SQL queries. The notebook expects a CSV file named `inspection_data.csv`; update its file path if your dataset is stored elsewhere.

For SQL analysis, create the `aerospace_quality` database and load the dataset into a table named `inspection_data`, or adjust the SQL script to match your database and table names.

The repository currently provides a dashboard screenshot for viewing. To interact with or modify the Power BI report, you will need the corresponding `.pbix` file if it is available separately.

### 1. Python

* Install Python and Jupyter Notebook.
* Install the required Python libraries.
* Obtain the practice dataset used for this project.
* Place the dataset in the notebook's expected working directory.
* Review the notebook's configuration and run the analysis cells.

The notebook currently expects a CSV file named `inspection_data.csv`. Adjust the path if necessary.

### 2. MySQL

* Create a database named `aerospace_quality`, or update the SQL script to use your own database.
* Load the inspection dataset into a table named `inspection_data`.
* Review the table structure and column names.
* Execute the queries in `quality_analysis.sql`.
* Compare the calculated totals and percentages against the source data.

### 3. Power BI

* Open the Power BI report if the `.pbix` file is included.
* Review the data source configuration.
* Refresh the data if required.
* Interact with the filters and visuals to analyze inspection performance.

## Data Privacy and Limitations

This project uses practice data for learning and portfolio demonstration.

The results illustrate an analytical workflow and should not be interpreted as verified findings from a real manufacturing organization.

When adapting this project for other datasets, verify column definitions, units, cost assumptions, and metric calculations before drawing business conclusions.

## Skills Demonstrated

* Data cleaning and exploratory analysis.
* SQL aggregation and analytical queries.
* Manufacturing quality KPI analysis.
* Supplier and machine performance analysis.
* Defect and rejection analysis.
* Rejection cost analysis.
* Power BI dashboard development.
* Data-driven quality monitoring.

## Author

**Shanmuganathan A R**

Manufacturing Quality Professional | Aspiring Data Analyst

Technical interests: SQL, Python, Excel, Power BI, Manufacturing Analytics, and Quality Analytics.
