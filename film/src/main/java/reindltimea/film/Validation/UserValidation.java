package reindltimea.film.Validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserValidation {
    /**
     * CheckEmail
     * Regular Expression validation
     *
     * @param email
     * @return boolean
     */
    public static boolean CheckEmail(String email){

        String regex = "^[a-zA-Z0-9_.-]+@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";

        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
    }

    /**
     * CheckPassword
     * Regular Expression validation
     *
     * ^                 # start-of-string
     * (?=.*[0-9])       # a digit must occur at least once
     * (?=.*[a-z])       # a lower case letter must occur at least once
     * (?=.*[A-Z])       # an upper case letter must occur at least once
     * (?=.*[@#$%^&+=])  # a special character must occur at least once
     * (?=\S+$)          # no whitespace allowed in the entire string
     * (?!.*['\"])       # exclude quotes
     * .{8,15}             # anything, at least eight places though, max 15
     * $                 # end-of-string
     *
     * @param password
     * @return boolean
    */
    public static boolean CheckPassword(String password){
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%&!?])(?=\\S+$)(?!.*['\"]).{8,15}$";

        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(password);

        return matcher.matches();
    }
}
