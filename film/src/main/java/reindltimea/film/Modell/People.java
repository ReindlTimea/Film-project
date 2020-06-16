package reindltimea.film.Modell;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Table(name = "people")
@Entity
@Data
@Getter
@Setter
@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(
                name = "GetAllPeopleHaveRole",
                procedureName = "GetAllPeopleHaveRole")
})
public class People implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "people_generator")
    @SequenceGenerator(name = "people_generator", sequenceName = "people_seq")
    @Column(insertable = false, name = "peopleID", nullable = false)
    private Long id;

    @Pattern(regexp="^[\\w\\s:.,\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "name", nullable = false)
    private String name;

    @DateTimeFormat
    @Past
    @Column(name = "bornDate")
    private Date bornDate;

    @Pattern(regexp="^[\\w\\s:.,\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "bornPlace")
    private String bornPlace;

    @Pattern(regexp="^[\\w\\s:.,\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "bornCountry")
    private String bornCountry;

    @Positive
    @Column(name = "gender", nullable = false)
    private Integer gender;

    @Pattern(regexp="^[\\w\\s:.,\\-\\p{L}]$", message="Invalid characters.")
    @Column(name = "biography")
    private String biography = "NULL";

    @ManyToMany
    @JoinTable(
            name = "profession",
            joinColumns = @JoinColumn(name = "peopleID"),
            inverseJoinColumns = @JoinColumn(name = "roleTypeID"))
    private Set<Roletype> roleTypes;

    /*
    @OneToMany(targetEntity = Role.class)
    @JoinColumn(name = "peopleID", referencedColumnName = "peopleID")
    private Set<Role> roles;
    */
}