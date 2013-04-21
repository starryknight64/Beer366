// Place your Spring DSL code here
beans = {
    customPropertyEditorRegistrar(CustomDateEditorRegistrar)
    userDetailsService(beer366.CustomUserDetailsService)
    passwordEncoder(beer366.CustomPasswordEncoder)
    saltSource(beer366.CustomSaltSource) {
        userPropertyToUse = application.config.grails.plugins.springsecurity.dao.reflectionSaltSourceProperty
    }
}
