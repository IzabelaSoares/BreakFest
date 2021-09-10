//@author Maria
package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    //procura o nome para montar o email
    public static String procuraNome(String pEmail){
        String nome = null;
        //comando de execução de banco de dados
        String sql = "select nome, sobrenome from pessoafisica where email = ?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pEmail);
            ResultSet rs = stm.executeQuery();
            //se encontrar algo no pessoa fisica
            if (rs.next()){
                nome = rs.getString("nome") + " " + rs.getString("sobrenome");
            }else{
                //se não, utiliza o método para procurar no pessoajuridica
                nome = EnviarEmail.procuraNomeFantasia(pEmail);
            }
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        
        return nome;
    }
    
    //procura o nome fantasia no pessoajuridica
    public static String procuraNomeFantasia(String pEmail){
        String nome = null;
        //comando de execução de banco de dados
        String sql = "select nomefantasia from pessoajuridica where email = ?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pEmail);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                nome = rs.getString("nomefantasia");
            }
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        
        return nome;
    }
    
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
          message.setContent(
              "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
                "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" style=\"width:100%;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0\">\n" +
                "<head>\n" +
                "<meta charset=\"UTF-8\">\n" +
                "<meta content=\"width=device-width, initial-scale=1\" name=\"viewport\">\n" +
                "<meta name=\"x-apple-disable-message-reformatting\">\n" +
                "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                "<meta content=\"telephone=no\" name=\"format-detection\">\n" +
                "<title>Novo modelo de e-mail 2021-09-09</title>\n" +
                "<!--[if (mso 16)]>\n" +
                "<style type=\"text/css\">\n" +
                "a {text-decoration: none;}\n" +
                "</style>\n" +
                "<![endif]-->\n" +
                "<!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]-->\n" +
                "<!--[if gte mso 9]>\n" +
                "<xml>\n" +
                "<o:OfficeDocumentSettings>\n" +
                "<o:AllowPNG></o:AllowPNG>\n" +
                "<o:PixelsPerInch>96</o:PixelsPerInch>\n" +
                "</o:OfficeDocumentSettings>\n" +
                "</xml>\n" +
                "<![endif]-->\n" +
                "<style type=\"text/css\">\n" +
                "#outlook a {\n" +
                "padding:0;\n" +
                "}\n" +
                ".ExternalClass {\n" +
                "width:100%;\n" +
                "}\n" +
                ".ExternalClass,\n" +
                ".ExternalClass p,\n" +
                ".ExternalClass span,\n" +
                ".ExternalClass font,\n" +
                ".ExternalClass td,\n" +
                ".ExternalClass div {\n" +
                "line-height:100%;\n" +
                "}\n" +
                ".es-button {\n" +
                "mso-style-priority:100!important;\n" +
                "text-decoration:none!important;\n" +
                "}\n" +
                "a[x-apple-data-detectors] {\n" +
                "color:inherit!important;\n" +
                "text-decoration:none!important;\n" +
                "font-size:inherit!important;\n" +
                "font-family:inherit!important;\n" +
                "font-weight:inherit!important;\n" +
                "line-height:inherit!important;\n" +
                "}\n" +
                ".es-desk-hidden {\n" +
                "display:none;\n" +
                "float:left;\n" +
                "overflow:hidden;\n" +
                "width:0;\n" +
                "max-height:0;\n" +
                "line-height:0;\n" +
                "mso-hide:all;\n" +
                "}\n" +
                ".es-button-border:hover a.es-button, .es-button-border:hover button.es-button {\n" +
                "background:#ffffff!important;\n" +
                "border-color:#ffffff!important;\n" +
                "}\n" +
                ".es-button-border:hover {\n" +
                "background:#ffffff!important;\n" +
                "border-style:solid solid solid solid!important;\n" +
                "border-color:#3d5ca3 #3d5ca3 #3d5ca3 #3d5ca3!important;\n" +
                "}\n" +
                "[data-ogsb] .es-button {\n" +
                "border-width:0!important;\n" +
                "padding:15px 20px 15px 20px!important;\n" +
                "}\n" +
                "td .es-button-border:hover a.es-button-1 {\n" +
                "color:#16120d!important;\n" +
                "}\n" +
                "td .es-button-border-2:hover {\n" +
                "border-color:#16120d #16120d #16120d #16120d!important;\n" +
                "background:transparent!important;\n" +
                "border-style:dashed dashed dashed dashed!important;\n" +
                "}\n" +
                "@media only screen and (max-device-width:600px) {\n" +
                ".es-content table,\n" +
                ".es-header table,\n" +
                ".es-footer table {\n" +
                "width:100%!important;\n" +
                "max-width:600px!important;\n" +
                "}\n" +
                "}\n" +
                "@media only screen and (max-width:600px) {p, ul li, ol li, a { line-height:150%!important } h1, h2, h3, h1 a, h2 a, h3 a { line-height:120%!important } h1 { font-size:20px!important; text-align:center } h2 { font-size:16px!important; text-align:left } h3 { font-size:20px!important; text-align:center } .es-header-body h1 a, .es-content-body h1 a, .es-footer-body h1 a { font-size:20px!important } h2 a { text-align:left } .es-header-body h2 a, .es-content-body h2 a, .es-footer-body h2 a { font-size:16px!important } .es-header-body h3 a, .es-content-body h3 a, .es-footer-body h3 a { font-size:20px!important } .es-menu td a { font-size:14px!important } .es-header-body p, .es-header-body ul li, .es-header-body ol li, .es-header-body a { font-size:10px!important } .es-content-body p, .es-content-body ul li, .es-content-body ol li, .es-content-body a { font-size:16px!important } .es-footer-body p, .es-footer-body ul li, .es-footer-body ol li, .es-footer-body a { font-size:12px!important } .es-infoblock p, .es-infoblock ul li, .es-infoblock ol li, .es-infoblock a { font-size:12px!important } *[class=\"gmail-fix\"] { display:none!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3 { text-align:right!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-button-border { display:block!important } a.es-button, button.es-button { font-size:14px!important; display:block!important; border-left-width:0px!important; border-right-width:0px!important } .es-btn-fw { border-width:10px 0px!important; text-align:center!important } .es-adaptive table, .es-btn-fw, .es-btn-fw-brdr, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .es-adapt-td { display:block!important; width:100%!important } .adapt-img { width:100%!important; height:auto!important } .es-m-p0 { padding:0px!important } .es-m-p0r { padding-right:0px!important } .es-m-p0l { padding-left:0px!important } .es-m-p0t { padding-top:0px!important } .es-m-p0b { padding-bottom:0!important } .es-m-p20b { padding-bottom:20px!important } .es-mobile-hidden, .es-hidden { display:none!important } tr.es-desk-hidden, td.es-desk-hidden, table.es-desk-hidden { width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } tr.es-desk-hidden { display:table-row!important } table.es-desk-hidden { display:table!important } td.es-desk-menu-hidden { display:table-cell!important } .es-menu td { width:1%!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } table.es-social { display:inline-block!important } table.es-social td { display:inline-block!important } }\n" +
                "</style>\n" +
                "</head>\n" +
                "<body style=\"width:100%;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0\">\n" +
                "<div class=\"es-wrapper-color\" style=\"background-color:#FAFAFA\">\n" +
                "<!--[if gte mso 9]>\n" +
                "<v:background xmlns:v=\"urn:schemas-microsoft-com:vml\" fill=\"t\">\n" +
                "<v:fill type=\"tile\" color=\"#fafafa\"></v:fill>\n" +
                "</v:background>\n" +
                "<![endif]-->\n" +
                "<table class=\"es-wrapper\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td valign=\"top\" style=\"padding:0;Margin:0\">\n" +
                "<table cellpadding=\"0\" cellspacing=\"0\" class=\"es-content\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td class=\"es-adaptive\" align=\"center\" style=\"padding:0;Margin:0\">\n" +
                "<table class=\"es-content-body\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;width:600px\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"left\" bgcolor=\"#864300\" style=\"padding:20px;Margin:0;background-color:#864300\">\n" +
                "<!--[if mso]><table style=\"width:560px\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"width:83px\" valign=\"top\"><![endif]-->\n" +
                "<table cellpadding=\"0\" cellspacing=\"0\" class=\"es-left\" align=\"left\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:left\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td class=\"es-m-p0r es-m-p20b\" align=\"center\" style=\"padding:0;Margin:0;width:83px\">\n" +
                "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a target=\"_blank\" href=\"http://localhost:8080/BreakFest/\" style=\"-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#0B5394;font-size:16px\"><img src=\"https://lsegqi.stripocdn.email/content/guids/e68d3e5d-9712-4ac5-afe4-d5dc612770d9/images/61721631211274906.gif\" alt=\"BREAKFEST\" style=\"display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic\" width=\"83\" title=\"BREAKFEST\"></a></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table>\n" +
                "<!--[if mso]></td><td style=\"width:20px\"></td><td style=\"width:457px\" valign=\"top\"><![endif]-->\n" +
                "<table cellpadding=\"0\" cellspacing=\"0\" class=\"es-right\" align=\"right\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:right\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"center\" style=\"padding:0;Margin:0;width:457px\">\n" +
                "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"left\" style=\"padding:0;Margin:0;padding-top:20px\"><a name=\"http://localhost:8080/BreakFest/\" style=\"-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#ffffff;font-size:16px\" href=\"\"></a><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:44px;color:#ffffff;font-size:22px\"><strong><span>BREAKFEST</span></strong></p></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table>\n" +
                "<!--[if mso]></td></tr></table><![endif]--></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table>\n" +
                "<table class=\"es-content\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td style=\"padding:0;Margin:0;background-color:#fafafa\" bgcolor=\"#fafafa\" align=\"center\">\n" +
                "<table class=\"es-content-body\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#ffffff;width:600px\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td style=\"padding:0;Margin:0;background-color:transparent\" bgcolor=\"transparent\" align=\"left\">\n" +
                "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:600px\">\n" +
                "<table style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-position:left top\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"center\" style=\"padding:0;Margin:0;padding-top:5px;padding-bottom:5px;font-size:0px\"><img src=\"https://lsegqi.stripocdn.email/content/guids/e68d3e5d-9712-4ac5-afe4-d5dc612770d9/images/18281631212050650.gif\" alt style=\"display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic\" width=\"190\"></td>\n" +
                "</tr>\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"center\" style=\"padding:0;Margin:0;padding-top:15px;padding-bottom:15px\"><h1 style=\"Margin:0;line-height:24px;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:20px;font-style:normal;font-weight:normal;color:#16120d\"><b>ESQUECEU SUA<br>SENHA?</b></h1></td>\n" +
                "</tr>\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"center\" style=\"padding:0;Margin:0;padding-left:40px;padding-right:40px\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:24px;color:#666666;font-size:16px\">OLÁ,&nbsp;,"+ EnviarEmail.procuraNome(pEmail) +" </p></td>\n" +
                "</tr>\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"center\" style=\"padding:0;Margin:0;padding-right:35px;padding-left:40px\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:24px;color:#666666;font-size:16px\">Recebemos um pedido para alteração da senha se sua conta!</p></td>\n" +
                "</tr>\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"center\" style=\"padding:0;Margin:0;padding-top:25px;padding-left:40px;padding-right:40px\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:24px;color:#666666;font-size:16px\">Se não foi você, apenas ignore este e-mail. Se não, clique no botão abaixo para recuperar sua senha:</p></td>\n" +
                "</tr>\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"center\" style=\"Margin:0;padding-left:10px;padding-right:10px;padding-top:40px;padding-bottom:40px\"><span class=\"es-button-border es-button-border-2\" style=\"border-style:solid;border-color:#88500a;background:#ffffff;border-width:2px;display:inline-block;border-radius:10px;width:auto\"><a href=\"http://localhost:8080/BreakFest/recuperarsenha.jsp\" class=\"es-button es-button-1\" target=\"_blank\" style=\"mso-style-priority:100 !important;text-decoration:none;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;color:#88500a;font-size:14px;border-style:solid;border-color:#FFFFFF;border-width:15px 20px 15px 20px;display:inline-block;background:#FFFFFF;border-radius:10px;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-weight:bold;font-style:normal;line-height:17px;width:auto;text-align:center\">REDEFINA SUA SENHA</a></span></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td style=\"Margin:0;padding-top:5px;padding-bottom:20px;padding-left:20px;padding-right:20px;background-position:left top\" align=\"left\">\n" +
                "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:560px\">\n" +
                "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"center\" style=\"padding:0;Margin:0\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:21px;color:#666666;font-size:14px\">Fale conosco:&nbsp;<a target=\"_blank\" href=\"mailto:projetobreakfest@gmail.com\" style=\"-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#666666;font-size:14px\">projetobreakfest@gmail.com</a></p></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table>\n" +
                "<table class=\"es-footer\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td style=\"padding:0;Margin:0;background-color:#fafafa\" bgcolor=\"#fafafa\" align=\"center\">\n" +
                "<table class=\"es-footer-body\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;width:600px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td style=\"Margin:0;padding-top:10px;padding-left:20px;padding-right:20px;padding-bottom:30px;background-color:#88500a\" bgcolor=\"#88500a\" align=\"left\">\n" +
                "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:560px\">\n" +
                "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"left\" style=\"padding:0;Margin:0;padding-top:5px;padding-bottom:5px\"><h2 style=\"Margin:0;line-height:19px;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:16px;font-style:normal;font-weight:normal;color:#ffffff\"><strong>Deseja tirar duvidas?</strong></h2></td>\n" +
                "</tr>\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"left\" style=\"padding:0;Margin:0\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;line-height:21px;color:#ffffff;font-size:14px\">A Equipe BreakFest está aqui para ajudar, veja mais sobre nós no link abaixo ou crie uma conta :)<br><a target=\"_blank\" style=\"-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#ffffff;font-size:14px\" href=\"\"></a></p></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table>\n" +
                "<table class=\"es-content\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td style=\"padding:0;Margin:0;background-color:#fafafa\" bgcolor=\"#fafafa\" align=\"center\">\n" +
                "<table class=\"es-content-body\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;width:600px\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"transparent\" align=\"center\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td style=\"padding:0;Margin:0;padding-top:15px;background-position:left top\" align=\"left\">\n" +
                "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:600px\">\n" +
                "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td style=\"padding:0;Margin:0\">\n" +
                "<table class=\"es-menu\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr class=\"links\" style=\"border-collapse:collapse\">\n" +
                "<td style=\"Margin:0;padding-left:5px;padding-right:5px;padding-top:0px;padding-bottom:1px;border:0\" id=\"esd-menu-id-0\" width=\"50%\" valign=\"top\" bgcolor=\"transparent\" align=\"center\"><a target=\"_blank\" href=\"http://localhost:8080/BreakFest/tipopessoa.jsp\" style=\"-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;display:block;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;color:#88500a;font-size:14px\">Cadastre-se</a></td>\n" +
                "<td style=\"Margin:0;padding-left:5px;padding-right:5px;padding-top:0px;padding-bottom:1px;border:0;border-left:1px solid #3d5ca3\" id=\"esd-menu-id-2\" esdev-border-color=\"#3d5ca3\" width=\"50%\" valign=\"top\" bgcolor=\"transparent\" align=\"center\"><a target=\"_blank\" href=\"https://projetobreakfest.carrd.co/\" style=\"-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;display:block;font-family:helvetica, 'helvetica neue', arial, verdana, sans-serif;color:#88500a;font-size:14px\">Sobre nós</a></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td align=\"center\" style=\"padding:0;Margin:0;padding-bottom:20px;padding-left:20px;padding-right:20px;font-size:0\">\n" +
                "<table width=\"100%\" height=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n" +
                "<tr style=\"border-collapse:collapse\">\n" +
                "<td style=\"padding:0;Margin:0;border-bottom:1px solid #fafafa;background:none;height:1px;width:100%;margin:0px\"></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table></td>\n" +
                "</tr>\n" +
                "</table>\n" +
                "</div>\n" +
                "</body>\n" +
                "</html>",
             "text/html");
          /**Método para enviar a mensagem criada*/
          Transport.send(message);

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
