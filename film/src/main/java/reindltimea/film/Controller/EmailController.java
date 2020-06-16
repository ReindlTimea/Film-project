package reindltimea.film.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reindltimea.film.Modell.User;
import reindltimea.film.Service.EmailService;
import reindltimea.film.Service.UserService;

@RestController
public class EmailController {
    public final EmailService emailService;
    public final UserService userService;

    public EmailController(EmailService emailService, UserService userService) {
        this.emailService = emailService;
        this.userService = userService;
    }

    @RequestMapping("/email/{id}")
    public String SignUp(@PathVariable Long id){
        User u = userService.getById(id);
        emailService.send(u);

        return "The message was sent.";
    }


}
