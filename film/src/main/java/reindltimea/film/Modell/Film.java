package reindltimea.film.Modell;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import reindltimea.film.Enum.FilmType;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "films")
@Data
@Getter
@Setter
public class Film implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "filmGenerator")
    @SequenceGenerator(name = "filmGenerator", sequenceName = "filmSeq")
    @Column(name = "filmID", insertable = false, nullable = false)
    private Long id;

    @Pattern(regexp="^[\\w\\s:.,\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "filmOriginalTitle", nullable = false)
    private String filmOriginalTitle;

    @Pattern(regexp="^[\\w\\s:.,\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "filmSubTitle")
    private String filmSubTitle = "NULL";

    @DateTimeFormat
    @Past
    @Column(name = "filmReleaseDate")
    private Date filmReleaseDate;

    @Max(300)
    @Column(name = "filmLengthMins", nullable = false)
    private Integer filmLengthMins;

    @Pattern(regexp="^[\\w\\s:.,\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "filmDescription")
    private String filmDescription = "NULL";

    @Enumerated(EnumType.STRING)
    @Column(name = "filmType", nullable = false)
    private FilmType filmType;

    @ManyToMany
    @JoinTable(
            name = "film_genre",
            joinColumns = @JoinColumn(name = "filmID"),
            inverseJoinColumns = @JoinColumn(name = "genreID"))
    private Set<Genre> genres;

    /*
    @OneToMany(targetEntity = Role.class)
    @JoinColumn(name = "filmID", referencedColumnName = "filmID")
    private Set<Role> roles;
    */
}