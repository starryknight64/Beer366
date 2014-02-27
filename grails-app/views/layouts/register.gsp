<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
	<title><g:layoutTitle default='User Registration' /></title>
	<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	<g:layoutHead />
	<r:require module="register" />
	<r:layoutResources />
</head>
<body>
	<s2ui:layoutResources module='register' />
	<g:layoutBody />
	<s2ui:showFlash />
</body>
</html>
