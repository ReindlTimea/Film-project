package reindltimea.film.Service;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import reindltimea.film.Exception.DateNotInPastException;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.User;
import reindltimea.film.Repository.UserRepository;
import reindltimea.film.Validation.DateValidation;

import javax.persistence.NoResultException;
import java.util.List;
import java.util.Optional;

@Service
public class UserService implements ServiceInterface<User> {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * Create Service
     *
     * @param user
     * @return User
     */
    @Override
    public User Create(User user) throws DateNotInPastException{
        if(!DateValidation.isDateInPast(user.getUserBornDate()))
            throw new DateNotInPastException("The date is not passed. Save unsuccessful.");

        return userRepository.save(user);
    }

    /**
     * Read - getAll Service
     *
     * @return List<User>
     */
    @Override
    public List<User> getAll(){
        return (List<User>) userRepository.findAll();
    }

    /**
     * Read - getById Service
     *
     * @param id
     * @return User
     */
    @Override
    public User getById(Long id){
        Optional<User> oUser = userRepository.findById(id);

        if(oUser.isPresent()){
            return oUser.get();
        }
        else{
            throw new NoResultException("No user result.");
        }
    }

    /**
     * Read - getFavoriteFilms
     * JPQL Query with JOIN
     * Returns all users with their favorite films
     *
     * @return List<People>
     */
    public List<Object[]> getFavoriteFilms() throws NoResultException{
        List<Object[]> favFilms = userRepository.getFavoriteFilms();

        if(!CollectionUtils.isEmpty(favFilms)) {
            return favFilms;
        }

        throw new NoResultException("No films found.");
    }


    /**
     * Update Service
     *
     * @param user
     * @return User object
     */
    @Override
    public User Update(User user) throws Exception {
        if(!userRepository.existsById(user.getId()))
            throw new ResourceNotFoundException("The user was not found. Update unsuccessful");

        if(!DateValidation.isDateInPast(user.getUserBornDate()))
            throw new DateNotInPastException("The date is not passed. Save unsuccessful.");

        return userRepository.save(user);
    }

    /**
     * Delete Service
     *
     * @param id
     */
    @Override
    public void Delete(Long id) throws ResourceNotFoundException {
        if(!userRepository.existsById(id))
            throw new ResourceNotFoundException("The user was not found. Delete unsuccessful");

        userRepository.deleteById(id);
    }
}
