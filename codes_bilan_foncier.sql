-- Nombre de nouveaux sites en 2025* -- 
SELECT count(*) 
FROM sites_cen 
WHERE date_crea_site BETWEEN '2025-01-01' AND '2025-12-31'

	
-- Nombre total de sites en 2025* -- 
SELECT count(*) FROM sites_cen
WHERE date_crea_site < '2026-01-01'

	
-- Nombre d'hectares supplémentaires en 2025* (hors sites militaires) --
SELECT sum(surf_parc_maitrise_ha) 
FROM parcelles_cen 
WHERE 
	( 
		date_debut_ore 	BETWEEN '2025-01-01' AND '2025-12-31' 
		OR 
		date_acquisition BETWEEN '2025-01-01' AND '2025-12-31' 
) 
AND id_site_cen_parc NOT IN ('TORP','HTF','BREI','AUVO','FONT')
	
	
-- Nombre d'hectares supplémentaires en 2025* --
SELECT sum(surf_parc_maitrise_ha) 
FROM parcelles_cen 
WHERE 
	( 
		date_debut_ore 	BETWEEN '2025-01-01' AND '2025-12-31' 
		OR 
		date_acquisition BETWEEN '2025-01-01' AND '2025-12-31' 
);

-- Nombre total d'hectares (hors sites militaires) en 2025* --
SELECT sum(surf_parc_maitrise_ha)
FROM parcelles_cen
WHERE id_site_cen_parc NOT IN ('TORP','HTF','BREI','AUVO','FONT')
	AND date_crea_site < '2026-01-01'

	
-- Nombre total d'hectares en 2025* --
SELECT sum(surf_parc_maitrise_ha) 
FROM parcelles_cen
WHERE date_crea_site < '2026-01-01'

	
-- Nombre de communes concernées par les actions du Conservatoire en 2025* --
SELECT count(distinct insee_com)
FROM parcelles_cen
WHERE date_crea_site < '2026-01-01'

	
-- Nombre d'hectares en propriété du CEN  en 2025* --
SELECT sum(surf_parc_maitrise_ha)
FROM parcelles_cen
WHERE code_mfu2 = 'P1' AND date_crea_site < '2026-01-01'


-- Nombre d'hectares sous maîtrise d'usage (ORE ou baux emphytéoriques) en 2025* --
SELECT sum(surf_parc_maitrise_ha)
FROM parcelles_cen
WHERE code_mfu2 IN ('O', 'L1') AND date_crea_site < '2026-01-01'
