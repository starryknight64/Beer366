<g:form class="navbar-search" url="[action:'index',controller:'search']" method="get">
  <g:textField class="search-query" placeholder="Search..." name="q" style="line-height: 1.5;" />
  <g:hiddenField name="url" value="${request.forwardURI}" />
</g:form>
