<%@ page import="beer366.DrinkLog" %>
<%@ page import="beer366.ServingSize" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <meta name="beer" content="${drinkLogInstance?.beer?.id ?: ''}" />
  <g:set var="entityName" value="${message(code: 'drinkLog.label', default: 'DrinkLog')}" />
  <link rel="stylesheet" href="${resource(dir: 'js/chosen', file: 'chosen.css')}" type="text/css">
  <g:javascript src="chosen/chosen.jquery.js" />
  <g:javascript src="drinklog.js" />
  <title>Edit Logged Drink</title>
</head>

<body>

  <section id="edit-drinkLog" class="first">

    <g:hasErrors bean="${drinkLogInstance}">
      <div class="alert alert-error">
        <g:renderErrors bean="${drinkLogInstance}" as="list" />
      </div>
    </g:hasErrors>

    <g:form method="post" class="form-horizontal" >
      <g:hiddenField name="id" value="${drinkLogInstance?.id}" />
      <g:hiddenField name="version" value="${drinkLogInstance?.version}" />
      <fieldset class="form">
        <div class="page-header">
          <h1>Edit Logged Drink</h1>
        </div>
        <g:render template="form"/>
      </fieldset>
      <div class="form-actions">
        <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
		<sec:ifAnyGranted roles="ROLE_ADMIN">
        	<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </sec:ifAnyGranted>
        <g:link action="show" id="${drinkLogInstance?.id}" class="btn">Cancel</g:link>
      </div>
    </g:form>

  </section>

</body>

</html>
