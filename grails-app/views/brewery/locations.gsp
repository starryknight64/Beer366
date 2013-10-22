<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="beer366.ISO_3166_1" %>
<%@ page import="beer366.ISO_3166_2" %>
<%@ page import="beer366.Continent" %>
<%@ page import="beer366.SubContinent" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="kickstart" />
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <g:javascript>
    var paramsContinent = "${params.continent}";
    var paramsSubContinent = "${params.subcontinent}";
    var paramsCountry = "${params.country}";
    var paramsState = "${params.state}";
    var paramsRegion = ${params.region ? "\"${params.region}\"" : "null"};
    var paramsResolution = ${params.resolution ? "\"${params.resolution}\"" : "null"};
  </g:javascript>
  <g:javascript src="location.js" />
  <title><g:meta name="app.name"/> | All Countries</title>
</head>
<body>
<g:if test="${params.state}">
  <g:set var="state" value="${ISO_3166_2.findByName( params.state )}" />
  <g:if test="${state}">
    <b:renderBreadcrumbs state="${state}" />
  </g:if>
  <g:else>
    <h1>Location ${params.state} not found</h1>
  </g:else>
</g:if>
<g:elseif test="${params.country}">
  <g:set var="country" value="${ISO_3166_1.findByName( params.country )}" />
  <g:if test="${country}">
    <b:renderBreadcrumbs country="${country}" />
  </g:if>
  <g:else>
    <h1>Location ${params.country} not found</h1>
  </g:else>
</g:elseif>
<g:elseif test="${params.subcontinent}">
  <g:set var="subcontinent" value="${SubContinent.findByName( params.subcontinent )}" />
  <g:if test="${subcontinent}">
    <b:renderBreadcrumbs subcontinent="${subcontinent}" />
  </g:if>
  <g:else>
    <h1>Location ${params.subcontinent} not found</h1>
  </g:else>
</g:elseif>
<g:elseif test="${params.continent}">
  <g:set var="continent" value="${Continent.findByName( params.continent )}" />
  <g:if test="${continent}">
    <b:renderBreadcrumbs continent="${continent}" />
  </g:if>
  <g:else>
    <h1>Location ${params.continent} not found</h1>
  </g:else>
</g:elseif>
<g:else>
  <div class="page-header">
    <h1>All Countries</h1>
  </div>
</g:else>
<div id="chart_div"></div>
</body>
</html>
