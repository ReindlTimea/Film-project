package reindltimea.film.Exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.BAD_REQUEST)
public class UserFormException extends Exception{
    public UserFormException(String message) {
        super(message);
    }
}
