%dw 2.0
output application/java
var value = (if (( if (isEmpty(attributes.queryParams.collectors)) ["all"] else (((attributes.queryParams.collectors as String) replace /[ ]*,[ ]*/ with ',') splitBy ",")) contains "all") ["ap","apc","apm","arm","core","dc","ex","amq","apma","ch","rtf","osv2"] else ( if (isEmpty(attributes.queryParams.collectors)) ["all"] else (((attributes.queryParams.collectors as String) replace /[ ]*,[ ]*/ with ',') splitBy ","))) 

---
if (sizeOf(value) > 0)
	value
else if (vars.isPCE)
 ["ch","rtf","apma","amq"] 
else if  (vars.isGovCloud)
 ["rtf","apma","arm"] 
else if (vars.authMode == 'connected-app-credentials')
 ["apc", "amq", "osv2"] 
else
[]