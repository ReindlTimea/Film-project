package reindltimea.film.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import reindltimea.film.Modell.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {

}