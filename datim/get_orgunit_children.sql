select uid, code, shortname from organisationunit 
where parentid = (select organisationunitid from organisationunit where uid = 'CA3TSKNuAOY')