package reindltimea.film.Modell;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

@Entity
@Table(name = "roletypes")
@Data
@Getter
@Setter
public class Roletype implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "roletype_generator")
    @SequenceGenerator(name = "roletype_generator", sequenceName = "roletype_seq")
    @Column(name = "roleTypeID", insertable = false, nullable = false)
    private Long id;

    @Pattern(regexp="^[\\w\\s\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "roleTypeName", nullable = false)
    private String roleTypeName;
}