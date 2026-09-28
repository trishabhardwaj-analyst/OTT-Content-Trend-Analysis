# Power BI Dashboard Build Guide — Amazon Prime Video

## 1. Load the dataset
Home → Get Data → Text/CSV → `amazon_prime_titles.csv`

Rename the query/table to:
`PrimeVideo`

## 2. Power Query calculated columns

### Duration Value
```powerquery
= try Number.FromText(Text.BeforeDelimiter([duration], " ")) otherwise null
```

### Duration Type
```powerquery
= if [type] = "Movie" then "Minutes" else "Seasons"
```

### Primary Genre
```powerquery
= try Text.BeforeDelimiter([listed_in], ",") otherwise [listed_in]
```

### Release Decade
```powerquery
= Number.IntegerDivide([release_year], 10) * 10
```

## 3. Recommended dashboard page — Overview

### KPI Cards
- Total Titles
- Movies
- TV Shows
- Total Genres
- Total Countries
- Average Movie Duration

### Visuals
- Donut: Movies vs TV Shows
- Bar chart: Top 10 Genres
- Line chart: Titles by Release Year
- Bar chart: Top 10 Countries
- Column chart: Rating Distribution
- Slicer: Type
- Slicer: Release Year
- Slicer: Rating

## 4. Content Deep Dive page

Use:
- Genre by release year
- Movies vs TV Shows by year
- Duration distribution
- Rating by content type
- Country analysis
- Title table

## 5. DAX Measures

```DAX
Total Titles = DISTINCTCOUNT(PrimeVideo[show_id])

Movies =
CALCULATE(
    [Total Titles],
    PrimeVideo[type] = "Movie"
)

TV Shows =
CALCULATE(
    [Total Titles],
    PrimeVideo[type] = "TV Show"
)

Movie % =
DIVIDE(
    [Movies],
    [Total Titles]
)

TV Show % =
DIVIDE(
    [TV Shows],
    [Total Titles]
)

Average Movie Duration =
CALCULATE(
    AVERAGE(PrimeVideo[Duration Value]),
    PrimeVideo[type] = "Movie"
)
```

## 6. Design
Use a dark streaming-style layout:
- Header: `Amazon Prime Video — Content Intelligence`
- KPI row at top
- Charts in a 2x2 or 3-column grid
- Keep slicers on the left or top
- Use consistent typography
- Add a footer: `Source: Amazon Prime Video Titles Dataset`

## 7. Do not use date_added as the primary trend
The dataset version used for this project has sparse `date_added` values. Use `release_year` for the main content trend.
