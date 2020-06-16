package reindltimea.film.Controller;

import org.springframework.web.bind.annotation.*;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.Genre;
import reindltimea.film.Service.GenreService;
import reindltimea.film.Validation.InputValidation;

import javax.persistence.NoResultException;
import java.util.List;

@RestController
@RequestMapping( path="/genre" )
public class GenreController {
    private final GenreService genreService;

    public GenreController(GenreService genreService) {
        this.genreService = genreService;
    }

    /**
     * Create Controller
     *
     * @param genre
     * @return Genre object
     */
    @PostMapping( path = "/create" )
    public Genre create(@RequestBody Genre genre){
        genre.setGenreName(InputValidation.RemoveSpecialChars(genre.getGenreName()));

        return genreService.Create(genre);
    }

    /**
     * Read - getAll Controller
     *
     * @return List<Genre>
     */
    @GetMapping( path = "/getAll" )
    public List<Genre> getAll(){
        return genreService.getAll();
    }

    /**
     * Read - GetAllGenre
     * Stored Procedure (MySQL only)
     * Returns all genres, equivalent to getAll method
     *
     * @return List<Genre>
     */
    @GetMapping( path = "/getAllGenre" )
    public List<Genre> GetAllGenre(){
        return genreService.GetAllGenre();
    }

    /**
     * Read - getById Controller
     *
     * @param id
     * @return Genre object
     */
    @RequestMapping( method = RequestMethod.GET, value = "/get/{id}" )
    public Genre getById(@PathVariable("id") Long id) throws NoResultException{
        return genreService.getById(id);
    }

    /**
     * Update Controller
     *
     * @param genre
     * @return Genre object
     */
    @PostMapping( path = "/update" )
    public Genre update(@RequestBody Genre genre) throws ResourceNotFoundException {
        genre.setGenreName(InputValidation.RemoveSpecialChars(genre.getGenreName()));

        return genreService.Update(genre);
    }

    /**
     * Delete Controller
     *
     * @param id
     */
    @RequestMapping( method = RequestMethod.DELETE, value = "/delete/{id}" )
    public void delete(@PathVariable("id") Long id) throws ResourceNotFoundException{
        genreService.Delete(id);
    }
}
