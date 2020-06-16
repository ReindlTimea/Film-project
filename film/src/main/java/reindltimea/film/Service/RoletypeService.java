package reindltimea.film.Service;

import org.springframework.stereotype.Service;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.Roletype;
import reindltimea.film.Repository.RoletypeRepository;

import javax.persistence.NoResultException;
import java.util.List;
import java.util.Optional;

@Service
public class RoletypeService implements ServiceInterface<Roletype> {
    private final RoletypeRepository roletypeRepository;

    public RoletypeService(RoletypeRepository roletypeRepository) {
        this.roletypeRepository = roletypeRepository;
    }

    /**
     * Create Service
     *
     * @param roletype
     * @return
     */
    @Override
    public Roletype Create(Roletype roletype){
        return roletypeRepository.save(roletype);
    }

    /**
     * Read - getAll Service
     *
     * @return List<Roletype>
     */
    @Override
    public List<Roletype> getAll(){
        return (List<Roletype>) roletypeRepository.findAll();
    }

    /**
     * Read - getById Service
     *
     * @param id
     * @return Roletype
     */
    @Override
    public Roletype getById(Long id) throws NoResultException{
        Optional<Roletype> oRoletype = roletypeRepository.findById(id);

        if(oRoletype.isPresent()){
            return oRoletype.get();
        }
        else{
            throw new NoResultException("No role type result.");
        }
    }

    /**
     * Update Service
     *
     * @param roletype
     * @return Roletype object
     */
    @Override
    public Roletype Update(Roletype roletype) throws ResourceNotFoundException {
        if(!roletypeRepository.existsById(roletype.getId()))
            throw new ResourceNotFoundException("The role type was not found. Update unsuccessful");

        return roletypeRepository.save(roletype);
    }

    /**
     * Delete Service
     *
     * @param id
     */
    @Override
    public void Delete(Long id) throws ResourceNotFoundException {
        if(!roletypeRepository.existsById(id))
            throw new ResourceNotFoundException("The role type was not found. Delete unsuccessful");

        roletypeRepository.deleteById(id);
    }
}
