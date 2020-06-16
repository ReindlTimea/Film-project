package reindltimea.film.Service;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.Filmrate;
import reindltimea.film.Repository.FilmRepository;
import reindltimea.film.Repository.FilmrateRepository;
import reindltimea.film.Repository.UserRepository;

import javax.persistence.NoResultException;
import java.util.List;
import java.util.Optional;

@Service
public class FilmrateService implements ServiceInterface<Filmrate>{
    private final FilmrateRepository filmRateRepository;
    private final FilmRepository filmRepository;
    private final UserRepository userRepository;

    public FilmrateService(FilmrateRepository filmRateRepository, FilmRepository filmRepository, UserRepository userRepository) {
        this.filmRateRepository = filmRateRepository;
        this.filmRepository = filmRepository;
        this.userRepository = userRepository;
    }

    /**
     * Create Service
     *
     * @param filmRate
     * @return Filmrate
     */
    @Override
    public Filmrate Create(Filmrate filmRate) throws Exception{
        if(!filmRepository.existsById(filmRate.getFilmID()))
            throw new ResourceNotFoundException("Invalid film ID.");

        if(!userRepository.existsById(filmRate.getUserID()))
            throw new ResourceNotFoundException("Invalid user ID.");

        int star = filmRate.getStarCount();

        if(star < 1 || 10 < star )
            throw new Exception("Possible rate values are between 1 and 10.");

        return filmRateRepository.save(filmRate);
    }

    /**
     * Read - getAll Service
     *
     * @return List<Filmrate>
     */
    @Override
    public List<Filmrate> getAll(){
        return (List<Filmrate>) filmRateRepository.findAll();
    }

    /**
     * Read - getById Service
     *
     * @param id
     * @return Filmrate
     */
    @Override
    public Filmrate getById(Long id) throws NoResultException{
        Optional<Filmrate> oFilmrate = filmRateRepository.findById(id);

        if(oFilmrate.isPresent()){
            return oFilmrate.get();
        }
        else{
            throw new NoResultException("No film rate result.");
        }
    }

    /**
     * Read - GetFilmRate(Long id)
     * Stored procedure (MySQL only)
     * Returns all rates of the given film
     *
     * @return List<Object[]>
     */
    public List<Object[]> GetFilmRate(Long id) throws NoResultException{
        List<Object[]> filmRates = filmRateRepository.GetFilmRate(id);

        if(!CollectionUtils.isEmpty(filmRates)) {
            return filmRates;
        }

        throw new NoResultException("No result.");
    }

    /**
     * Update Service
     *
     * @param filmRate
     * @return Filmrate object
     */
    @Override
    public Filmrate Update(Filmrate filmRate) throws Exception {
        if(!filmRateRepository.existsById(filmRate.getId()))
            throw new ResourceNotFoundException("The film rate was not found. Update unsuccessful");

        if(!filmRepository.existsById(filmRate.getFilmID()))
            throw new ResourceNotFoundException("Invalid film ID.");

        if(!userRepository.existsById(filmRate.getUserID()))
            throw new ResourceNotFoundException("Invalid user ID.");

        int star = filmRate.getStarCount();

        if(star < 1 || 10 < star )
            throw new Exception("Possible rate values are between 1 and 10.");

        return filmRateRepository.save(filmRate);
    }

    /**
     * Delete Service
     *
     * @param id
     */
    @Override
    public void Delete(Long id) throws ResourceNotFoundException {
        if(!filmRateRepository.existsById(id))
            throw new ResourceNotFoundException("The film rate was not found. Delete unsuccessful");

        filmRateRepository.deleteById(id);
    }
}
