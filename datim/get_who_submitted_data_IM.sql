select dv.dataelementid, de.shortname as dataelement, ou.shortname as orgunit, co.code, dv.value, dv.storedby, dv.lastupdated from datavalue dv 
INNER JOIN dataelement de ON (de.dataelementid = dv.dataelementid) 
INNER JOIN organisationunit ou ON (ou.organisationunitid = dv.sourceid) 
INNER JOIN categoryoptioncombo co ON (co.categoryoptioncomboid = dv.attributeoptioncomboid) 
WHERE ou.uid = 'XtxUYCsDWrR' AND (co.code = '16859' OR co.code = '17618') AND dv.lastupdated BETWEEN '2016-01-08' AND '2016-04-21' LIMIT 20