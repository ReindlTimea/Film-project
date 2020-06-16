package reindltimea.film.Service;

import org.springframework.stereotype.Service;
import reindltimea.film.Exception.ResourceNotFoundException;
import reindltimea.film.Modell.Role;
import reindltimea.film.Repository.FilmRepository;
import reindltimea.film.Repository.PeopleRepository;
import reindltimea.film.Repository.RoleRepository;
import reindltimea.film.Repository.RoletypeRepository;

import javax.persistence.NoResultException;
import java.util.List;
import java.util.Optional;

@Service
public class RoleService implements ServiceInterface<Role> {
    private final RoleRepository roleRepository;
    private final FilmRepository filmRepository;
    private final PeopleRepository peopleRepository;
    private final RoletypeRepository roletypeRepository;

    public RoleService(RoleRepository roleRepository, FilmRepository filmRepository, PeopleRepository peopleRepository, RoletypeRepository roletypeRepository) {
        this.roleRepository = roleRepository;
        this.filmRepository = filmRepository;
        this.peopleRepository = peopleRepository;
        this.roletypeRepository = roletypeRepository;
    }

    /**
     * Create Service
     *
     * @param role
     * @return
     */
    @Override
    public Role Create(Role role) throws ResourceNotFoundException{
        if(!filmRepository.existsById(role.getFilmID()))
            throw new ResourceNotFoundException("Invalid film ID.");

        if(!peopleRepository.existsById(role.getPeopleID()))
            throw new ResourceNotFoundException("Invalid people ID.");

        if(!roletypeRepository.existsById(role.getRoleTypeID()))
            throw new ResourceNotFoundException("Invalid role type ID.");

        return roleRepository.save(role);
    }

    /**
     * Read - getAll Service
     *
     * @return List<Role>
     */
    @Override
    public List<Role> getAll(){
        return (List<Role>) roleRepository.findAll();
    }

    /**
     * Read - getById Service
     *
     * @param id
     * @return Role
     */
    @Override
    public Role getById(Long id) throws NoResultException{
        Optional<Role> oRole = roleRepository.findById(id);

        if(oRole.isPresent()){
            return oRole.get();
        }
        else{
            throw new NoResultException("No role result.");
        }
    }

    /**
     * Update Service
     *
     * @param role
     * @return Role object
     */
    @Override
    public Role Update(Role role) throws ResourceNotFoundException {
        if(!roleRepository.existsById(role.getId()))
            throw new ResourceNotFoundException("The role was not found. Update unsuccessful");

        if(!filmRepository.existsById(role.getFilmID()))
            throw new ResourceNotFoundException("Invalid film ID.");

        if(!peopleRepository.existsById(role.getPeopleID()))
            throw new ResourceNotFoundException("Invalid people ID.");

        if(!roletypeRepository.existsById(role.getRoleTypeID()))
            throw new ResourceNotFoundException("Invalid role type ID.");

        return roleRepository.save(role);
    }

    /**
     * Delete Service
     *
     * @param id
     */
    @Override
    public void Delete(Long id) throws ResourceNotFoundException {
        if(!roleRepository.existsById(id))
            throw new ResourceNotFoundException("The role was not found. Delete unsuccessful");

        roleRepository.deleteById(id);
    }
}
