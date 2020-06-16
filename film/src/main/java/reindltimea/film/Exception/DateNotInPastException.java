package reindltimea.film.Exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.BAD_REQUEST)
public class DateNotInPastException extends Exception {
    public DateNotInPastException(String errorMessage) {
        super(errorMessage);
    }
}