# Amazon Prime Video — OTT Streaming Content Trend Analysis

## Project
This project analyzes the Amazon Prime Video content catalog to identify patterns in:
- Movies vs TV Shows
- Genre popularity
- Content ratings
- Release-year trends
- Country/region mix
- Movie duration
- Genre trends over time

The project is designed around the internship requirement:
> Move from a raw OTT catalog dump to a data-backed content strategy narrative.

## Tools
- Python: Pandas, NumPy, Matplotlib, Seaborn, SciPy
- SQL: aggregation, filtering, grouping
- Excel: PivotTables and charts
- Power BI: interactive dashboard

## Dataset
Expected file:
`data/amazon_prime_titles.csv`

Columns:
`show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description`

The public Amazon Prime titles dataset commonly contains 9,668 records and 12 columns. The exact results in this project should be generated from the CSV used for submission.

## Deliverables
1. EDA notebook with 8+ visualizations
2. SQL aggregation queries
3. Excel analysis workbook
4. Power BI dashboard plan and DAX measures
5. Content strategy memo
6. README documentation

## Notebook
Open:
`notebooks/OTT_Content_Analysis.ipynb`

Place the CSV at:
`data/amazon_prime_titles.csv`

Then run all cells.

## Visualizations
The notebook creates:
1. Movies vs TV Shows
2. Top Genres
3. Release-Year Trend
4. Top Countries
5. Rating Distribution
6. Movie Duration Distribution
7. Genre Trend Over Time
8. Movies vs TV Shows by Release Year

## Business Story
The analysis should answer:
- What type of content dominates the catalog?
- Which genres have the largest representation?
- How has the catalog changed over time?
- Which countries contribute the most content?
- What rating segments dominate?
- What does movie duration suggest about the catalog?
- Which content areas could be investigated for future acquisition?

## Important Data Limitation
`date_added` is sparse in this version of the dataset, so primary trend analysis uses `release_year` rather than `date_added`.

## GitHub
Recommended repository structure:

```text
OTT-Content-Trend-Analysis/
├── data/
├── notebooks/
├── sql/
├── excel/
├── visualizations/
├── report/
├── powerbi/
└── README.md
```

## Reference
The public dataset structure can be verified from GitHub repositories using the same `amazon_prime_titles.csv` schema.
