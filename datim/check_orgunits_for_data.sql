-- includes dataset but they get repeated 

SELECT ou.uid, ou.name as orgname, ds.shortname as datasetname, de.uid as dataelement, de.code dataelementcode, ps.iso as period, co.uid as disaggregate, gh.uid as mechanism , dv.value, dv.lastupdated FROM datavalue dv 
-- checks for data for a particular org units includes dataset (datasets get repeated)

INNER JOIN organisationunit ou on (dv.sourceid = ou.organisationunitid) 
INNER JOIN _periodstructure ps on (dv.periodid = ps.periodid) 
INNER JOIN dataelement de on (de.dataelementid = dv.dataelementid) 
INNER JOIN categoryoptioncombo co on (co.categoryoptioncomboid = dv.categoryoptioncomboid) 
INNER JOIN categoryoptioncombo gh on (gh.categoryoptioncomboid = dv.attributeoptioncomboid)
INNER JOIN datasetsource dss on (dss.sourceid = ou.organisationunitid)
INNER JOIN dataset ds on (ds.datasetid = dss.datasetid)
INNER JOIN dataset ds on (ds.datasetid = dm.datasetid)
INNER JOIN datasetmembers dm on (dm.dataelementid = de.dataelementid) 
WHERE ou.uid = 'WJlPkJdb5xb' OR ou.uid = 'JuKf6u400L5' OR ou.uid = 'HLR8kQKGLzU' OR ou.uid = 'ltSETzFTBXI' 
OR ou.uid = 'vncLNiGh5yn' OR ou.uid = 'bbFetbhJ297' OR ou.uid = 'V6mRoVkM4Ru'

-- checks for data for a particular org unit and doesn't include dataset

SELECT ou.uid, ou.name as SiteName, de.shortname as DataElement, de.code as DataElementCode, de.uid as dataelementUid, ps.iso as period, dv.value, dv.storedby, dv.lastupdated FROM datavalue dv 
INNER JOIN organisationunit ou on (dv.sourceid = ou.organisationunitid) 
INNER JOIN _periodstructure ps on (dv.periodid = ps.periodid) 
INNER JOIN dataelement de on (de.dataelementid = dv.dataelementid)
WHERE ou.uid = 'WN9Ys0h43os'

-- gets data for Uganda for particular mechanisms

SELECT ou.uid, ou.name as orgname, de.uid as dataelement, de.code dataelementcode, ps.iso as period, co.uid as disaggregate, gh.uid as mechanism , dv.value, dv.lastupdated FROM datavalue dv 
INNER JOIN organisationunit ou on (dv.sourceid = ou.organisationunitid) 
INNER JOIN _periodstructure ps on (dv.periodid = ps.periodid) 
INNER JOIN dataelement de on (de.dataelementid = dv.dataelementid) 
INNER JOIN categoryoptioncombo co on (co.categoryoptioncomboid = dv.categoryoptioncomboid) 
INNER JOIN categoryoptioncombo gh on (gh.categoryoptioncomboid = dv.attributeoptioncomboid)
INNER JOIN datasetsource dss on (dss.sourceid = ou.organisationunitid)
WHERE ou.uid = 'WN9Ys0h43os' AND (gh.uid = 'b3BshzziY5r' OR gh.uid = 'rpFB1EnTc8d')