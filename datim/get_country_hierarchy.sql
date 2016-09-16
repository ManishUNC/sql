SELECT ou.uid, ou.code, core.level, level3.name as level3name, level4.name as level4name, level5.name as level5name, level6.name as level6name, level7.name as level7name, level8.name as level8name,ou.name FROM _orgunitstructure core 
INNER JOIN organisationunit AS OU ON core.organisationunituid = OU.uid 
INNER JOIN organisationunit AS level3 ON core.uidlevel3 = level3.uid 
LEFT JOIN organisationunit AS level4 ON core.uidlevel4 = level4.uid 
LEFT JOIN organisationunit AS level5 ON core.uidlevel5 = level5.uid 
LEFT JOIN organisationunit AS level6 ON core.uidlevel6 = level6.uid 
LEFT JOIN organisationunit AS level7 ON core.uidlevel7 = level7.uid 
LEFT JOIN organisationunit AS level8 ON core.uidlevel8 = level8.uid 
WHERE level4.name LIKE 'Trinidad%' ORDER BY level3name, level4name, level5name, level6name, level7name, level8name