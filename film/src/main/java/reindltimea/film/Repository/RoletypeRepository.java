package reindltimea.film.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import reindltimea.film.Modell.Roletype;

@Repository
public interface RoletypeRepository extends CrudRepository<Roletype, Long> {

}