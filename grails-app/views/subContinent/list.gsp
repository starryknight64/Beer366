
<%@ page import="beer366.SubContinent" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subContinent.label', default: 'SubContinent')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-subContinent" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'subContinent.code.label', default: 'Code')}" />
			
				<th><g:message code="subContinent.continent.label" default="Continent" /></th>
			
				<g:sortableColumn property="name" title="${message(code: 'subContinent.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${subContinentInstanceList}" status="i" var="subContinentInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${subContinentInstance.id}">${fieldValue(bean: subContinentInstance, field: "code")}</g:link></td>
			
				<td>${fieldValue(bean: subContinentInstance, field: "continent")}</td>
			
				<td>${fieldValue(bean: subContinentInstance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${subContinentInstanceTotal}" />
	</div>
</section>

</body>

</html>
