
<%@ page import="beer366.ISO_3166_2" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ISO_3166_2.label', default: 'ISO_3166_2')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-ISO_3166_2" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'ISO_3166_2.code.label', default: 'Code')}" />
			
				<th><g:message code="ISO_3166_2.country.label" default="Country" /></th>
			
				<g:sortableColumn property="name" title="${message(code: 'ISO_3166_2.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${ISO_3166_2InstanceList}" status="i" var="ISO_3166_2Instance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${ISO_3166_2Instance.id}">${fieldValue(bean: ISO_3166_2Instance, field: "code")}</g:link></td>
			
				<td>${fieldValue(bean: ISO_3166_2Instance, field: "country")}</td>
			
				<td>${fieldValue(bean: ISO_3166_2Instance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${ISO_3166_2InstanceTotal}" />
	</div>
</section>

</body>

</html>
