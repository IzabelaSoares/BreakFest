//@author Maria
package dominio;

import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EnviarEmail {
    //declaração de variáveis
    private String email;
    
    //métodos
    
    //método para enviar email
    public boolean enviaEmail(){
        Properties props = new Properties();
        /** Parâmetros de conexão com servidor Gmail */
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session;
          session = Session.getDefaultInstance(props,
                  new javax.mail.Authenticator() {
                      @Override
                      protected PasswordAuthentication getPasswordAuthentication()
                      {
                          return new PasswordAuthentication("mariaclaraperon@gmail.com",
                                  "hihoney1gmail");
                      }
                  });

        /** Ativa Debug para sessão */
        session.setDebug(true);

        try {

          Message message = new MimeMessage(session);
          message.setFrom(new InternetAddress("mariaclaraperon@gmail.com"));
          //Remetente

          //Destinatário(s)
          Address[] toUser = InternetAddress.parse(this.email);

          message.setRecipients(Message.RecipientType.TO, toUser);
          message.setSubject("Oiii");//Assunto
          message.setText("Se vc esqueceu a senha problema seu");
          /**Método para enviar a mensagem criada*/
          Transport.send(message);

          System.out.println("Feito!!!");

         } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    
        return true;
    }
    
    //área de getters e setters
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
