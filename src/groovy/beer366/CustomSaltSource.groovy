/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package beer366

import org.springframework.security.authentication.dao.ReflectionSaltSource
import org.springframework.security.core.userdetails.UserDetails

/**
 *
 * @author Phillip
 */
class CustomSaltSource extends ReflectionSaltSource {
    Object getSalt(UserDetails user) {
        User.get( user.id )?.getAt(userPropertyToUse)
    }
}
