package reindltimea.film;

//import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableJpaAuditing
@EnableSwagger2
public class FilmApplication {
	/*
	@Value("${spring.profiles.active}")
	private String selectedProfile;
	*/
	public static void main(String[] args) {
		SpringApplication.run(FilmApplication.class, args);
	}

}
