<%@ page import="beer366.Cellar" %>
<%@ page import="beer366.ServingSize" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <meta name="beer" content="${cellarInstance.beer?.id}" />
    <meta name="defaultServingSize" content="${ServingSize.defaultSize()?.id}" />
  <g:set var="entityName" value="${message(code: 'cellar.label', default: 'Cellar')}" />
  <link rel="stylesheet" href="${resource(dir: 'js/chosen', file: 'chosen.css')}" type="text/css">
  <g:javascript src="chosen/chosen.jquery.js" />
  <g:javascript src="cellar.js" />
  <title>Add Cellar Beer</title>
</head>

<body>

  <section id="create-cellar" class="first">

    <g:hasErrors bean="${cellarInstance}">
      <div class="alert alert-error">
        <g:renderErrors bean="${cellarInstance}" as="list" />
      </div>
    </g:hasErrors>

    <g:form action="save" class="form-horizontal" >
      <g:hiddenField name="user.id" value="${sec.loggedInUserInfo(field:'id')}" />
      <fieldset class="form">
        <div class="page-header">
          <h1>Add Cellar Beer</h1>
        </div>
        <g:render template="form"/>
      </fieldset>
      <div class="form-actions">
        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        <g:link action="show" id="${cellarInstance?.id}" class="btn">Cancel</g:link>
      </div>
    </g:form>

  </section>

</body>

</html>
