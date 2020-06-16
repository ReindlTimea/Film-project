package reindltimea.film.Validation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateValidation {
    /**
     * Parse Date
     * @param stringDate
     * @return Date on success, otherwise null
    */
    public static Date parseDate(String stringDate){
        try{
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(stringDate);

            return date;
        }
        catch(ParseException ex){
            return null;
        }
    }

    public static boolean isDateInPast(Date date) {
        if(date.before(new Date()))
            return true;
        else
            return false;
    }
}
