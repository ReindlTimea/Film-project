package reindltimea.film.Service;

import org.springframework.stereotype.Service;
import reindltimea.film.Exception.DateNotInPastException;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.Film;
import reindltimea.film.Repository.FilmRepository;
import reindltimea.film.Validation.DateValidation;

import javax.persistence.NoResultException;
import java.util.List;
import java.util.Optional;

@Service
public class FilmService implements ServiceInterface<Film>{
    private final FilmRepository filmRepository;
    private static final int filmLengthMax = 300;

    public FilmService(FilmRepository filmRepository) {
        this.filmRepository = filmRepository;
    }

    /**
     * Create Service
     *
     * @param film
     * @return
     */
    @Override
    public Film Create(Film film) throws Exception {
        if(!DateValidation.isDateInPast(film.getFilmReleaseDate()))
            throw new DateNotInPastException("The date is not passed. Save unsuccessful.");

        if(film.getFilmLengthMins() > filmLengthMax)
            throw new Exception(String.format("The film length cannot be more than %d minutes. Save unsuccessful.", filmLengthMax));

        return filmRepository.save(film);
    }

    /**
     * Read - getAll Service
     *
     * @return List<Film>
     */
    @Override
    public List<Film> getAll(){
        return (List<Film>) filmRepository.findAll();
    }

    /**
     * Read - getById Service
     *
     * @param id
     * @return Film
     */
    @Override
    public Film getById(Long id) throws NoResultException{
        Optional<Film> oFilm = filmRepository.findById(id);

        if(oFilm.isPresent()){
            return oFilm.get();
        }
        else{
            throw new NoResultException("Cannot find any films with this ID.");
        }
    }

    /**
     * Update Service
     *
     * @param film
     * @return Film object
     */
    @Override
    public Film Update(Film film) throws Exception {
        if(!filmRepository.existsById(film.getId()))
            throw new ResourceNotFoundException("The film was not found. Update unsuccessful.");

        if(!DateValidation.isDateInPast(film.getFilmReleaseDate()))
            throw new DateNotInPastException("The date is not passed. Update unsuccessful.");

        if(film.getFilmLengthMins() > filmLengthMax)
            throw new Exception(String.format("The film length cannot be more than %d minutes. Update unsuccessful.", filmLengthMax));

        return filmRepository.save(film);
    }

    /**
     * Delete Service
     *
     * @param id
     */
    @Override
    public void Delete(Long id) throws ResourceNotFoundException{
        if(!filmRepository.existsById(id))
            throw new ResourceNotFoundException("The film was not found. Delete unsuccessful");

        filmRepository.deleteById(id);
    }
}
