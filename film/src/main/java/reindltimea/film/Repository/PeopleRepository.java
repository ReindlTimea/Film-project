package reindltimea.film.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import reindltimea.film.Modell.People;

import java.util.List;

@Repository
public interface PeopleRepository extends CrudRepository<People, Long> {
    @Query(value = "SElECT p FROM People p WHERE p.bornCountry = :bornCountry")
    List<People> findByCountry(@Param("bornCountry") String bornCountry);

    @Query(nativeQuery = true, value = "call GetFemale()")
    List<People> GetFemale();
}