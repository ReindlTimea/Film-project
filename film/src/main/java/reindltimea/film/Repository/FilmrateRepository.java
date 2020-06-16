package reindltimea.film.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import reindltimea.film.Modell.Filmrate;

import java.util.List;

@Repository
public interface FilmrateRepository extends CrudRepository<Filmrate, Long> {
    @Query(value = "call GetFilmRate (:filmID)", nativeQuery = true)
    public List<Object[]> GetFilmRate(@Param("filmID") Long filmID);
}