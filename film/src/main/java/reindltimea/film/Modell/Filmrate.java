package reindltimea.film.Modell;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

@Data
@Entity
@Table(name = "filmrates")
@Getter
@Setter
public class Filmrate implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "filmrate_generator")
    @SequenceGenerator(name = "filmrate_generator", sequenceName = "filmrate_seq")
    @Column(insertable = false, name = "filmRateID", nullable = false)
    private Long id;

    @Min(1)
    @Max(10)
    @Column(name = "starCount", nullable = false)
    private Integer starCount;

    @Pattern(regexp="^[\\w\\s:.,\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "filmRateComment")
    private String filmRateComment;

    @Column(name = "userID", nullable = false)
    private Long userID;

    @Column(name = "filmID", nullable = false)
    private Long filmID;
}