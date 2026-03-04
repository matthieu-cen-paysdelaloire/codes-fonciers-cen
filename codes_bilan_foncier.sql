-- Nombre de nouveaux sites en 2025* -- 
SELECT count(*) 
FROM sites_cen 
WHERE date_crea_site BETWEEN '2025-01-01' AND '2025-12-31';

	
-- Nombre total de sites en 2025* -- 
SELECT count(*) FROM sites_cen
WHERE date_crea_site < '2026-01-01';

	
-- Nombre d'hectares supplémentaires en 2025* (hors sites militaires) --
SELECT sum(surf_parc_maitrise_ha) 
FROM parcelles_cen 
WHERE 
	( 
		date_debut_ore 	BETWEEN '2025-01-01' AND '2025-12-31' 
		OR 
		date_acquisition BETWEEN '2025-01-01' AND '2025-12-31' 
) 
AND id_site_cen_parc NOT IN ('TORP','HTF','BREI','AUVO','FONT');
	
	
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
WHERE 
	-- 1. Exclusion des sites militaires
    id_site_cen_parc NOT IN ('TORP','HTF','BREI','AUVO','FONT')
    
    AND 
    -- 2. Entrée en gestion historique jusqu'en 2025 inclus
    (date_debut_ore < '2026-01-01' OR date_acquisition < '2026-01-01')
    
    AND 
    -- 3. Toujours sous gestion à la fin de 2025
    (date_fin_ore IS NULL OR date_fin_ore > '2025-12-31');


-- Nombre total d'hectares de sites militaires en 2025* --
SELECT sum(surf_parc_maitrise_ha)
FROM parcelles_cen
WHERE 
	-- 1. Ne garder que les sites militaires
    id_site_cen_parc IN ('TORP','HTF','BREI','AUVO','FONT')
    
    AND 
    -- 2. Entrée en gestion historique jusqu'en 2025 inclus
    (date_debut_ore < '2026-01-01' OR date_acquisition < '2026-01-01')
    
    AND 
    -- 3. Toujours sous gestion à la fin de 2025
    (date_fin_ore IS NULL OR date_fin_ore > '2025-12-31');

	
-- Nombre total d'hectares en 2025* --
SELECT sum(surf_parc_maitrise_ha) 
FROM parcelles_cen
WHERE 
	-- 1. La parcelle doit être entrée en gestion avant ou pendant 2025
    (date_debut_ore < '2026-01-01' OR date_acquisition < '2026-01-01')
    AND 
    -- 2. Elle ne doit pas être sortie de gestion avant la fin de 2025
    (date_fin_ore IS NULL OR date_fin_ore > '2025-12-31');

	
-- Nombre de communes concernées par les actions du Conservatoire en 2025* --
SELECT count(distinct insee_com)
FROM parcelles_cen
WHERE
	-- 1. La parcelle (ou le site) doit exister avant ou pendant 2025
    (date_debut_ore < '2026-01-01' OR date_acquisition < '2026-01-01')
    AND 
    -- 2. Elle doit encore être sous gestion à la fin de 2025
    (date_fin_ore IS NULL OR date_fin_ore > '2025-12-31');


-- Nombre d'hectares en propriété du CEN  en 2025* --
SELECT sum(surf_parc_maitrise_ha)
FROM parcelles_cen
WHERE
	-- 1. Filtrer sur la maîtrise foncière (Propriété)
    code_mfu2 = 'P1' 
    AND 
    -- 2. La parcelle doit être entrée en patrimoine avant ou pendant 2025
    (date_acquisition < '2026-01-01' OR date_debut_ore < '2026-01-01')
    AND 
    -- 3. Elle doit être encore en propriété à la fin de 2025
    (date_fin_ore IS NULL OR date_fin_ore > '2025-12-31');


-- Nombre d'hectares sous maîtrise d'usage (ORE ou baux emphytéoriques) en 2025* --
SELECT sum(surf_parc_maitrise_ha)
FROM parcelles_cen
WHERE 
    -- 1. Filtrer sur la maîtrise d'usage (ORE et Baux)
    code_mfu2 IN ('O', 'L1')
    
    AND 
    -- 2. Entrée en gestion avant ou pendant 2025
    (date_debut_ore < '2026-01-01' OR date_acquisition < '2026-01-01')
    
    AND 
    -- 3. Toujours sous contrat à la fin de 2025
    (date_fin_ore IS NULL OR date_fin_ore > '2025-12-31');


-- Nombre d'hectares de sites Natura 2000 --
SELECT round(sum(n2000_surface_m2)/10000, 4)
FROM sites_cen
WHERE 
    -- 1. Filtrer sur la directive Natura 2000
    n2000_directive IN ('ZPS', 'ZSC', 'ZPS_ZSC')
    
    AND 
    -- 2. Site créer avant ou pendant 2025
    date_crea_site < '2026-01-01'
