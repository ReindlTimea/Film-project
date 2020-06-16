package reindltimea.film.Modell;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

@Data
@Table(name = "genres")
@Entity
@Getter
@Setter
@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(
                name = "GetAllGenre",
                procedureName = "GetAllGenre")
})
public class Genre implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "genre_generator")
    @SequenceGenerator(name = "genre_generator", sequenceName = "genre_seq")
    @Column(name = "genreID", insertable = false, nullable = false)
    private Long id;

    @Pattern(regexp="^[\\w\\s\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "genreName", nullable = false)
    private String genreName;
}