package reindltimea.film.Service;

import org.springframework.stereotype.Service;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.Genre;
import reindltimea.film.Repository.GenreRepository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class GenreService implements ServiceInterface<Genre> {

    @PersistenceContext
    private EntityManager em;
    private final GenreRepository genreRepository;

    public GenreService(GenreRepository genreRepository) {
        this.genreRepository = genreRepository;
    }

    /**
     * Create Service
     *
     * @param genre
     * @return
     */
    @Override
    public Genre Create(Genre genre){
        return genreRepository.save(genre);
    }

    /**
     * Read - getAll Service
     *
     * @return List<Genre>
     */
    @Override
    public List<Genre> getAll(){
        return (List<Genre>) genreRepository.findAll();
    }

    /**
     * Read - GetAllGenre
     * Stored Procedure with Entity Manager (MySQL only)
     * Returns all genres, equivalent to getAll method
     *
     * @return List<Genre>
     */
    public List<Genre> GetAllGenre(){
        StoredProcedureQuery spq = em.createNamedStoredProcedureQuery("GetAllGenre");
        List<Genre> genreList = new ArrayList();
        List<Object[]> result = spq.getResultList();

        for(Object[] element : result){
            Long id = Long.parseLong(element[0].toString());

            Genre g = em.find(Genre.class, id);
            genreList.add(g);
        }

        return genreList;
    }

    /**
     * Read - getById Service
     *
     * @param id
     * @return Genre
     */
    @Override
    public Genre getById(Long id) throws NoResultException{
        Optional<Genre> oGenre = genreRepository.findById(id);

        if(oGenre.isPresent()){
            return oGenre.get();
        }
        else{
            throw new NoResultException("No genre result.");
        }
    }

    /**
     * Update Service
     *
     * @param genre
     * @return Genre object
     */
    @Override
    public Genre Update(Genre genre) throws ResourceNotFoundException {
        if(!genreRepository.existsById(genre.getId()))
            throw new ResourceNotFoundException("The genre was not found. Update unsuccessful");

        return genreRepository.save(genre);
    }

    /**
     * Delete Service
     *
     * @param id
     */
    @Override
    public void Delete(Long id) throws ResourceNotFoundException {
        if(!genreRepository.existsById(id))
            throw new ResourceNotFoundException("The genre was not found. Delete unsuccessful");

        genreRepository.deleteById(id);
    }
}