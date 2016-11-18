-- For country specific without coordinates
SELECT ou.code, ou.name,ou.coordinates, core.level, level3.name as level3name, level4.name as level4name, level5.name as level5name, level6.name as level6name, level7.name as level7name, level8.name as level8name FROM _orgunitstructure core 
INNER JOIN organisationunit AS OU ON core.organisationunituid = OU.uid 
INNER JOIN organisationunit AS level3 ON core.uidlevel3 = level3.uid 
LEFT JOIN organisationunit AS level4 ON core.uidlevel4 = level4.uid 
LEFT JOIN organisationunit AS level5 ON core.uidlevel5 = level5.uid 
LEFT JOIN organisationunit AS level6 ON core.uidlevel6 = level6.uid 
LEFT JOIN organisationunit AS level7 ON core.uidlevel7 = level7.uid 
LEFT JOIN organisationunit AS level8 ON core.uidlevel8 = level8.uid 
where level3.name = 'Lesotho' AND ou.coordinates IS NULL ORDER BY level3name, level4name, level5name, level6name, level7name, level8name

-- For OU's without org unit type and no coordinates

SELECT og.name, ou.code, ou.name,ou.coordinates, core.level, level3.name as level3name, level4.name as level4name, level5.name as level5name, level6.name as level6name, level7.name as level7name, level8.name as level8name FROM _orgunitstructure core 
INNER JOIN organisationunit AS OU ON core.organisationunituid = OU.uid 
INNER JOIN organisationunit AS level3 ON core.uidlevel3 = level3.uid 
INNER JOIN orgunitgroupmembers AS om ON (om.organisationunitid = ou. organisationunitid)
INNER JOIN orgunitgroup AS og ON (og.orgunitgroupid = om.orgunitgroupid)
LEFT JOIN organisationunit AS level4 ON core.uidlevel4 = level4.uid 
LEFT JOIN organisationunit AS level5 ON core.uidlevel5 = level5.uid 
LEFT JOIN organisationunit AS level6 ON core.uidlevel6 = level6.uid 
LEFT JOIN organisationunit AS level7 ON core.uidlevel7 = level7.uid 
LEFT JOIN organisationunit AS level8 ON core.uidlevel8 = level8.uid 
WHERE ou.coordinates IS NULL ORDER BY level3name, level4name, level5name, level6name, level7name, level8name LIMIT 100

-- For OU's with org unit type but excludes Facility without coordinates

SELECT og.name as type, ou.code, ou.name,ou.coordinates, core.level, level3.name as level3name, level4.name as level4name, level5.name as level5name, level6.name as level6name, level7.name as level7name, level8.name as level8name FROM _orgunitstructure core 
INNER JOIN organisationunit AS OU ON core.organisationunituid = OU.uid 
INNER JOIN organisationunit AS level3 ON core.uidlevel3 = level3.uid 
INNER JOIN orgunitgroupmembers AS om ON (om.organisationunitid = ou. organisationunitid) 
INNER JOIN orgunitgroup AS og ON (og.orgunitgroupid = om.orgunitgroupid) 
LEFT JOIN organisationunit AS level4 ON core.uidlevel4 = level4.uid 
LEFT JOIN organisationunit AS level5 ON core.uidlevel5 = level5.uid 
LEFT JOIN organisationunit AS level6 ON core.uidlevel6 = level6.uid 
LEFT JOIN organisationunit AS level7 ON core.uidlevel7 = level7.uid 
LEFT JOIN organisationunit AS level8 ON core.uidlevel8 = level8.uid 
WHERE ou.coordinates IS NOT NULL AND og.name != 'Facility' ORDER BY level3name, level4name, level5name, level6name, level7name, level8name LIMIT 100

-- For OU's with org unit type and includes Facility with coordinates

SELECT og.name as type, ou.uid, ou.code, ou.name,ou.coordinates, core.level, level3.name as level3name, level4.name as level4name, level5.name as level5name, level6.name as level6name, level7.name as level7name, level8.name as level8name FROM _orgunitstructure core 
INNER JOIN organisationunit AS OU ON core.organisationunituid = OU.uid 
INNER JOIN organisationunit AS level3 ON core.uidlevel3 = level3.uid 
INNER JOIN orgunitgroupmembers AS om ON (om.organisationunitid = ou. organisationunitid) 
INNER JOIN orgunitgroup AS og ON (og.orgunitgroupid = om.orgunitgroupid) 
LEFT JOIN organisationunit AS level4 ON core.uidlevel4 = level4.uid 
LEFT JOIN organisationunit AS level5 ON core.uidlevel5 = level5.uid 
LEFT JOIN organisationunit AS level6 ON core.uidlevel6 = level6.uid 
LEFT JOIN organisationunit AS level7 ON core.uidlevel7 = level7.uid 
LEFT JOIN organisationunit AS level8 ON core.uidlevel8 = level8.uid 
WHERE (ou.coordinates IS NOT NULL OR ou.coordinates IS NULL) AND og.name IN ('Facility', 'Medical Store: Central') ORDER BY level3name, level4name, level5name, level6name, level7name, level8name LIMIT 100

-- Used to solve ticket 4992 (Nigeria)

SELECT og.name as type, ou.uid, ou.code, ou.name,ou.coordinates, core.level, level2.name,level3.name as level3name, level4.name as level4name, level5.name as level5name FROM _orgunitstructure core 
INNER JOIN organisationunit AS OU ON core.organisationunituid = OU.uid 
INNER JOIN organisationunit AS level2 ON core.uidlevel3 = level3.uid
INNER JOIN organisationunit AS level3 ON core.uidlevel3 = level3.uid 
INNER JOIN orgunitgroupmembers AS om ON (om.organisationunitid = ou. organisationunitid) 
INNER JOIN orgunitgroup AS og ON (og.orgunitgroupid = om.orgunitgroupid) 
LEFT JOIN organisationunit AS level4 ON core.uidlevel4 = level4.uid 
LEFT JOIN organisationunit AS level5 ON core.uidlevel5 = level5.uid 
WHERE level3.name = 'Nigeria' AND(ou.coordinates IS NOT NULL OR ou.coordinates IS NULL) AND og.name = 'Facility' ORDER BY level3name, level4name, level5name LIMIT 100

-- Used to get all facilities with coordinates globally

SELECT o.uid AS uid, o.code as code, o2.name AS level2, o3.name AS level3, o4.name AS level4, o5.name AS level5, o6.name AS level6, o7.name AS level7, o8.name AS level8, o9.name AS level9, o.name AS facility, o.coordinates, a.datavalue_count from organisationunit o 
join _orgunitstructure ous ON ous.organisationunitid = o.organisationunitid join organisationunit o2 ON o2.organisationunitid = ous.idlevel2 
join organisationunit o3 ON o3.organisationunitid = ous.idlevel3 LEFT JOIN organisationunit o4 ON o4.organisationunitid = ous.idlevel4 
LEFT JOIN organisationunit o5 ON o5.organisationunitid = ous.idlevel5 LEFT JOIN organisationunit o6 ON o6.organisationunitid = ous.idlevel6 
LEFT JOIN organisationunit o7 ON o7.organisationunitid = ous.idlevel7 LEFT JOIN organisationunit o8 ON o8.organisationunitid = ous.idlevel8 
LEFT JOIN organisationunit o9 ON o9.organisationunitid = ous.idlevel9 LEFT JOIN orgunitgroupmembers m ON m.organisationunitid = o.organisationunitid 
LEFT JOIN orgunitgroup g ON g.orgunitgroupid = m.orgunitgroupid 
join (select dv.sourceid, count(*) AS datavalue_count from datavalue dv group by dv.sourceid) a ON a.sourceid = o.organisationunitid where o2.name = 'Europe' AND g.name = 'Facility'
ORDER BY o2.name, o3.name, o4.name, o5.name, o6.name, o7.name, o8.name, o9.name

-- ('Angola','Botswana','Burundi','Cameroon','Cote d''Ivoire','Democratic Republic of the Congo','Ethiopia')
-- ('Ghana','Kenya','Lesotho','Malawi','Mozambique')
-- ('Namibia','Nigeria','Rwanda','South Africa','South Sudan')
-- ('Swaziland','Tanzania','Uganda','Zambia','Zimbabwe')

SELECT o.uid AS uid, o.code as code, o2.name AS level2, o3.name AS level3, o4.name AS level4, o5.name AS level5, o6.name AS level6, o7.name AS level7, o8.name AS level8, o9.name AS level9, o.name AS facility, o.coordinates, a.datavalue_count from organisationunit o 
join _orgunitstructure ous ON ous.organisationunitid = o.organisationunitid join organisationunit o2 ON o2.organisationunitid = ous.idlevel2 
join organisationunit o3 ON o3.organisationunitid = ous.idlevel3 LEFT JOIN organisationunit o4 ON o4.organisationunitid = ous.idlevel4 
LEFT JOIN organisationunit o5 ON o5.organisationunitid = ous.idlevel5 LEFT JOIN organisationunit o6 ON o6.organisationunitid = ous.idlevel6 
LEFT JOIN organisationunit o7 ON o7.organisationunitid = ous.idlevel7 LEFT JOIN organisationunit o8 ON o8.organisationunitid = ous.idlevel8 
LEFT JOIN organisationunit o9 ON o9.organisationunitid = ous.idlevel9 LEFT JOIN orgunitgroupmembers m ON m.organisationunitid = o.organisationunitid 
LEFT JOIN orgunitgroup g ON g.orgunitgroupid = m.orgunitgroupid 
join (select dv.sourceid, count(*) AS datavalue_count from datavalue dv group by dv.sourceid) a ON a.sourceid = o.organisationunitid 
where o3.name IN ('Angola','Botswana','Burundi','Cameroon','Cote d''Ivoire','Democratic Republic of the Congo','Ethiopia') AND g.name = 'Facility' 
ORDER BY o2.name, o3.name, o4.name, o5.name, o6.name, o7.name, o8.name, o9.name