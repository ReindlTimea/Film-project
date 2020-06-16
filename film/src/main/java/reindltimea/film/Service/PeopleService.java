package reindltimea.film.Service;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import reindltimea.film.Exception.DateNotInPastException;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.People;
import reindltimea.film.Repository.PeopleRepository;
import reindltimea.film.Validation.DateValidation;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import java.util.List;
import java.util.Optional;

@Service
public class PeopleService implements ServiceInterface<People> {

    @PersistenceContext
    private EntityManager em;
    private final PeopleRepository peopleRepository;

    public PeopleService(PeopleRepository peopleRepository) {
        this.peopleRepository = peopleRepository;
    }

    /**
     * Create Service
     *
     * @param people
     * @return
     */
    @Override
    public People Create(People people) throws DateNotInPastException{
        if(!DateValidation.isDateInPast(people.getBornDate()))
            throw new DateNotInPastException("The date is not passed. Save unsuccessful.");

        return peopleRepository.save(people);
    }

    /**
     * Read - getAll Service
     *
     * @return List<People>
     */
    @Override
    public List<People> getAll(){
        return (List<People>) peopleRepository.findAll();
    }

    /**
     * Read - GetFemale
     * Stored procedure (MySQL only)
     * Returns all female people
     *
     * @return List<People>
     */
    public List<People> GetFemale(){
        List<People> people = peopleRepository.GetFemale();

        if(!CollectionUtils.isEmpty(people)) {
            return people;
        }

        throw new NoResultException("No result.");
    }

    /**
     * Read - findByCountry(String bornCountry)
     * JPQL Query with param
     * Returns all people from the given country
     *
     * @param bornCountry
     * @return List<People>
     */
    public List<People> findByCountry(String bornCountry) throws NoResultException{
        List<People> people = peopleRepository.findByCountry(bornCountry);

        if(!CollectionUtils.isEmpty(people)) {
            return people;
        }

        throw new NoResultException("No people found in \""+ bornCountry +"\".");
    }

    /**
     * Read - GetAllPeopleHaveRole
     * Stored Procedure with INNER JOIN (MySQL only)
     * Returns all people who have already been assigned to any role
     *
     * @return List<Object[]>
     * @throws NoResultException
     */
    public List<Object[]> GetAllPeopleHaveRole() throws NoResultException{
        StoredProcedureQuery spq = em.createNamedStoredProcedureQuery("GetAllPeopleHaveRole");
        List<Object[]> result = spq.getResultList();

        if(result.isEmpty())
            throw new NoResultException("No assigned people to role.");

        return result;
    }

    /**
     * Read - getById Service
     *
     * @param id
     * @return People
     */
    @Override
    public People getById(Long id) throws NoResultException{
        Optional<People> oPeople = peopleRepository.findById(id);

        if(oPeople.isPresent()){
            return oPeople.get();
        }
        else{
            throw new NoResultException("No people result.");
        }

    }

    /**
     * Update Service
     *
     * @param people
     * @return People object
     */
    @Override
    public People Update(People people) throws Exception {
        if(!peopleRepository.existsById(people.getId()))
            throw new ResourceNotFoundException("The record of people was not found. Update unsuccessful");

        if(!DateValidation.isDateInPast(people.getBornDate()))
            throw new DateNotInPastException("The date is not passed. Save unsuccessful.");

        return peopleRepository.save(people);
    }

    /**
     * Delete Service
     *
     * @param id
     */
    @Override
    public void Delete(Long id) throws ResourceNotFoundException {
        if(!peopleRepository.existsById(id))
            throw new ResourceNotFoundException("The record of people was not found. Delete unsuccessful");

        peopleRepository.deleteById(id);
    }
}
