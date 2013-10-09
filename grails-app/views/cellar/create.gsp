<%@ page import="beer366.Cellar" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'cellar.label', default: 'Cellar')}" />
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
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <div class="form-actions">
        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        <button class="btn" type="reset">Cancel</button>
      </div>
    </g:form>

  </section>

</body>

</html>
