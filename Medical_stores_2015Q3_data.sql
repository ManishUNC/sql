SELECT ou.name AS orgunit , og.name as type, de.shortname as DataElement, ps.iso as period, dv.value FROM orgunitgroup og
INNER JOIN orgunitgroupmembers om ON (om.orgunitgroupid = og.orgunitgroupid)
INNER JOIN organisationunit ou ON (ou.organisationunitid = om.organisationunitid)
INNER JOIN datavalue dv ON (dv.sourceid = ou.organisationunitid)
INNER JOIN dataelement de on (de.dataelementid = dv.dataelementid)
INNER JOIN _periodstructure ps on (dv.periodid = ps.periodid) 
WHERE (og.orgunitgroupid = 16818339 OR og.orgunitgroupid = 16818338) AND de.shortname LIKE 'SC_STOCK%' AND ps.iso = '2015Q3'