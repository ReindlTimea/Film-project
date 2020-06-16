package reindltimea.film.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import reindltimea.film.Modell.Genre;

@Repository
public interface GenreRepository extends CrudRepository<Genre, Long> {
   /*
   @Procedure(name = "GetAllGenre")
   List<Genre> GetAllGenre();
   */
}