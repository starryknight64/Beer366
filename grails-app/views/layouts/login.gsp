<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
  <head>
    <title>
      <g:layoutTitle default="${meta(name:'app.name')} | Login" />
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon" href="assets/ico/apple-touch-icon-72x72.png" sizes="72x72">
    <link rel="apple-touch-icon" href="assets/ico/apple-touch-icon-114x114.png" sizes="114x114">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'extra.css')}"/>
<%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
  <r:require modules="jquery"/>
  <r:require modules="${session.skin ? session.skin : 'bootstrap'}"/>
  <r:require modules="${session.skin ? session.skin + '_utils' : 'bootstrap_utils'}"/>
  <r:layoutResources />
  <g:javascript src="placeholder/jquery.placeholder.js" />
</head>
<body>
<g:layoutBody/>
<script type='text/javascript'>
  $(document).ready(function() {
    $('#username').placeholder();
    $('#password').placeholder();
    if( !$.browser.msie ) {
      $('#password').focus();
      $('#username').focus();
    }
  });
</script>
<div id="spinner" class="spinner" style="display:none;">
  <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>
<g:javascript library="application"/>
<r:layoutResources />
</body>
</html>
