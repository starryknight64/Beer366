<div id="Navbar" class="navbar navbar-fixed-top navbar-inverse">
  <div class="navbar-inner">
    <div class="container">
      <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
      <a class="btn btn-navbar btn-inverse" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <a class="brand" href="${createLink(uri: '/')}">
        <img src="${resource(dir:'images',file:'pint_32_txt.png')}" alt="${meta(name:'app.name')}" />
${meta(name:'app.name')}<small> v${meta(name:'app.version')}</small>
      </a>

      <div class="nav-collapse">
        <ul class="nav">
          <li><a href="${createLink(uri: '/')}">All Totals</a></li>
          <sec:ifLoggedIn>
            <li class="dropdown" id="userMenu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-target="#userMenu">
                <sec:username/> <b class="caret"></b>
              </a>
              <ul class="dropdown-menu">
                <li><a href="${createLink(uri: "/user/totals")}">My Totals</a></li>
                <li><a href="${createLink(uri: "/user/uniques")}">My Unique Beers</a></li>
                <li><a href="${createLink(uri: "/cellar/list")}">My Cellar</a></li>
                <li><a href="${createLink(uri: "/user/completelog")}">My Complete Log</a></li>
                <li><a href="${createLink(uri: "/user/info")}">My Info</a></li>
                <li class="divider"></li>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                  <li class="dropdown" id="adminMenu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-target="#adminMenu">
                      Admin <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a href="${createLink(uri: '/')}">Add User</a></li>
                      <li class="divider"></li>
                      <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName.substring(c.fullName.lastIndexOf('.')+1)}</g:link></li>
                      </g:each>
                    </ul>
                  </li>
                  <li class="divider"></li>
                </sec:ifAnyGranted>
                <li><a href="${createLink(uri: '/')}">Set Current Page as Home</a></li>
                <li><a href="${createLink(uri: '/logout')}">Sign Out</a></li>
              </ul>
            </li>
            <li class="dropdown" id="logMenu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-target="#logMenu">
                Log <b class="caret"></b>
              </a>
              <ul class="dropdown-menu">
                <li><a href="${createLink(uri: '/drinkLog/create')}">Log Drink</a></li>
                <li class="divider"></li>
                <li><a href="${createLink(uri: '/brewery/create')}">Add Brewery</a></li>
                <li><a href="${createLink(uri: '/beer/create')}">Add Beer</a></li>
              </ul>
            </li>
          </sec:ifLoggedIn>
          <li><a href="${createLink(uri: '/brewery/list')}">Breweries</a></li>
          <li><a href="${createLink(uri: '/brewery/locations')}">Locations</a></li>
          <li><a href="${createLink(uri: '/beerFamily/list')}">Styles</a></li>
        </ul>
        <g:render template="/_menu/search"/>
      </div>
    </div>
  </div>
</div>
