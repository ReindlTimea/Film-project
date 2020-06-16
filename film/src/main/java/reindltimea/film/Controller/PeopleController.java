package reindltimea.film.Controller;

import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import org.springframework.web.bind.annotation.*;

import reindltimea.film.Exception.DateNotInPastException;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.People;
import reindltimea.film.Service.PeopleService;
import reindltimea.film.Validation.InputValidation;

import javax.persistence.NoResultException;
import java.util.List;

@RestController
@RequestMapping( path="/people" )
public class PeopleController {
    private final PeopleService peopleService;

    public PeopleController(PeopleService peopleService) {
        this.peopleService = peopleService;
    }

    /**
     * Create Controller
     *
     * @param people
     * @return People object
     */
    @PostMapping( path = "/create" )
    public People create(@RequestBody People people) throws DateNotInPastException {
        people.setBornPlace(InputValidation.RemoveSpecialChars(people.getBornPlace()));
        people.setBornCountry(InputValidation.RemoveSpecialChars(people.getBornCountry()));
        people.setName(InputValidation.RemoveSpecialChars(people.getName()));
        people.setBiography(InputValidation.RemoveSpecialChars(people.getBiography()));

        return peopleService.Create(people);
    }

    /**
     * Read - getAll Controller
     *
     * @return List<People>
     */
    @GetMapping( path = "/getAll" )
    public List<People> getAll(){
        return peopleService.getAll();
    }

    /**
     * Read - getFemale
     * Stored Procedure (MySQL only)
     *
     * @return List<People>
     */
    @GetMapping( path = "/getFemale" )
    public List<People> getFemale(){
        return peopleService.GetFemale();
    }

    /**
     * Read - findByCountry
     * JPQL Query with param
     * Returns all people from the given country
     *
     * @param bornCountry
     * @return List<People>
     */
    @GetMapping(value="/{country}")
    public List<People> findByCountry(@PathVariable("country") String bornCountry) throws NoResultException{
        bornCountry = InputValidation.RemoveSpecialChars(bornCountry);

        return peopleService.findByCountry(bornCountry);
    }

    /**
     * Read - GetAllPeopleHaveRole
     * Stored Procedure with INNER JOIN (MySQL only)
     * Returns all people who have already been assigned to any role
     *
     * @return JSONArray
     * @throws NoResultException
     */
    @GetMapping(value="/peopleroles")
    public JSONArray GetAllPeopleHaveRole() throws NoResultException{
        List<Object[]> result = peopleService.GetAllPeopleHaveRole();
        JSONArray roles = new JSONArray();

        for (Object[] role : result) {
            JSONObject roleObj = new JSONObject();

            roleObj.put("id", role[7].toString());
            roleObj.put("name", role[6].toString());
            roleObj.put("role", role[8].toString());
            roleObj.put("type", role[9].toString());
            roleObj.put("film", role[13].toString());

            roles.add(roleObj);
        }

        return roles;
    }

    /**
     * Read - getById Controller
     *
     * @param id
     * @return People object
     */
    @RequestMapping( method = RequestMethod.GET, value = "/get/{id}" )
    public People getById(@PathVariable("id") Long id) throws NoResultException{
        return peopleService.getById(id);
    }

    /**
     * Update Controller
     *
     * @param people
     * @return People object
     */
    @PostMapping( path = "/update" )
    public People update(@RequestBody People people) throws Exception {
        people.setBornPlace(InputValidation.RemoveSpecialChars(people.getBornPlace()));
        people.setBornCountry(InputValidation.RemoveSpecialChars(people.getBornCountry()));
        people.setName(InputValidation.RemoveSpecialChars(people.getName()));
        people.setBiography(InputValidation.RemoveSpecialChars(people.getBiography()));

        return peopleService.Update(people);
    }

    /**
     * Delete Controller
     *
     * @param id
     */
    @RequestMapping( method = RequestMethod.DELETE, value = "/delete/{id}" )
    public void delete(@PathVariable("id") Long id) throws ResourceNotFoundException{
        peopleService.Delete(id);
    }
}
