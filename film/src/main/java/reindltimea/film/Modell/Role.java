package reindltimea.film.Modell;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Set;

@Table(name = "roles")
@Entity
@Data
@Getter
@Setter
public class Role implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "role_generator")
    @SequenceGenerator(name = "role_generator", sequenceName = "role_seq")
    @Column(name = "roleID", insertable = false, nullable = false)
    private Long id;

    @Column(name = "peopleID", nullable = false)
    private Long peopleID;

    @Column(name = "filmID", nullable = false)
    private Long filmID;

    @Column(name = "roleTypeID", nullable = false)
    private Long roleTypeID;

    @Pattern(regexp="^[\\w\\s:.,\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "roleName")
    private String roleName = "NULL";

    /*
    @OneToOne(targetEntity = Roletype.class)
    @JoinColumn(name = "roleTypeID", referencedColumnName = "roleTypeID")
    private Set<Roletype> roletypes;
    */
}