
<%@ page import="beer366.ServingSize" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'servingSize.label', default: 'ServingSize')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-servingSize" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'servingSize.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="ml" title="${message(code: 'servingSize.ml.label', default: 'Ml')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${servingSizeInstanceList}" status="i" var="servingSizeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${servingSizeInstance.id}">${fieldValue(bean: servingSizeInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: servingSizeInstance, field: "ml")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${servingSizeInstanceTotal}" />
	</div>
</section>

</body>

</html>
