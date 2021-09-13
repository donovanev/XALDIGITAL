--¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?
WITH AEROCTE AS(
	SELECT 
		id_aeropuerto 
		,COUNT(id_movimiento) AS CantidadMovimiento
	FROM [dbo].[vuelos] 
	GROUP BY id_aeropuerto)

SELECT 
	ae.nombre_aeropuerto
FROM [dbo].[aeropuertos] AS ae
JOIN AEROCTE AS v
	ON ae.id_aeropuerto = v.id_aeropuerto
WHERE V.CantidadMovimiento = (SELECT MAX(CantidadMovimiento) FROM AEROCTE);

--¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?
WITH arolineaCTE AS(
SELECT 
	id_aerolinea
	,count(id_aerolinea) AS total
FROM [dbo].[vuelos]
GROUP BY id_aerolinea)

SELECT 
	nombre_aerolinea
FROM [dbo].[aerolineas] AS a
JOIN arolineaCTE AS cte
	ON a.id_aerolinnea = cte.id_aerolinea
WHERE cte.total = (SELECT MAX(total) FROM arolineaCTE);

--¿En qué día se han tenido mayor número de vuelos?
WITH diaCTE AS(
SELECT 
	dia
	,count(dia) AS total
FROM [dbo].[vuelos]
GROUP BY dia)

SELECT 
	dia
FROM diaCTE
WHERE total = (SELECT MAX(total) FROM diaCTE);

--¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?
WITH arolineaCTE AS(
SELECT 
	id_aerolinea
	,dia
	,count(id_aerolinea) AS total
FROM [dbo].[vuelos]
GROUP BY id_aerolinea,dia)

SELECT 
	nombre_aerolinea
FROM [dbo].[aerolineas] AS a
JOIN arolineaCTE AS cte
	ON a.id_aerolinnea = cte.id_aerolinea
WHERE cte.total = (SELECT MAX(total) FROM arolineaCTE);