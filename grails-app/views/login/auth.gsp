<html>
  <head>
    <meta name='layout' content='login'/>
  </head>

  <body>
    <div class="container">
      <div class="row">
        <div class="span6 offset3 logo" class="centered">
          <g:img dir="images" file="logo_splash.png" width="100%" alt="Beer366: the quest to find the best"/>
        </div>
      </div>
      <div class="row">
        <div class="span4 offset4">
          <g:if test='${flash.message}'>
            <div class="alert alert-error">${flash.message}</div>
          </g:if>
        </div>
      </div>
      <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
        <div class="row">
          <div class="span4 offset4">
            <div class="row">
              <div class="span4">
                <input type='text' class='span4' name='j_username' id='username' placeholder="login or email address"/>
              </div>
            </div>
            <div class="row">
              <div class="span4">
                <input type='password' class='span4' name='j_password' id='password' placeholder="password"/>
              </div>
            </div>
            <div class="row">
              <div class="span4">
                <table class="span4">
                  <tr>
                    <td class="span2">
                      <label class="checkbox">
                        <input type='checkbox' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/><g:message code="springSecurity.login.remember.me.label"/>
                      </label>
                    </td>
                    <td class="span2">
                      <label>
                        <g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link>
                      </label>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="span2 offset1">
                <input type='submit' class="btn btn-inverse span2" id="submit" value='${message(code: "springSecurity.login.button")}'/>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>
</body>
</html>
