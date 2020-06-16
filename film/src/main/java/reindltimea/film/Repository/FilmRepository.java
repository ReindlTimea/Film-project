package reindltimea.film.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import reindltimea.film.Modell.Film;

@Repository
public interface FilmRepository extends CrudRepository<Film, Long> {

}