/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package beer366

import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;

/**
 *
 * @author Phillip
 */
public class CustomPasswordEncoder extends MessageDigestPasswordEncoder {

    public CustomPasswordEncoder() {
        super("SHA-256");
    }

    @Override
    protected String mergePasswordAndSalt(String password, Object salt, boolean strict) {
        if (password == null) {
            password = "";
        }

        if (salt == null || "".equals(salt)) {
            return password;
        }

        return salt + password;
    }
}
