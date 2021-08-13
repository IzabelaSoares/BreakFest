//@author Maria
package dominio;

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
    public boolean enviaEmail(String pEmail){
        this.email = pEmail;
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
                          return new PasswordAuthentication("projetobreakfest@gmail.com",
                                  "projetobreakfestentra21");
                      }
                  });

        /** Ativa Debug para sessão */
        session.setDebug(true);

        try {

          Message message = new MimeMessage(session);
          message.setFrom(new InternetAddress("projetobreakfest@gmail.com"));
          //Remetente

          //Destinatário(s)
          Address[] toUser = InternetAddress.parse(this.email);

          message.setRecipients(Message.RecipientType.TO, toUser);
          message.setSubject("Recupere sua senha!");//Assunto
          message.setText("Olá!\n"
                  + "Siga este link: http://localhost:8080/BreakFest/recuperarsenha.jsp para criar uma nova senha.\n"
                  + "Atenciosamente,\n"
                  + "-Equipe BreakFest :)");
          /**Método para enviar a mensagem criada*/
          Transport.send(message);

         } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    
        return true;
    }
   /* 
    public EnviarEmail(){
        super("Exemplo com Label");
        Container tela = getContentPane();
        tela.setLayout(null);
        JLabel link = new JLabel ("Nome");
        link.setBounds(50,20,80,20);
        link.setForeground(Color.red);
        link.setFont(new Font("Arial",Font.BOLD,14));
        tela.add(link);
        tela.setSize(400, 250);
        tela.setVisible(true);
        tela.setLocationRelativeTo(null);
    }


    public static void Jlabel(String args[])
   {    ExemploLabel app = new ExemploLabel();
        app.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
   } */
    
    //área de getters e setters
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
