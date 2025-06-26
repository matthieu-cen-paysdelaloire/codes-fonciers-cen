--Ajout de l'extension "postgres_fdw"
CREATE EXTENSION postgres_fdw		-- création de l'extension postgres_fdw dans le schéma "cen"
	SCHEMA "cen" ;

--Creation du serveur distant
CREATE SERVER fdw_fcen_paysdelaloire		-- créer le serveur 'fdw_fcen_paysdelaloire' (nom perso)
	FOREIGN DATA WRAPPER postgres_fdw		-- appel de l'extension postgres_fdw créé précédement
	OPTIONS (dbname 'depot_fcen', host '91.206.198.168', port '5432');		--données pour se connecter à la base

--Creation du mappage User
CREATE USER MAPPING			-- création de l'utilisateur d'accès au serveur 
	FOR postgres			-- nom de l'utilisateur qui aura accès au serveur distant (doit déjà exister) 
	SERVER fdw_fcen_paysdelaloire		-- connexion au serveur distant mis en place précédement
	OPTIONS (password 'CEN24:Samepik,Grav.Rico24!', user 'cen24');		--options de connexion


--Creation table distante site
DROP FOREIGN TABLE IF EXISTS cen.site_cen_24_pdll;
CREATE FOREIGN TABLE cen.site_cen_24_pdll (		-- création d'une table distante (spécification du schéma, doit être un schéma existant)
	--id int8 NULL,
	id_site_cen varchar(50) NULL,
	geom public.geometry(multipolygon, 2154) NULL,	--attention au schéma 'public'
	id_cen varchar(2) NULL,
	id_site_inpn varchar NULL,
	id_site_fcen varchar(9) NULL,
	nom_site varchar(254) NULL,
	id_rnx_inpn varchar(9) NULL,
	site_lien_rnx int4 NULL,
	site_rnx_surface_m2 float8 NULL,
	ens int4 NULL,
	site_cdl int4 NULL,
	n2000_directive varchar NULL,
	n2000_surface_m2 int4 NULL,
	terrain_militaire int4 NULL,
	site_marin varchar(1) NULL,
	nb_contrat_agri int4 NULL,
	nb_agri int4 NULL,
	surf_contra_m2 int4 NULL,
	code_milieu_princ varchar(2) NULL,
	nature_site_inpn varchar(1) NULL,
	geol_site_inpn varchar(1) NULL,
	code_geol varchar NULL,
	carto_habitats int4 NULL,
	typo_carto_habitat int4 NULL,
	surf_carto_habitat_m2 int4 NULL,
	date_crea_site date NULL,
	date_maj_site date NULL,
	nature_perimetre int4 NULL,
	source_geom_site_nature varchar NULL,
	source_geom_site_date date NULL,
	echelle_num_site int4 NULL,
	precision_num_site varchar(2) NULL,
	gestionnaire_site varchar(100) NULL,
	operateur varchar(100) NULL,
	surf_libre_evolution_m2 int4 NULL,
	doc_gestion_presence int4 NULL,
	doc_gestion_nom varchar(254) NULL,
	doc_gestion_evaluation varchar NULL,
	doc_gestion_date_ini date NULL,
	doc_gestion_date_maj date NULL,
	doc_gestion_date_fin date NULL,
	surf_doc_gestion_m2 int4 NULL,
	url_fiche_inpn varchar NULL,
	url_fiche_cen varchar(500) NULL,
	doc_justif_admin int4 NULL,
	ouverture_public int4 NULL,
	description_site text NULL,
	url_site_photo varchar(500) NULL,
	sensibilite int4 NULL,
	remq_sensibilite varchar NULL,
	non_diffusion varchar(1) NULL
)
SERVER fdw_fcen_paysdelaloire
OPTIONS (schema_name 'fcen', table_name 'site_cen_24');

-- Permissions

ALTER TABLE cen.site_cen_24_pdll OWNER TO postgres;
GRANT ALL ON TABLE cen.site_cen_24_pdll TO postgres;		-- attribution de toutes les autorisations à l'utilisateur défini


--Creation de la table distante Parcelle
DROP FOREIGN TABLE IF EXISTS cen.parcelle_cen_24_pdll;
CREATE FOREIGN TABLE cen.parcelle_cen_24_pdll (		-- création d'une table distante (spécification du schéma, doit être un schéma existant)
	id serial,
	geom public.geometry(multipolygon, 2154) NULL,
	id_site_cen_parc varchar(50) NULL,
	id_site_fcen_parc varchar(9) NULL,
	insee_dep varchar(2) NULL,
	insee_com varchar(5) NULL,
	num_section varchar(10) NULL,
	num_parc varchar(14) NULL,
	code_mfu1 varchar NULL,
	code_mfu2 varchar NULL,
	type_prop varchar NULL,
	mesure_compens int4 NULL,
	surf_ore_m2 int4 NULL,
	date_debut_ore date NULL,
	date_fin_ore date NULL,
	doc_foncier int4 NULL,
	source_doc_foncier varchar NULL,
	parc_gestion_rnx int4 NULL,
	surf_parc_maitrise_m2 int4 NULL,
	source_geom_parc_nature int4 NULL,
	source_geom_parc_date date NULL,
	echelle_num_parc int4 NULL,
	source_surf_parc int4 NULL,
	date_maj_parcelle date NULL,
	bnd int4 NULL,
	pour_part int4 NULL,
	domaine_public int4 NULL,
	id_proprietaire varchar(2) NULL
)
SERVER fdw_fcen_paysdelaloire
OPTIONS (schema_name 'fcen', table_name 'parcelle_cen_24');

-- Permissions

ALTER TABLE cen.parcelle_cen_24_pdll OWNER TO postgres;
GRANT ALL ON TABLE cen.parcelle_cen_24_pdll TO postgres;		-- attribution de toutes les autorisations à l'utilisateur défini



-- Insersion des données sites 

TRUNCATE TABLE cen.site_cen_24_pdll;
INSERT INTO cen.site_cen_24_pdll (id_site_cen, geom, id_cen, id_site_inpn, id_site_fcen, nom_site, id_rnx_inpn, site_lien_rnx, site_rnx_surface_m2, ens, site_cdl, n2000_directive, n2000_surface_m2, terrain_militaire, site_marin, nb_contrat_agri, nb_agri, surf_contra_m2, code_milieu_princ, nature_site_inpn, code_geol, carto_habitats, typo_carto_habitat, surf_carto_habitat_m2, date_crea_site, date_maj_site, nature_perimetre, source_geom_site_nature, source_geom_site_date, echelle_num_site, precision_num_site, gestionnaire_site, operateur, surf_libre_evolution_m2, doc_gestion_presence, doc_gestion_nom, doc_gestion_evaluation, doc_gestion_date_ini, doc_gestion_date_maj, doc_gestion_date_fin, surf_doc_gestion_m2, url_fiche_inpn, url_fiche_cen, doc_justif_admin, ouverture_public, description_site, url_site_photo, sensibilite, remq_sensibilite, non_diffusion)
SELECT id_site_cen, geom, id_cen, id_site_inpn, id_site_fcen_parc, nom_site, id_rnx_inpn, site_lien_rnx, site_rnx_surface_m2, ens, site_cdl, n2000_directive, n2000_surface_m2, terrain_militaire, site_marin, nbre_contrat_agri, nb_agri, surf_contra_m2, code_milieu_princ, nature_site_inpn, code_geol, carto_habitats, typo_carto_habitat, surf_carto_habitat_m2, date_crea_site, date_maj_site, nature_perimetre, source_geom_site_nature, source_geom_site_date, echelle_num_site, precision_num_site, gestionnaire_site, operateur, surf_libre_evolution_m2, doc_gestion_presence, doc_gestion_nom, doc_gestion_evaluation, doc_gestion_date_ini, doc_gestion_date_maj, doc_gestion_date_fin, surf_doc_gestion_m2, url_fiche_inpn, url_fiche_cen, doc_justif_admin, ouverture_public, description_site, url_site_photo, sensibilite, remq_sensibilite, non_diffusion
FROM cen.sites_cen
WHERE date_crea_site < '2025-01-01'; 


-- Insersion des données parcelles
TRUNCATE TABLE cen.parcelle_cen_24_pdll;
INSERT INTO cen.parcelle_cen_24_pdll (geom, id_site_cen_parc, id_site_fcen_parc, insee_dep, insee_com, num_section, num_parc, code_mfu1, code_mfu2, type_prop, mesure_compens, surf_ore_m2, date_debut_ore, date_fin_ore, doc_foncier, source_doc_foncier, parc_gestion_rnx, surf_parc_maitrise_m2, source_geom_parc_nature, source_geom_parc_date, echelle_num_parc, source_surf_parc, date_maj_parcelle, bnd, pour_part, domaine_public, id_proprietaire)
SELECT geom, id_site_cen_parc, id_site_fcen_parc, insee_dep, insee_com, num_section, num_parc_act, code_mfu1, code_mfu2, type_prop, mesure_compens, surf_ore_m2, date_debut_ore, date_fin_ore, doc_foncier, source_doc_foncier, parc_gestion_rnx, SUM(surf_parc_maitrise_m2) OVER (PARTITION BY num_parc_act), source_geom_parc_nature, source_geom_parc_date, echelle_num_parc, source_surf_parc, date_maj_parcelle, bnd, pour_part, domaine_public, id_proprietaire
FROM cen.parcelles_cen
WHERE "tresfonds" != 1 AND date_acquisition < '2025-01-01' OR date_debut_ore < '2025-01-01' ;

--Suppression des doublons de la base de donnée parcellaire
WITH sup_doublons AS (
	SELECT id, num_parc, row_number() over (partition by num_parc order by id ASC) AS RowNum
	FROM cen.parcelle_cen_24_pdll
)
	-- Delete rows from the 'customers' table where the row number is greater than 1
DELETE FROM cen.parcelle_cen_24_pdll
WHERE id IN (SELECT id FROM sup_doublons WHERE RowNum > 1);

UPDATE cen.parcelle_cen_24_pdll
SET code_mfu2 = NULL
WHERE code_mfu2 = 'O';
