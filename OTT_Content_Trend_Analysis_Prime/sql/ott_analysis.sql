-- Amazon Prime Video OTT Content Trend Analysis
-- Table name assumed: amazon_prime_titles

-- 1. Movies vs TV Shows
SELECT
    type,
    COUNT(*) AS total_titles
FROM amazon_prime_titles
GROUP BY type
ORDER BY total_titles DESC;

-- 2. Content by release year
SELECT
    release_year,
    COUNT(*) AS total_titles
FROM amazon_prime_titles
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

-- 3. Rating distribution
SELECT
    rating,
    COUNT(*) AS total_titles
FROM amazon_prime_titles
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total_titles DESC;

-- 4. Top countries
-- Note: the country field can contain multiple comma-separated countries.
-- This query counts the raw country field; Python performs a split-country analysis.
SELECT
    country,
    COUNT(*) AS total_titles
FROM amazon_prime_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

-- 5. Content by release decade
SELECT
    CAST((release_year / 10) * 10 AS INTEGER) AS release_decade,
    COUNT(*) AS total_titles
FROM amazon_prime_titles
WHERE release_year IS NOT NULL
GROUP BY CAST((release_year / 10) * 10 AS INTEGER)
ORDER BY release_decade;

-- 6. Type by release year
SELECT
    release_year,
    type,
    COUNT(*) AS total_titles
FROM amazon_prime_titles
WHERE release_year IS NOT NULL
GROUP BY release_year, type
ORDER BY release_year, type;

-- 7. Recent content
SELECT
    release_year,
    type,
    COUNT(*) AS total_titles
FROM amazon_prime_titles
WHERE release_year >= 2015
GROUP BY release_year, type
ORDER BY release_year, type;

-- 8. Missing-value audit
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN director IS NULL OR TRIM(director) = '' THEN 1 ELSE 0 END) AS missing_director,
    SUM(CASE WHEN country IS NULL OR TRIM(country) = '' THEN 1 ELSE 0 END) AS missing_country,
    SUM(CASE WHEN rating IS NULL OR TRIM(rating) = '' THEN 1 ELSE 0 END) AS missing_rating,
    SUM(CASE WHEN duration IS NULL OR TRIM(duration) = '' THEN 1 ELSE 0 END) AS missing_duration
FROM amazon_prime_titles;

-- 9. Average movie duration
-- SQLite-compatible extraction from values such as '113 min'
SELECT
    AVG(CAST(REPLACE(duration, ' min', '') AS REAL)) AS avg_movie_duration_minutes
FROM amazon_prime_titles
WHERE type = 'Movie'
  AND duration LIKE '%min';

-- 10. Content by rating and type
SELECT
    rating,
    type,
    COUNT(*) AS total_titles
FROM amazon_prime_titles
WHERE rating IS NOT NULL
GROUP BY rating, type
ORDER BY rating, type;
