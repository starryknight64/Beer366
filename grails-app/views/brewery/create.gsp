<%@ page import="beer366.Brewery" %>
<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'brewery.label', default: 'Brewery')}" />
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
        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        <button class="btn" type="reset">Cancel</button>
      </div>
    </g:form>

  </section>

  <script>
    $(document).ready(function() {
      function countryUpdated() {
        $.getJSON('../ISO_3166_2/regions?countryid=' + $("#country").val(), function(data) {
          if( data.length > 0 ) {
            var regions = "<option value='null'></option>\n";
            $.each(data, function(key, val) {
              regions += "<option value='" + key + "'>" + val.name + "</option>\n";
            });
            $("#region").html(regions);
            $("label[for=region]").parent().show();
          } else {
            $("label[for=region]").parent().hide();
          }
        });
      }

      $("#country").change(function() {
        countryUpdated();
      });

      countryUpdated();
    });
  </script>
</body>
</html>
