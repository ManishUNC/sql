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