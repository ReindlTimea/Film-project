package reindltimea.film.Controller;

import org.springframework.web.bind.annotation.*;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.Role;
import reindltimea.film.Service.RoleService;
import reindltimea.film.Validation.InputValidation;

import javax.persistence.NoResultException;
import java.util.List;

@RestController
@RequestMapping( path="/role" )
public class RoleController {
    private final RoleService roleService;

    public RoleController(RoleService roleService) {
        this.roleService = roleService;
    }

    /**
     * Create Controller
     *
     * @param role
     * @return Role object
     */
    @PostMapping( path = "/create" )
    public Role create(@RequestBody Role role) throws ResourceNotFoundException{
        role.setRoleName(InputValidation.RemoveSpecialChars(role.getRoleName()));

        return roleService.Create(role);
    }

    /**
     * Read - getAll Controller
     *
     * @return List<Role>
     */
    @GetMapping( path = "/getAll" )
    public List<Role> getAll(){
        return roleService.getAll();
    }

    /**
     * Read - getById Controller
     *
     * @param id
     * @return Role object
     */
    @RequestMapping( method = RequestMethod.GET, value = "/get/{id}" )
    public Role getById(@PathVariable("id") Long id) throws NoResultException{
        return roleService.getById(id);
    }

    /**
     * Update Controller
     *
     * @param role
     * @return Role object
     */
    @PostMapping( path = "/update" )
    public Role update(@RequestBody Role role) throws ResourceNotFoundException{
        role.setRoleName(InputValidation.RemoveSpecialChars(role.getRoleName()));

        return roleService.Update(role);
    }

    /**
     * Delete Controller
     *
     * @param id
     */
    @RequestMapping( method = RequestMethod.DELETE, value = "/delete/{id}" )
    public void delete(@PathVariable("id") Long id) throws ResourceNotFoundException {
        roleService.Delete(id);
    }
}
