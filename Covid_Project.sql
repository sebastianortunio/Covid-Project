use portfolioProject;

-----------------------------------------------------------------------------------------------------------------------------------------------------
#Fixing tables
#Changing column date data type from text to date from table coviddeaths and covidvaccinations

ALTER TABLE coviddeaths
MODIFY COLUMN date DATE;
UPDATE coviddeaths
SET date = STR_TO_DATE(date, '%m/%d/%y');
set sql_safe_updates=0;

UPDATE covidvaccinations
SET date = STR_TO_DATE(date, '%m/%d/%y');
set sql_safe_updates=0;
UPDATE covidvaccinations
SET date = STR_TO_DATE(date, '%m/%d/%y');
ALTER TABLE covidvaccinations
MODIFY COLUMN date DATE;

#Checking Tables




use portfolioProject;
select * from covidvaccinations
order by 3,4; 

# Select data we are going to use
select location,date,total_cases,	new_cases,total_deaths,population
from coviddeaths
order by location,date;
-----------------------------------------------------------------------------------------------------------------------------------------------------
#Looking at total cases vs total deaths 
#Show the likelihood dying. if you contract covid
select location,date,total_cases,total_deaths,population,(total_deaths/total_cases)*100 DeathPercentage
from coviddeaths
where location like '%states'
order by date desc;
 
-----------------------------------------------------------------------------------------------------------------------------------------------------
 #Looking the total cases vs the population
 #Sows what porcentage of the population got COVID
 
 select location,date,total_cases, population,(total_cases/population)*100 as cases_per_population
 from coviddeaths 
 where location="United States"
 order by cases_per_population desc;
-----------------------------------------------------------------------------------------------------------------------------------------------------
 #Looking at countries with highest infecction rate compared to population
 select location, population,max(total_cases) as highest_cases_per_country,max((total_cases/population)*100) as cases_per_population
 from coviddeaths
 group by population,location
  order by cases_per_population desc;
  
-----------------------------------------------------------------------------------------------------------------------------------------------------
  #Countries with the highest death count per population.
  #Total deaths was initally declared as a text. I used cast to change it to integer 
  
  select location, max(cast(replace(total_deaths,',','')as unsigned)) as TotalDeathCount
  from coviddeaths
  where continent is not null
  group by location
  order by TotalDeathCount; 
-----------------------------------------------------------------------------------------------------------------------------------------------------
  
  ##Let's break this down by continent. 
SELECT continent,max(CAST(REPLACE(total_deaths, ',', '') AS UNSIGNED)) AS TotalDeathCount
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;

-----------------------------------------------------------------------------------------------------------------------------------------------------
#Global Number per day: new cases, deaths, death percentage.
select date, sum(new_cases) as New_Cases,sum(cast(replace(new_deaths,',','') as unsigned)) as Deaths, 
(sum(cast(replace(new_deaths,',','') as unsigned))/sum(new_cases))*100 as Death_Percentage
from coviddeaths
where continent is not null
group by date
order by date asc;
-----------------------------------------------------------------------------------------------------------------------------------------------------
  # Total cases, total deaths, and the total death percentage in the world
select sum(new_cases) as total_cases ,sum(new_deaths)  as Total_Deaths, 
(sum(new_deaths)/sum(new_cases))*100 as Death_Percentage
from coviddeaths
where continent is not null
order by date asc;
  

-----------------------------------------------------------------------------------------------------------------------------------------------------
##lOOKING AT TOTAL POPULATION VS VACCINATION PER DAY
select *from covidvaccinations;
select *from coviddeaths where location="Albania";

#use CTE
with PopuvsVacc(continent,location,date,population,new_vaccination, rowling_people_vaccinated)
AS
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(new_vaccinations)over(partition by dea.location order by dea.location, dea.date) as rowling_people_vaccinated
##Rowling_people_vaccinated/population)*100
from coviddeaths dea
join covidvaccinations vac
	on dea.location= vac.location
	and dea.date=vac.date
    and dea.continent=vac.continent
where dea.continent is not null
)
select *,(rowling_people_vaccinated/population)*100 as percentage_people_vaccinated from PopuvsVacc
order by percentage_people_vaccinated;




