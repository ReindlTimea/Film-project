package reindltimea.film.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import reindltimea.film.Modell.User;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
     @Query(value = "SELECT u.userName, f.filmOriginalTitle FROM User u JOIN u.films f ")
     List<Object[]> getFavoriteFilms();
}