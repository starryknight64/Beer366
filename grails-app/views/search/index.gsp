<html>
  <head>
    <title><g:meta name="app.name"/> | Search</title>
    <meta name="layout" content="kickstart" />
  </head>

  <body>
    <div class="body">
      <div class="page-header">
        <h1>Search Results</h1>
      </div>
      <g:set var="haveQuery" value="${params.q?.trim()}" />
      <g:set var="haveResults" value="${searchResult?.results}" />
      <g:if test="${haveResults}">
        <div class="list">
          <table class="table table-hover">
            <tbody>
            <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
            <g:each in="${searchResult.results}" status="i" var="result">
              <tr>
              <b:renderSearchResultRow object="${result}" />
              </tr>
            </g:each>
            </tbody>
          </table>
        </div>
        <div class="paginateButtons">
          <g:paginate params="[q: params.q]" total="${searchResult.total}"/>
        </div>
      </g:if>
      <br/>
      <div class="title">
        <span>
          <g:if test="${haveQuery && haveResults}">
            Showing <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong>
            results for <strong>${params.q}</strong>
          </g:if>
          <g:else>
            &nbsp;
          </g:else>
        </span>
      </div>
      <br/>
      <g:if test="${haveQuery && !haveResults && !parseException}">
        <p>Nothing matched your query - <strong>${params.q}</strong></p>
      </g:if>
      <g:if test="${searchResult?.suggestedQuery}">
        <p>Did you mean <g:link controller="searchable" action="index" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?</p>
      </g:if>
      <g:if test="${parseException}">
        <p>Your query - <strong>${params.q}</strong> - is not valid.</p>
      </g:if>
    </div>
  </body>

</html>