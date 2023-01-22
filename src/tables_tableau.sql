
-- First table for Tableau
Select 
	SUM( cast(new_cases as float)) as total_cases, 
	SUM( cast(new_deaths as float)) as total_deaths, 
	SUM( cast(new_deaths as float)) / SUM(cast(new_cases as float))*100 as DeathPercentage
From ProjectCovid..covid_deaths$
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2



-- Second table for Tableau
Select 
	location,
	SUM(cast(new_deaths as float)) as TotalDeathCount
From ProjectCovid..covid_deaths$

Where continent is null 
	and location not in ('World', 'European Union', 'International') and location NOT LIKE '%income%'
Group by location
order by TotalDeathCount desc



-- Third Table for tableau
-- Countries with Highest Infection Rate compared to Population

Select 
	Location, Population, 
	MAX(total_cases) as HighestInfectionCount,  
	MAX( cast(total_cases as float)/cast(population as float)) *100 as PercentPopulationInfected

From ProjectCovid..covid_deaths$
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc


-- Four table: Countries with Highest Infection Rate compared to Population
Select 
	Location, Population, date,
	MAX(total_cases) as HighestInfectionCount,  
	MAX( cast(total_cases as float)/cast(population as float)) *100 as PercentPopulationInfected

From ProjectCovid..covid_deaths$
Group by Location, Population, date
order by PercentPopulationInfected desc