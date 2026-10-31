# Manufacturing Quality Analytics

A manufacturing quality analytics project combining **Python, MySQL, and
Power BI** to explore inspection results, rejection trends, supplier
performance, machine-level rejects, defect patterns, and
rejection-related costs.

> **Data note:** This project uses practice data for portfolio and
> demonstration purposes. The findings describe only this dataset and do
> not represent the performance of an actual company.

## Project Overview

The project demonstrates how manufacturing inspection data can be
analyzed and presented in a dashboard to support quality monitoring and
investigation.

### Business Objectives

-   Measure inspected and rejected quantities and calculate the overall
    rejection rate.
-   Review rejection trends across months.
-   Compare rejected quantities by supplier and machine.
-   Identify leading defect categories using Pareto analysis.
-   Summarize rejection-related cost (COPQ) for the practice dataset.
-   Present key quality indicators in an interactive Power BI report.

## Tools and Technologies

  Tool               Purpose
  ------------------ -----------------------------------
  Python             Data inspection and analysis
  Pandas             Data manipulation and preparation
  MySQL              SQL-based quality analysis
  Power BI           Dashboard and KPI visualization
  Jupyter Notebook   Python analysis workflow

## Dashboard Preview

The Power BI dashboard brings the key metrics and analysis views
together on one page.

![Aerospace Quality Executive Dashboard](quality_dashboard.png)

### Key Performance Indicators

  ------------------------------------------------------------------------
  KPI                                         Result Definition
  --------------------- ---------------------------- ---------------------
  Inspection Records                           2,000 Number of records in
                                                     the inspection
                                                     dataset

  Total Inspected                            171,489 Sum of inspected
  Quantity                                           quantity

  Total Rejected                               9,709 Sum of rejected
  Quantity                                           quantity

  Overall Rejection                            5.66% Rejected quantity
  Rate                                               divided by inspected
                                                     quantity, multiplied
                                                     by 100

  COPQ                                   ₹462,632.32 Total
                                                     rejection-related
                                                     cost recorded in the
                                                     practice dataset

  Worst Supplier                         Supplier_12 Supplier with the
                                                     highest rejected
                                                     quantity among the
                                                     suppliers shown
  ------------------------------------------------------------------------

### Dashboard Components

-   **Monthly Rejection Rate Trend** --- compares rejection rates from
    January to December.
-   **Supplier Rejection Analysis** --- compares rejected quantities by
    supplier.
-   **Machine-wise Rejected Quantity** --- compares rejected quantities
    across five machines.
-   **Defect Pareto Analysis** --- ranks displayed defect categories by
    occurrence and shows cumulative percentage.
-   **Interactive filters** --- Supplier_Name, Inspector, Month, and
    Machine_ID.

The repository includes both the dashboard screenshot
(`quality_dashboard.png`) and the editable Power BI report
(`quality_dashboard.pbix`).

## Key Findings from the Practice Dataset

-   **Overall rejection rate:** 5.66%, based on 9,709 rejected units out
    of 171,489 inspected units.
-   **Supplier performance:** Supplier_12 has the highest rejected
    quantity among the suppliers shown, with 821 rejected units.
-   **Monthly trend:** The highest displayed monthly rejection rate is
    June at 6.25%.
-   **Machine-level analysis:** CMM-04 has the highest rejected quantity
    among the five machines, with 2,036 rejected units.
-   **Defect analysis:** Scratch is the leading defect category in the
    displayed Pareto analysis, with 306 occurrences.

These observations highlight areas that could warrant further
investigation in a manufacturing quality environment. They are based on
practice data and should not be interpreted as findings about an actual
company.

## Metric Definitions

-   **Inspection Records:** Number of records in the inspection dataset.
-   **Total Inspected Quantity:** Sum of `Qty_Inspected`.
-   **Total Rejected Quantity:** Sum of `Qty_Rejected`.
-   **Overall Rejection Rate:** Total rejected quantity divided by total
    inspected quantity, multiplied by 100.
-   **COPQ:** Sum of `Rejection_Cost`, representing rejection-related
    costs in the practice dataset.
-   **Worst Supplier:** The supplier with the highest rejected quantity
    in the supplier analysis shown.

## SQL Analysis

The `quality_analysis.sql` script contains SQL queries used to
investigate manufacturing quality data, including rejection metrics,
supplier performance, machine-level results, monthly trends, and defect
analysis.

For the SQL script to run successfully, the database, table, and column
names in the script must match your MySQL setup.

## Python Analysis

The `quality_analysis.ipynb` notebook contains the Python-based analysis
workflow using Pandas. It expects a CSV file named
`inspection_data.csv`; update the file path in the notebook if your
dataset is stored elsewhere.

The CSV dataset itself is not listed in this repository. You will need
to obtain or prepare the practice dataset before reproducing the
analysis.

## Repository Structure

``` text
manufacturing-quality-analytics/
├── README.md
├── .env.example
├── .gitignore
├── dashboard_documentation.md
├── quality_analysis.ipynb
├── quality_analysis.sql
├── quality_dashboard.pbix
└── quality_dashboard.png
```

### File Descriptions

-   `README.md` --- project overview, dashboard preview, key findings,
    and setup notes.
-   `.env.example` --- example environment configuration; contains
    placeholders, not real credentials.
-   `.gitignore` --- files and folders excluded from version control.
-   `dashboard_documentation.md` --- documentation for the Power BI
    dashboard.
-   `quality_analysis.ipynb` --- Python-based data inspection and
    analysis.
-   `quality_analysis.sql` --- SQL queries for manufacturing quality
    analysis.
-   `quality_dashboard.pbix` --- editable Power BI report.
-   `quality_dashboard.png` --- screenshot preview of the Power BI
    dashboard.

## How to Run the Project

### Before You Begin

To reproduce the analysis, you need the practice inspection dataset used
by the notebook and SQL queries. The repository includes the analysis
files and dashboard, but the CSV dataset is not currently listed in the
repository.

The notebook expects a CSV file named `inspection_data.csv`. For SQL
analysis, create a MySQL database named `aerospace_quality` and load the
dataset into a table named `inspection_data`, or update the script to
match your database and table names.

You can view the dashboard preview directly in this README. To interact
with or modify the report, open `quality_dashboard.pbix` using Power BI
Desktop.

### 1. Python

1.  Install Python and Jupyter Notebook.
2.  Install the libraries imported by the notebook, including Pandas if
    required by your environment.
3.  Obtain or prepare the practice dataset and save it as
    `inspection_data.csv`, or update the notebook's CSV path.
4.  Open `quality_analysis.ipynb` in Jupyter Notebook or VS Code.
5.  Review the configuration and run the notebook cells.

### 2. MySQL

1.  Install and start MySQL.
2.  Create the `aerospace_quality` database.
3.  Load the practice dataset into a table named `inspection_data`.
4.  Open `quality_analysis.sql`.
5.  Confirm the database, table, and column names match your setup, then
    run the queries.

### 3. Power BI

1.  Install Power BI Desktop.
2.  Open `quality_dashboard.pbix`.
3.  If prompted, update data-source paths or connection settings to
    match your environment.
4.  Refresh the data if the source dataset and connections are
    available.
5.  Use the dashboard filters to explore the results.

## Skills Demonstrated

-   Manufacturing and quality data analysis
-   Data preparation with Python and Pandas
-   SQL querying and aggregation
-   KPI definition and calculation
-   Supplier and machine performance analysis
-   Defect Pareto analysis
-   Power BI dashboard development and interactive filtering
-   Communicating findings with data visualizations

## Limitations

-   The dataset is for practice and demonstration purposes.
-   The findings and KPI values apply only to the dataset used for this
    project.
-   The CSV dataset is not included in this repository, so the Python
    and SQL analyses may require a separately obtained or prepared
    dataset and corresponding path or connection configuration.
-   Dashboard refresh and interactivity depend on the data sources and
    connections configured in Power BI Desktop.

## Author

**Shanmuganathan A R**

Manufacturing Quality / Quality Analytics \| Python \| SQL \| Power BI
