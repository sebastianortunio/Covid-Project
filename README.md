# Covi Project

In this project, I worked with a dataset containing COVID-19 statistics, focusing on analyzing various trends related to cases, deaths, vaccinations, and population data. The key tasks I performed include:

## Data Cleaning and Transformation:
-Date Standardization: Converted date columns in the coviddeaths and covidvaccinations tables from text to the proper DATE format to ensure consistency and ease of analysis.
-Handling Numeric Data: Removed commas from numeric fields such as total_deaths and new_deaths, using the CAST function to convert them into integer values for accurate calculations.
## Data Analysis:
- Death Percentage Calculation: Analyzed the likelihood of death for those who contracted COVID-19 by calculating the death percentage as (total_deaths/total_cases) * 100 for different locations.
- Infection Rate Analysis: Compared the number of total cases to the population size to calculate the percentage of the population infected with COVID-19 in various countries.
- Country Comparison: Identified countries with the highest infection rates and death counts per population, helping to identify the areas most impacted by the pandemic.
- Global Overview: Calculated daily global COVID-19 statistics, including new cases, new deaths, and the death percentage, offering a global snapshot of the pandemic's progress over time.
## Vaccination Analysis:
- Vaccination Rates: Combined data from coviddeaths and covidvaccinations tables to analyze vaccination trends. I calculated the cumulative number of vaccinated individuals per location, comparing it against the total population to determine vaccination percentages.
- Continental and Location-level Analysis: Performed a detailed analysis of vaccination rates by continent and location, helping to visualize vaccination progress globally and by region.
## Advanced SQL Techniques:
- Used window functions like SUM() OVER to calculate cumulative totals, enabling detailed time-series analysis.
- Employed CTE (Common Table Expressions) to structure complex queries for easier readability and to manage intermediate results for the vaccination analysis.
- Filtered and grouped data to provide insights by location, continent, and specific date ranges, making the data more actionable.





This project allowed me to demonstrate my ability to work with large, real-world datasets and perform thorough data cleaning, transformation, and analysis using SQL. The insights gained from this project can help in understanding COVID-19's impact on different regions, guiding future pandemic responses and health interventions.
