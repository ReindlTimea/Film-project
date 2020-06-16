package reindltimea.film.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import reindltimea.film.Modell.User;

@Service
public class EmailService {
    private JavaMailSender javaMailSender;

    @Autowired
    public EmailService(JavaMailSender javaMailSender){
        this.javaMailSender = javaMailSender;
    }

    public void send(User user){
        SimpleMailMessage mail = new SimpleMailMessage();

        mail.setTo(user.getUserEmail());
        mail.setSubject("Welcome!");

        String msg = String.format(
                "Dear %s!\n\n"
                + "Thank you for visiting our site! You have successfully registered! "
                + "If you have any questions, please contact us by sending mail to info@website.com!\n\n"
                + "Website Team", user.getUserName());

        mail.setText(msg);

        javaMailSender.send(mail);
    }
}
