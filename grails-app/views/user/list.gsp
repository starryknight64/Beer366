
<%@ page import="beer366.User" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-user" class="first">

	<table class="table table-bordered table-hover sortable">
		<thead>
			<tr>

				<th class="nowrap"><g:message code="user.username.label" default="Username" /></th>

				<th class="nowrap"><g:message code="user.email.label" default="Email" /></th>

				<th class="nowrap"><g:message code="user.homepage.label" default="Homepage" /></th>

				<th class="nowrap"><g:message code="user.firstName.label" default="First Name" /></th>

				<th class="nowrap"><g:message code="user.lastName.label" default="Last Name" /></th>

				<th class="nowrap"><g:message code="user.password.label" default="Password" /></th>

				<th class="nowrap"><g:message code="user.accountExpired.label" default="Account Expired" /></th>

				<th class="nowrap"><g:message code="user.accountLocked.label" default="Account Locked" /></th>

				<th class="nowrap"><g:message code="user.dateCreated.label" default="Date Created" /></th>

				<th class="nowrap"><g:message code="user.enabled.label" default="Enabled" /></th>

				<th class="nowrap"><g:message code="user.passwordExpired.label" default="Password Expired" /></th>

				<th class="nowrap"><g:message code="user.salt.label" default="Salt" /></th>

			</tr>
		</thead>
		<tbody>
		<g:each in="${userInstanceList}" status="i" var="userInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link action="show" id="${userInstance.id}">${userInstance.username}</g:link></td>

				<td>${userInstance.email}</td>

				<td>${userInstance.homepage}</td>

				<td>${userInstance.firstName}</td>

				<td>${userInstance.lastName}</td>

				<td>${userInstance.password}</td>

				<td><g:formatBoolean boolean="${userInstance.accountExpired}" /></td>

				<td><g:formatBoolean boolean="${userInstance.accountLocked}" /></td>

				<td><g:formatDate format="yyyy-MM-dd" date="${userInstance.dateCreated}" /></td>

				<td><g:formatBoolean boolean="${userInstance.enabled}" /></td>

				<td><g:formatBoolean boolean="${userInstance.passwordExpired}" /></td>

				<td>${userInstance.salt}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${userInstanceTotal}" />
	</div>
</section>

</body>

</html>
