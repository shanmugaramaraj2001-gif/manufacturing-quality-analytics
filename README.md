# Manufacturing Quality Analytics

An end-to-end practice portfolio project exploring manufacturing inspection and rejection data with Python, MySQL, and Power BI.

> **Project status:** In progress. Findings and dashboard screenshots will be added after the dataset, calculations, and report are validated.

## Business objective

Analyze inspection records to understand rejection patterns, supplier performance, defect frequency, machine-level rejection quantities, and Cost of Poor Quality (COPQ). The intended audience is a manufacturing or quality team seeking to prioritize investigations and improvement actions.

## Questions explored

- Which suppliers have the highest rejected quantities?
- Which suppliers contribute the highest rejection costs?
- Which defect types occur most frequently?
- Which machines have the highest rejected quantities?
- How do rejection rate and COPQ vary by month?
- What are the total inspected and rejected quantities, and the overall rejection rate?

## Tools

- **Python / Pandas:** Initial data inspection, missing-value review, date parsing, feature creation, and summary calculations.
- **MySQL:** Aggregation and analysis queries.
- **Power BI:** Planned dashboard for quality KPIs and monthly trends.

## Repository structure

```text
manufacturing-quality-analytics/
├── README.md
├── sql/
│   └── quality_analysis.sql
├── python/
│   └── quality_analysis.ipynb
├── power-bi/
│   └── dashboard_documentation.md
└── images/
    └── (validated dashboard screenshots will be added here)
```

## How to use

1. Obtain a dataset that you are authorized to use. The notebook currently expects a CSV named `inspection_data.csv` in its working directory.
2. Review the column names and date format, then update the notebook if your dataset differs.
3. Run the notebook to inspect and clean the data and calculate rejection-related fields.
4. Load the cleaned data into a MySQL table named `inspection_data` in a database named `aerospace_quality`, or adapt the SQL to your schema.
5. Run the SQL queries and validate the totals and percentages against the source data.
6. Build or review the Power BI dashboard and add screenshots plus verified findings here.

### Database credentials

Do not hard-code credentials in notebooks or SQL files. The notebook's database connection cell reads credentials from environment variables such as `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_HOST`, `MYSQL_PORT`, and `MYSQL_DATABASE`. Set these locally; never commit passwords, connection strings, or `.env` files.

## Metric definitions to validate

- **Total inspected:** Sum of `Qty_Inspected`.
- **Total rejected:** Sum of `Qty_Rejected`.
- **Overall rejection rate:** Total rejected divided by total inspected, multiplied by 100.
- **COPQ:** Sum of `Rejection_Cost`, assuming the dataset defines this field as cost of poor quality.

Confirm the source data's definitions and units before presenting these measures as business findings.

## Data privacy and limitations

Only publish public, synthetic, or explicitly approved data. Do not upload employer-confidential records, customer/supplier-identifying information, internal drawings, proprietary dashboards, or personal information. No numerical findings or improvement claims are presented in this README until they are verified against an authorized dataset.

## Next steps

- Add an authorized dataset or clear instructions for obtaining it.
- Validate data types, missing-value treatment, duplicate handling, and metric calculations.
- Remove redundant SQL queries and document query assumptions.
- Add a dashboard preview and verified insights.
- Add reproducible setup instructions after testing the project from a clean environment.
