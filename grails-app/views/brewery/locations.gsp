<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="kickstart" />
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <g:javascript>
    var paramsContinent = ${params.continent ?: "null"};
    var paramsSubContinent = ${params.subcontinent ?: "null"};
    var paramsCountry = ${params.country ?: "null"};
    var paramsState = ${params.state ?: "null"};
    var paramsRegion = ${params.region ? "\"${params.region}\"" : "null"};
    var paramsResolution = ${params.resolution ? "\"${params.resolution}\"" : "null"};
  </g:javascript>
  <g:javascript src="location.js" />
  <title><g:meta name="app.name"/> | All Countries</title>
</head>
<body>
  <div class="page-header">
    <h1>All Countries</h1>
    <div id="bla"></div>
  </div>
  <div id="chart_div"></div>

</body>
</html>
