
<%@ page import="beer366.ISO_3166_1" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ISO_3166_1.label', default: 'ISO_3166_1')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-ISO_3166_1" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="alpha2" title="${message(code: 'ISO_3166_1.alpha2.label', default: 'Alpha2')}" />
			
				<g:sortableColumn property="alpha3" title="${message(code: 'ISO_3166_1.alpha3.label', default: 'Alpha3')}" />
			
				<g:sortableColumn property="code" title="${message(code: 'ISO_3166_1.code.label', default: 'Code')}" />
			
				<th><g:message code="ISO_3166_1.subContinent.label" default="Sub Continent" /></th>
			
				<g:sortableColumn property="name" title="${message(code: 'ISO_3166_1.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${ISO_3166_1InstanceList}" status="i" var="ISO_3166_1Instance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${ISO_3166_1Instance.id}">${fieldValue(bean: ISO_3166_1Instance, field: "alpha2")}</g:link></td>
			
				<td>${fieldValue(bean: ISO_3166_1Instance, field: "alpha3")}</td>
			
				<td>${fieldValue(bean: ISO_3166_1Instance, field: "code")}</td>
			
				<td>${fieldValue(bean: ISO_3166_1Instance, field: "subContinent")}</td>
			
				<td>${fieldValue(bean: ISO_3166_1Instance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${ISO_3166_1InstanceTotal}" />
	</div>
</section>

</body>

</html>
