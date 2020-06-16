package reindltimea.film.Modell;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Set;
import javax.validation.constraints.*;

import static java.sql.Types.NULL;

@Data
@Table(name = "users")
@Entity
@Getter
@Setter
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_generator")
    @SequenceGenerator(name = "user_generator", sequenceName = "user_seq")
    @Column(name = "userID", insertable = false, nullable = false)
    private Long id;

    @Pattern(regexp="^[\\w\\s\\-\\p{L}]$", message="Invalid characters.")
    @NotBlank(message = "Name is mandatory")
    @Column(name = "userName", nullable = false)
    private String userName;

    @Email
    @NotBlank(message = "Email is mandatory")
    @Column(name = "userEmail", nullable = false, unique = true)
    private String userEmail;

    @Size(min=8, max=15)
    @Pattern(regexp="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%&!?])(?=\\S+$)(?!.*['\"]).{8,15}$", message="Invalid password. ")
    @NotBlank(message = "Password is mandatory")
    @Column(name = "userPassword", nullable = false)
    private String userPassword;

    @DateTimeFormat
    @Past
    @Column(name = "userBornDate")
    private Date userBornDate;

    @Positive
    @Max(1)
    @Column(name = "userGender")
    private Integer userGender = NULL;

    @Positive
    @Max(1)
    @Column(name = "userIsAdmin", nullable = false)
    private Integer userIsAdmin = 0;

    @Column(name = "userRegDate")
    private LocalDateTime userRegDate;

    @Column(name = "userLastLogin")
    private LocalDateTime userLastLogin;

    @Positive
    @Max(1)
    @Column(name = "userStatus", nullable = false)
    private Integer userStatus = 1;

    @ManyToMany
    @JoinTable(
            name = "favorite_film",
            joinColumns = @JoinColumn(name = "userID"),
            inverseJoinColumns = @JoinColumn(name = "filmID"))
    private Set<Film> films;

    @ManyToMany
    @JoinTable(
            name = "favorite_people",
            joinColumns = @JoinColumn(name = "userID"),
            inverseJoinColumns = @JoinColumn(name = "peopleID"))
    private Set<People> people;

    @ManyToMany
    @JoinTable(
            name = "favorite_genre",
            joinColumns = @JoinColumn(name = "userID"),
            inverseJoinColumns = @JoinColumn(name = "genreID"))
    private Set<Genre> genres;

}