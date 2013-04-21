<html>
  <head>
    <title>${meta(name:'app.name')} | <g:message code='spring.security.ui.forgotPassword.title'/></title>
    <meta name='layout' content='login'/>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="span6 offset3 logo">
          <g:img dir="images" file="logo_splash.png" width="100%" alt="Beer366: the quest to find the best"/>
        </div>
      </div>
      <div class="row">
        <g:if test='${flash.error}'>
          <div class="span4 offset4">
            <div class="alert alert-error">${flash.error}</div>
          </div>
        </g:if>
        <g:if test='${emailSent}'>
          <div class="span4 offset4">
            <div class="row">
              <div class="span4">
                <p class="center">
                <g:message code='spring.security.ui.forgotPassword.sent'/>
                </p>
              </div>
            </div>
            <div class="row">
              <div class="span4">
                <div class="span4">
                  <div class="span4">
                    <g:link controller='login' action='auth' class="btn btn-inverse span2">Login</g:link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </g:if>
        <g:else>
          <s2ui:form width='350' height='220' elementId='forgotPasswordFormContainer' titleCode='spring.security.ui.forgotPassword.header' center='true'>
            <g:form action='forgotPassword' name="forgotPasswordForm" autocomplete='off'>
              <div class="span4 offset4">
                <div class="row">
                  <div class="span4">
                    <p class="center">
                    <g:message code='spring.security.ui.forgotPassword.description'/>
                    </p>
                  </div>
                </div>
                <div class="row">
                  <div class="span4">
                    <g:textField name="username" class="span4" placeholder="login or email address" />
                  </div>
                </div>
                <div class="row">
                  <div class="span4">
                    <div class="span4">
                      <div class="span4">
                        <s2ui:submitButton elementId='reset' class="btn btn-inverse span2" form='forgotPasswordForm' messageCode='spring.security.ui.forgotPassword.submit' value='${message(code: "spring.security.ui.forgotPassword.submit")}'/>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </g:form>
          </s2ui:form>
        </g:else>
      </div>
    </div>
  </body>
</html>
