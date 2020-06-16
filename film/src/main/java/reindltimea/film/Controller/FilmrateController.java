package reindltimea.film.Controller;

import org.springframework.web.bind.annotation.*;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.Filmrate;
import reindltimea.film.Service.FilmrateService;
import reindltimea.film.Validation.InputValidation;

import javax.persistence.NoResultException;
import java.util.List;

@RestController
@RequestMapping( path="/filmrate" )
public class FilmrateController {
    private final FilmrateService filmRateService;

    public FilmrateController(FilmrateService filmRateService) {
        this.filmRateService = filmRateService;
    }

    /**
     * Rate/Create Controller
     *
     * @param filmRate
     * @return Filmrate object
     */
    @PostMapping( path = "/rate" )
    public Filmrate rate(@RequestBody Filmrate filmRate) throws Exception{
        filmRate.setFilmRateComment(InputValidation.RemoveSpecialChars(filmRate.getFilmRateComment()));

        return filmRateService.Create(filmRate);
    }

    /**
     * Read - getAll Controller
     *
     * @return List<Filmrate>
     */
    @GetMapping( path = "/getAll" )
    public List<Filmrate> getAll(){
        return filmRateService.getAll();
    }

    /**
     * Read - getById Controller
     *
     * @param id
     * @return Filmrate object
     */
    @RequestMapping( method = RequestMethod.GET, value = "/get/{id}" )
    public Filmrate getById(@PathVariable("id") Long id) throws NoResultException{
        return filmRateService.getById(id);
    }

    /**
     * Read - GetFilmRate(Long id)
     * Stored procedure (MySQL only)
     * Returns all rates of the given film
     *
     * @return List<Object[]>
     */
    @GetMapping( path = "/getFilmRate/{id}" )
    public List<Object[]> GetFilmRate(@PathVariable("id") Long id) throws NoResultException{
        return filmRateService.GetFilmRate(id);
    }

    /**
     * Update Controller
     *
     * @param filmRate
     * @return Filmrate object
     */
    @PostMapping( path = "/update" )
    public Filmrate update(@RequestBody Filmrate filmRate) throws Exception {
        filmRate.setFilmRateComment(InputValidation.RemoveSpecialChars(filmRate.getFilmRateComment()));

        return filmRateService.Update(filmRate);
    }

    /**
     * Delete Controller
     *
     * @param id
     */
    @RequestMapping( method = RequestMethod.DELETE, value = "/delete/{id}" )
    public void delete(@PathVariable("id") Long id) throws ResourceNotFoundException{
        filmRateService.Delete(id);
    }
}