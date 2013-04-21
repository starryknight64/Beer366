<html>
  <head>
    <title>${meta(name:'app.name')} | <g:message code='spring.security.ui.resetPassword.title'/></title>
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
        <s2ui:form width='475' height='250' elementId='resetPasswordFormContainer' titleCode='spring.security.ui.resetPassword.header' center='true'>
          <g:form action='resetPassword' name='resetPasswordForm' autocomplete='off'>
            <g:hiddenField name='t' value='${token}'/>
            <div class="span4 offset4">
              <div class="row">
                <div class="span4">
                  <p class="center">
                  <g:message code='spring.security.ui.resetPassword.description'/>
                  </p>
                </div>
              </div>
              <div class="row">
                <div class="span4">
                  <s2ui:passwordFieldRow class="span4" name='password' labelCode='resetPasswordCommand.password.label' bean="${command}"
                                         placeholder='Password' value="${command?.password}"/>
                </div>
              </div>
              <div class="row">
                <div class="span4">
                  <s2ui:passwordFieldRow class="span4" name='password2' labelCode='resetPasswordCommand.password2.label' bean="${command}"
                                         placeholder='Password (again)' value="${command?.password2}"/>
                </div>
              </div>
              <div class="row">
                <div class="span4">
                  <div class="span4">
                    <div class="span4">
                      <s2ui:submitButton elementId='reset' class="btn btn-inverse span2" form='resetPasswordForm' messageCode='spring.security.ui.resetPassword.submit'/>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </g:form>
        </s2ui:form>
      </div>
    </div>
  </body>
</html>
