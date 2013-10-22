<%@ page import="beer366.Cellar" %>
<%@ page import="beer366.ServingSize" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <meta name="defaultServingSize" content="${ServingSize.defaultSize()?.id}" />
    <meta name="beer" content="${cellarInstance.beer?.id}" />
  <g:set var="entityName" value="${message(code: 'cellar.label', default: 'Cellar')}" />
  <link rel="stylesheet" href="${resource(dir: 'js/chosen', file: 'chosen.css')}" type="text/css">
  <g:javascript src="chosen/chosen.jquery.js" />
  <g:javascript src="cellar.js" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>
  <div class="page-header">
    <h1>Edit Cellar Beer</h1>
  </div>
  <section id="edit-cellar" class="first">

    <g:hasErrors bean="${cellarInstance}">
      <div class="alert alert-error">
        <g:renderErrors bean="${cellarInstance}" as="list" />
      </div>
    </g:hasErrors>

    <g:form method="post" class="form-horizontal" >
      <g:hiddenField name="id" value="${cellarInstance?.id}" />
      <g:hiddenField name="version" value="${cellarInstance?.version}" />
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <div class="form-actions">
        <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        <g:link action="show" id="${cellarInstance?.id}" class="btn">Cancel</g:link>
      </div>
    </g:form>

  </section>

</body>

</html>
