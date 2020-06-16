package reindltimea.film.Validation;

public class InputValidation {
    /**
     * Remove Special Chars
     * Removes all, except the given characters
     *
     * \w       # word characters, including a-z, A-Z, 0-9 and underscore (_)
     * \s       # whitespace characters
     * \p{L}    # letter characters
     *
     * @param text
     * @return text
     */
    public static String RemoveSpecialChars(String text){
        text = text.replaceAll("[^\\w\\s'\":.,\\-\\p{L}]", "");
        text = text.replaceAll("'", "\\'");
        text = text.replaceAll("\"","\\\"");

        return text;
    }
}
