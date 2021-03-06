<%@ page import="beer366.Brewery" %>
<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'brewery.label', default: 'Brewery')}" />
  <link rel="stylesheet" href="${resource(dir: 'js/chosen', file: 'chosen.css')}" type="text/css">
  <g:javascript src="chosen/chosen.jquery.js" />
  <g:javascript src="brewery.js" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>
  <div class="page-header">
    <h1>Add Brewery</h1>
  </div>
  <section id="create-brewery" class="first">
    <g:hasErrors bean="${breweryInstance}">
      <div class="alert alert-error">
        <g:renderErrors bean="${breweryInstance}" as="list" />
      </div>
    </g:hasErrors>

    <g:form action="save" class="form-horizontal" >
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <div class="form-actions">
        <g:submitButton name="create" class="btn btn-primary" value="Add Brewery" />
        <g:link action="list" class="btn">Cancel</g:link>
      </div>
    </g:form>

  </section>
</body>
</html>
