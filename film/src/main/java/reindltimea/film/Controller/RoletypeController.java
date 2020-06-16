package reindltimea.film.Controller;

import org.springframework.web.bind.annotation.*;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.Roletype;
import reindltimea.film.Service.RoletypeService;
import reindltimea.film.Validation.InputValidation;

import javax.persistence.NoResultException;
import java.util.List;

@RestController
@RequestMapping( path="/roletype" )
public class RoletypeController {
    private final RoletypeService roletypeService;

    public RoletypeController(RoletypeService roletypeService) {
        this.roletypeService = roletypeService;
    }

    /**
     * Create Controller
     *
     * @param roletype
     * @return Roletype object
     */
    @PostMapping( path = "/create" )
    public Roletype create(@RequestBody Roletype roletype){
        roletype.setRoleTypeName(InputValidation.RemoveSpecialChars(roletype.getRoleTypeName()));

        return roletypeService.Create(roletype);
    }

    /**
     * Read - getAll Controller
     *
     * @return List<Roletype>
     */
    @GetMapping( path = "/getAll" )
    public List<Roletype> getAll(){
        return roletypeService.getAll();
    }

    /**
     * Read - getById Controller
     *
     * @param id
     * @return Roletype object
     */
    @RequestMapping( method = RequestMethod.GET, value = "/get/{id}" )
    public Roletype getById(@PathVariable("id") Long id) throws NoResultException{
        return roletypeService.getById(id);
    }

    /**
     * Update Controller
     *
     * @param roletype
     * @return Roletype object
     */
    @PostMapping( path = "/update" )
    public Roletype update(@RequestBody Roletype roletype) throws ResourceNotFoundException {
        roletype.setRoleTypeName(InputValidation.RemoveSpecialChars(roletype.getRoleTypeName()));

        return roletypeService.Update(roletype);
    }

    /**
     * Delete Controller
     *
     * @param id
     */
    @RequestMapping( method = RequestMethod.DELETE, value = "/delete/{id}" )
    public void delete(@PathVariable("id") Long id) throws ResourceNotFoundException{
        roletypeService.Delete(id);
    }
}
