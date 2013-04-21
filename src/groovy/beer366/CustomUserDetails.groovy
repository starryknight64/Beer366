/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package beer366

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser

/**
 *
 * @author Phillip
 */
class CustomUserDetails extends GrailsUser {
    public final String salt

    CustomUserDetails(GrailsUser base, String salt) {
        super(base.username, base.password, base.enabled,
            base.accountNonExpired, base.credentialsNonExpired, base.accountNonLocked,
            base.authorities, base.id)

        this.salt = salt;
    }
}

