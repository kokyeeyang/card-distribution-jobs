-- question
SELECT 
    Jobs.id AS `Jobs__id`,
    Jobs.name AS `Jobs__name`,
    Jobs.media_id AS `Jobs__media_id`,
    Jobs.job_category_id AS `Jobs__job_category_id`,
    Jobs.job_type_id AS `Jobs__job_type_id`,
    Jobs.description AS `Jobs__description`,
    Jobs.detail AS `Jobs__detail`,
    Jobs.business_skill AS `Jobs__business_skill`,
    Jobs.knowledge AS `Jobs__knowledge`,
    Jobs.location AS `Jobs__location`,
    Jobs.activity AS `Jobs__activity`,
    Jobs.academic_degree_doctor AS `Jobs__academic_degree_doctor`,
    Jobs.academic_degree_master AS `Jobs__academic_degree_master`,
    Jobs.academic_degree_professional AS `Jobs__academic_degree_professional`,
    Jobs.academic_degree_bachelor AS `Jobs__academic_degree_bachelor`,
    Jobs.salary_statistic_group AS `Jobs__salary_statistic_group`,
    Jobs.salary_range_first_year AS `Jobs__salary_range_first_year`,
    Jobs.salary_range_average AS `Jobs__salary_range_average`,
    Jobs.salary_range_remarks AS `Jobs__salary_range_remarks`,
    Jobs.restriction AS `Jobs__restriction`,
    Jobs.estimated_total_workers AS `Jobs__estimated_total_workers`,
    Jobs.remarks AS `Jobs__remarks`,
    Jobs.url AS `Jobs__url`,
    Jobs.seo_description AS `Jobs__seo_description`,
    Jobs.seo_keywords AS `Jobs__seo_keywords`,
    Jobs.sort_order AS `Jobs__sort_order`,
    Jobs.publish_status AS `Jobs__publish_status`,
    Jobs.version AS `Jobs__version`,
    Jobs.created_by AS `Jobs__created_by`,
    Jobs.created AS `Jobs__created`,
    Jobs.modified AS `Jobs__modified`,
    Jobs.deleted AS `Jobs__deleted`,
    JobCategories.id AS `JobCategories__id`,
    JobCategories.name AS `JobCategories__name`,
    JobCategories.sort_order AS `JobCategories__sort_order`,
    JobCategories.created_by AS `JobCategories__created_by`,
    JobCategories.created AS `JobCategories__created`,
    JobCategories.modified AS `JobCategories__modified`,
    JobCategories.deleted AS `JobCategories__deleted`,
    JobTypes.id AS `JobTypes__id`,
    JobTypes.name AS `JobTypes__name`,
    JobTypes.job_category_id AS `JobTypes__job_category_id`,
    JobTypes.sort_order AS `JobTypes__sort_order`,
    JobTypes.created_by AS `JobTypes__created_by`,
    JobTypes.created AS `JobTypes__created`,
    JobTypes.modified AS `JobTypes__modified`,
    JobTypes.deleted AS `JobTypes__deleted`
FROM jobs Jobs
LEFT JOIN jobs_personalities JobsPersonalities
ON Jobs.id = (JobsPersonalities.job_id)
LEFT JOIN personalities Personalities
ON (Personalities.id = (JobsPersonalities.personality_id)
AND (Personalities.deleted) IS NULL)
LEFT JOIN jobs_practical_skills JobsPracticalSkills
ON Jobs.id = (JobsPracticalSkills.job_id)
LEFT JOIN practical_skills PracticalSkills
ON (PracticalSkills.id = (JobsPracticalSkills.practical_skill_id)
AND (PracticalSkills.deleted) IS NULL)
LEFT JOIN jobs_basic_abilities JobsBasicAbilities
ON Jobs.id = (JobsBasicAbilities.job_id)
LEFT JOIN basic_abilities BasicAbilities
ON (BasicAbilities.id = (JobsBasicAbilities.basic_ability_id)
AND (BasicAbilities.deleted) IS NULL)
LEFT JOIN jobs_tools JobsTools
ON Jobs.id = (JobsTools.job_id)
LEFT JOIN affiliates Tools
ON (Tools.type = 1
AND Tools.id = (JobsTools.affiliate_id)
AND (Tools.deleted) IS NULL)
LEFT JOIN jobs_career_paths JobsCareerPaths
ON Jobs.id = (JobsCareerPaths.job_id)
LEFT JOIN affiliates CareerPaths
ON (CareerPaths.type = 3
AND CareerPaths.id = (JobsCareerPaths.affiliate_id)
AND (CareerPaths.deleted) IS NULL)
LEFT JOIN jobs_rec_qualifications JobsRecQualifications
ON Jobs.id = (JobsRecQualifications.job_id)
LEFT JOIN affiliates RecQualifications
ON (RecQualifications.type = 2
AND RecQualifications.id = (JobsRecQualifications.affiliate_id)
AND (RecQualifications.deleted) IS NULL)
LEFT JOIN jobs_req_qualifications JobsReqQualifications
ON Jobs.id = (JobsReqQualifications.job_id)
LEFT JOIN affiliates ReqQualifications
ON (ReqQualifications.type = 2
AND ReqQualifications.id = (JobsReqQualifications.affiliate_id)
AND (ReqQualifications.deleted) IS NULL)
INNER JOIN job_categories JobCategories
ON (JobCategories.id = (Jobs.job_category_id)
AND (JobCategories.deleted) IS NULL)
INNER JOIN job_types JobTypes
ON (JobTypes.id = (Jobs.job_type_id)
AND (JobTypes.deleted) IS NULL)
WHERE ((JobCategories.name LIKE '%キャビンアテンダント%'
    OR JobTypes.name LIKE '%キャビンアテンダント%'
    OR Jobs.name LIKE '%キャビンアテンダント%'
    OR Jobs.description LIKE '%キャビンアテンダント%'
    OR Jobs.detail LIKE '%キャビンアテンダント%'
    OR Jobs.business_skill LIKE '%キャビンアテンダント%'
    OR Jobs.knowledge LIKE '%キャビンアテンダント%'
    OR Jobs.location LIKE '%キャビンアテンダント%'
    OR Jobs.activity LIKE '%キャビンアテンダント%'
    OR Jobs.salary_statistic_group LIKE '%キャビンアテンダント%'
    OR Jobs.salary_range_remarks LIKE '%キャビンアテンダント%'
    OR Jobs.restriction LIKE '%キャビンアテンダント%'
    OR Jobs.remarks LIKE '%キャビンアテンダント%'
    OR Personalities.name LIKE '%キャビンアテンダント%'
    OR PracticalSkills.name LIKE '%キャビンアテンダント%'
    OR BasicAbilities.name LIKE '%キャビンアテンダント%'
    OR Tools.name LIKE '%キャビンアテンダント%'
    OR CareerPaths.name LIKE '%キャビンアテンダント%'
    OR RecQualifications.name LIKE '%キャビンアテンダント%'
    OR ReqQualifications.name LIKE '%キャビンアテンダント%')
    AND publish_status = 1
    AND (Jobs.deleted) IS NULL
)
GROUP BY Jobs.id
ORDER BY Jobs.sort_order desc,
Jobs.id DESC LIMIT 50 OFFSET 0;


-- suggested improvements (Yee Yang)
SELECT 
    J.id AS `J__id`,
    J.name AS `J__name`,
    J.media_id AS `J__media_id`,
    J.job_category_id AS `J__job_category_id`,
    J.job_type_id AS `J__job_type_id`,
    J.description AS `J__description`,
    J.detail AS `J__detail`,
    J.business_skill AS `J__business_skill`,
    J.knowledge AS `J__knowledge`,
    J.location AS `J__location`,
    J.activity AS `J__activity`,
    J.academic_degree_doctor AS `J__academic_degree_doctor`,
    J.academic_degree_master AS `J__academic_degree_master`,
    J.academic_degree_professional AS `J__academic_degree_professional`,
    J.academic_degree_bachelor AS `J__academic_degree_bachelor`,
    J.salary_statistic_group AS `J__salary_statistic_group`,
    J.salary_range_first_year AS `J__salary_range_first_year`,
    J.salary_range_average AS `J__salary_range_average`,
    J.salary_range_remarks AS `J__salary_range_remarks`,
    J.restriction AS `J__restriction`,
    J.estimated_total_workers AS `J__estimated_total_workers`,
    J.remarks AS `J__remarks`,
    J.url AS `J__url`,
    J.seo_description AS `J__seo_description`,
    J.seo_keywords AS `J__seo_keywords`,
    J.sort_order AS `J__sort_order`,
    J.publish_status AS `J__publish_status`,
    J.version AS `J__version`,
    J.created_by AS `J__created_by`,
    J.created AS `J__created`,
    J.modified AS `J__modified`,
    J.deleted AS `J__deleted`,
    JC.id AS `JC__id`,
    JC.name AS `JC__name`,
    JC.sort_order AS `JC__sort_order`,
    JC.created_by AS `JC__created_by`,
    JC.created AS `JC__created`,
    JC.modified AS `JC__modified`,
    JC.deleted AS `JC__deleted`,
    JobTypes.id AS `JobTypes__id`,
    JobTypes.name AS `JobTypes__name`,
    JobTypes.job_category_id AS `JT__job_category_id`,
    JobTypes.sort_order AS `JT__sort_order`,
    JobTypes.created_by AS `JT__created_by`,
    JobTypes.created AS `JT__created`,
    JobTypes.modified AS `JT__modified`,
    JobTypes.deleted AS `JT__deleted`
FROM jobs J
INNER JOIN job_categories JC ON (JC.id = (J.job_category_id) AND (JC.deleted) IS NULL)
INNER JOIN job_types JT ON (JT.id = (J.job_type_id) AND (JT.deleted) IS NULL)
WHERE ((JC.name LIKE '%キャビンアテンダント%'
OR JT.name LIKE '%キャビンアテンダント%'
OR J.name LIKE '%キャビンアテンダント%'
OR J.description LIKE '%キャビンアテンダント%'
OR J.detail LIKE '%キャビンアテンダント%'
OR J.business_skill LIKE '%キャビンアテンダント%'
OR J.knowledge LIKE '%キャビンアテンダント%'
OR J.location LIKE '%キャビンアテンダント%'
OR J.activity LIKE '%キャビンアテンダント%'
OR J.salary_statistic_group LIKE '%キャビンアテンダント%'
OR J.salary_range_remarks LIKE '%キャビンアテンダント%'
OR J.restriction LIKE '%キャビンアテンダント%'
OR J.remarks LIKE '%キャビンアテンダント%'
OR P.name LIKE '%キャビンアテンダント%'
OR PS.name LIKE '%キャビンアテンダント%'
OR BA.name LIKE '%キャビンアテンダント%'
OR A.name LIKE '%キャビンアテンダント%'
OR CP.name LIKE '%キャビンアテンダント%'
OR A.name LIKE '%キャビンアテンダント%'
OR A.name LIKE '%キャビンアテンダント%')
AND publish_status = 1
AND (J.deleted) IS NULL)
-- got rid of all the left joins and replaced with AND EXISTS
-- check whether the id in jobs exists in jobs_personalities 
-- if at least one row exists, then return true, if not then return false
-- database engine can stop processing this subquery when at least one matching row is found
-- same logic applies to all the WHERE EXISTS below
AND EXISTS (
    SELECT 1 
    FROM jobs_personalities JP 
    WHERE J.id = JP.job_id
)
AND EXISTS (
    SELECT 1 
    FROM jobs_practical_skills JPS 
    WHERE J.id = JPS.job_id
)
AND EXISTS (
    SELECT 1 
    FROM practical_skills PS 
    WHERE J.id = PS.job_id
)
AND EXISTS (
    SELECT 1 
    FROM jobs_basic_abilities JBA 
    WHERE J.id = JBA.job_id
)
AND EXISTS (
    SELECT 1 
    FROM basic_abilities BA 
    WHERE BA.id = JBA.basic_ability_id
)
AND EXISTS (
    SELECT 1 
    FROM jobs_tools Jtools 
    WHERE J.id = JTools.job_id
)
AND EXISTS {
    SELECT 1
    FROM affiliates A  
    WHERE A.id = JTools.affiliate_id AND A.type = 1 AND A.deleted IS NULL
}
AND EXISTS {
    SELECT 1
    FROM jobs_rec_qualifications JRQ
    WHERE J.id = JRQ.job_id
}
AND EXISTS {
    SELECT 1
    FROM affiliates A
    WHERE A.id = JRQ.affiliate_id AND A.type = 2 AND A.deleted IS NULL
}
AND EXISTS {
    SELECT 1
    FROM jobs_career_paths JCP
    WHERE J.id = JCP.job_id
}
AND EXISTS (
    SELECT 1 
    FROM affiliates A 
    WHERE A.type = 3 AND A.id = JCP.affiliate_id AND A.deleted IS NULL
)
AND EXISTS (
    SELECT 1 
    FROM jobs_req_qualifications JREQ 
    WHERE J.id = JREQ.job_id
)
AND EXISTS (
    SELECT 1 
    FROM affiliates A 
    WHERE A.type = 2 AND A.id = JREQ.affiliate_id AND A.deleted IS NULL
)
GROUP BY Jobs.id
ORDER BY Jobs.sort_order desc,
Jobs.id DESC LIMIT 50 OFFSET 0;

-- 1. should shorten aliases
-- 2. get rid of unnessecary brackets in the IS NULL part  
-- 3. should evaluate whether the LIKE '%%' is neccessary as this is more resource intensive than a simple =
-- 4. add indexes on `job_category_id` and job_type_id because they are used in join conditions with the job_categories and job_types tables
-- eg:
-- ALTER TABLE jobs ADD INDEX idx_job_category_id (job_category_id);
-- ALTER TABLE jobs ADD INDEX idx_job_type_id (job_type_id);
-- ALTER TABLE jobs ADD INDEX idx_publish_status (publish_status);
-- ALTER TABLE jobs ADD INDEX idx_deleted (deleted);

