SELECT *
FROM [COVIDDeathsUS - Sheet1]
order by 4

SELECT *
FROM COVIDVaccinationsUS
order by 4

--Looking at Percentage of Deaths per cases
SELECT [location],[date],population,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
FROM [COVIDDeathsUS - Sheet1]

--Looking at Total Cases per population
SELECT [location],[date],population,total_cases,total_deaths,(total_cases/Population)*100 as InfectionPercentage
FROM [COVIDDeathsUS - Sheet1]

--Looking at Infection Rate
SELECT [location],population,MAX(total_cases) as HighestInfectionCount,MAX((total_cases/Population)*100) as InfectionPercentage
FROM [COVIDDeathsUS - Sheet1]
GROUP BY [location],Population

--Looking at Death Count
SELECT [location],population,MAX(total_deaths) as HighestDeathCount
FROM [COVIDDeathsUS - Sheet1]
GROUP by [location],Population

--Looking at Location Counts
SELECT [location],population,MAX(total_cases) as HighestInfectionCount,MAX((total_cases/Population)*100) as InfectionPercentage
FROM [COVIDDeathsUS - Sheet1]
GROUP BY [location],Population

--Looking at Overall numbers
SELECT date, SUM(new_cases), SUM(cast(new_deaths as float)),(SUM(cast(new_deaths as float))/SUM(new_cases)) *100 as DailyDeathPercentage
FROM [COVIDDeathsUS - Sheet1]



SELECT dea.[location], dea.[date],dea.Population,vacc.people_fully_vaccinated,(people_fully_vaccinated/CAST(Population as float))*100 as PercentPopFullyVaccinated
FROM [COVIDDeathsUS - Sheet1] dea
JOIN COVIDVaccinationsUS vacc
    on dea.[location] = vacc.[location]
    and dea.[date] = vacc.[date]

--TEMP TABLE

SELECT dea.[location], dea.[date],dea.Population,vacc.people_fully_vaccinated,(people_fully_vaccinated/CAST(Population as float))*100 as PercentPopFullyVaccinated
INTO PercentPopulationFullyVaxxed
FROM [COVIDDeathsUS - Sheet1] dea
JOIN COVIDVaccinationsUS vacc
    on dea.[location] = vacc.[location]
    and dea.[date] = vacc.[date]

Select *
FROM PercentPopulationFullyVaxxed





