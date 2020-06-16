package reindltimea.film.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Exception.UserFormException;
import reindltimea.film.Modell.User;
import reindltimea.film.Service.UserService;
import reindltimea.film.Validation.InputValidation;
import reindltimea.film.Validation.UserValidation;

import javax.persistence.NoResultException;
import java.util.List;

@RestController
@RequestMapping( path="/user" )
public class UserController {
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    /**
     * Create Controller
     *
     * @param user
     * @return User object
     */
    @PostMapping( path = "/create" )
    public User create(@RequestBody User user) throws Exception {
        user.setUserName(InputValidation.RemoveSpecialChars(user.getUserName()));

        if(!UserValidation.CheckEmail(user.getUserEmail()))
            throw new UserFormException("Invalid e-mail format.");
        if(!UserValidation.CheckPassword(user.getUserPassword()))
            throw new UserFormException("It must contain lower and uppercase, digits and special characters. Length 8-15 chars.");
        else
            user.setUserPassword(passwordEncoder.encode(user.getUserPassword()));

        return userService.Create(user);
    }

    /**
     * Read - getAll Controller
     *
     * @return List<User>
     */
    @GetMapping( path = "/getAll" )
    public List<User> getAll(){
        return userService.getAll();
    }

    /**
     * Read - getById Controller
     *
     * @param id
     * @return User object
     */
    @RequestMapping( method = RequestMethod.GET, value = "/get/{id}" )
    public User getById(@PathVariable("id") Long id) throws NoResultException{
        return userService.getById(id);
    }

    /**
     * Read - getFavoriteFilms
     * JPQL Query with JOIN
     * Returns all users with their favorite films
     *
     * @return List<People>
     */
    @GetMapping(value="/favorite/film/")
    public List<Object[]> getUserFavoriteFilms() throws NoResultException{
        return userService.getFavoriteFilms();
    }

    /**
     * Update Controller
     *
     * @param user
     * @return User object
     */
    @PostMapping( path = "/update" )
    public User update(@RequestBody User user) throws Exception {
        user.setUserName(InputValidation.RemoveSpecialChars(user.getUserName()));

        if(!UserValidation.CheckEmail(user.getUserEmail()))
            throw new UserFormException("Invalid e-mail format.");
        if(!UserValidation.CheckPassword(user.getUserPassword()))
            throw new UserFormException("It must contain lower and uppercase, digits and special characters. Length 8-15 chars.");
        else
            user.setUserPassword(passwordEncoder.encode(user.getUserPassword()));

        return userService.Update(user);
    }

    /**
     * Delete Controller
     *
     * @param id
     */
    @RequestMapping( method = RequestMethod.DELETE, value = "/delete/{id}" )
    public void delete(@PathVariable("id") Long id) throws ResourceNotFoundException{
        userService.Delete(id);
    }
}
