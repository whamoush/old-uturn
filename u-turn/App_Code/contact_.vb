Imports Microsoft.VisualBasic
Imports System.Net.Mail
Public Class contact_
    Public strfromto As String = "info@uturnonline.com"
    Public Sub ContactForm(ByVal FullName As String, ByVal email As String, ByVal questions As String)
        Try




            Dim strSubjectUser As String = "U-turn-lb.com: new email from " + FullName

            Dim emailcontentuser As String
            emailcontentuser = String.Format("<div style='color: #3e3e3e; font-family: Courier New, Courier, monospace;margin:0 auto;width:310px;text-align:center;border:1px solid #000;padding:20px;'><img src='http://hamoush.com/wp-content/uploads/2015/02/des-logo.png' width='310px' alt='Uturn: Community Student Services' /><br /><br /><div style='text-align:left !important;'><p style='font-size: 16px;'>U-turn-lb.com Contact Form:</p><p style='font-size: 14px'><b>Full Name: </b>{0}<br /><br /><b>Email: </b>{1}<br /><br /><b>Questions: </b>{2}.<br /><br /><br />Uturn Support<br /><a style='color: #1a559d; text-decoration: underline' href='http://www.u-turn-lb.com'>http://www.u-turn-lb.com</a></p></div></div>", FullName, email, questions)

            Dim mm As New MailMessage(email, strfromto.ToString, strSubjectUser.ToString, emailcontentuser.ToString)

            mm.IsBodyHtml = True

            smtpSend(mm)





        Catch ex As Exception
            Throw ex
        End Try
    End Sub
    Private Sub smtpSend(ByVal message As MailMessage)
        Dim smtp As New SmtpClient
        smtp.Host = "relay-hosting.secureserver.net"
        'smtp.Host = "smtpout.secureserver.net"



        smtp.Credentials = New System.Net.NetworkCredential(strfromto.ToString, "Uturn@123")


        smtp.Send(message)

    End Sub
End Class
