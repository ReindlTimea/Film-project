package reindltimea.film.Controller;

import org.springframework.web.bind.annotation.*;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.Film;
import reindltimea.film.Service.FilmService;
import reindltimea.film.Validation.InputValidation;

import javax.persistence.NoResultException;
import java.util.List;

@RestController
@RequestMapping( path="/film" )
public class FilmController {
    private final FilmService filmService;

    public FilmController(FilmService filmService) {
        this.filmService = filmService;
    }

    /**
     * Create Controller
     *
     * @param film
     * @return Film object
     */
    @PostMapping( path = "/create" )
    public Film create(@RequestBody Film film) throws Exception {
        film.setFilmOriginalTitle(InputValidation.RemoveSpecialChars(film.getFilmOriginalTitle()));
        film.setFilmSubTitle(InputValidation.RemoveSpecialChars(film.getFilmSubTitle()));
        film.setFilmDescription(InputValidation.RemoveSpecialChars(film.getFilmDescription()));

        return filmService.Create(film);
    }

    /**
     * Read - getAll Controller
     *
     * @return List<Film>
     */
    @GetMapping( path = "/getAll" )
    public List<Film> getAll(){
        return filmService.getAll();
    }

    /**
     * Read - getById Controller
     *
     * @param id
     * @return Film object
     */
    @RequestMapping( method = RequestMethod.GET, value = "/get/{id}" )
    public Film getById(@PathVariable("id") Long id) throws NoResultException{
        return filmService.getById(id);
    }

    /**
     * Update Controller
     *
     * @param film
     * @return Film object
     */
    @PostMapping( path = "/update" )
    public Film update(@RequestBody Film film) throws Exception {
        film.setFilmOriginalTitle(InputValidation.RemoveSpecialChars(film.getFilmOriginalTitle()));
        film.setFilmSubTitle(InputValidation.RemoveSpecialChars(film.getFilmSubTitle()));
        film.setFilmDescription(InputValidation.RemoveSpecialChars(film.getFilmDescription()));

        return filmService.Update(film);
    }

    /**
     * Delete Controller
     *
     * @param id
     */
    @RequestMapping( method = RequestMethod.DELETE, value = "/delete/{id}" )
    public void delete(@PathVariable("id") Long id) throws ResourceNotFoundException{
        filmService.Delete(id);
    }
}
