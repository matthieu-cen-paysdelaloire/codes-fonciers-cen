-- Nombre de nouveaux sites en 2025* -- 
SELECT count(*) 
FROM sites_cen 
WHERE date_crea_site BETWEEN '2025-01-01' AND '2025-12-31'

-- Nombre total de sites -- 
SELECT count(*) FROM sites_cen

-- Nombre d'hectares supplémentaires en 2025* --
SELECT sum(surf_parc_maitrise_ha) 
FROM parcelles_cen 
WHERE 
	( 
		date_debut_ore 	BETWEEN '2025-01-01' AND '2025-12-31' 
		OR 
		date_acquisition BETWEEN '2025-01-01' AND '2025-12-31' 
);

-- Nombre total d'hectares --
SELECT sum(surf_parc_maitrise_ha) 
FROM parcelles_cen

-- Nombre de communes concernées par les actions du Conservatoire --
SELECT count(distinct insee_com)
FROM parcelles_cen

-- Nombre d'hectares sous maîtrise d'usage (ORE ou baux emphytéoriques) --
SELECT sum(surf_parc_maitrise_ha)
FROM parcelles_cen
WHERE code_mfu2 IN ('O', 'L1')
