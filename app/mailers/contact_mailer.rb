class ContactMailer < ActionMailer::Base
   default to: 'bucko.wojciech@gmail.com'
   
   def contact_email
      @name = name
      @email = email
      @message = message
      
      mail(from: email, subject: 'eDziennik - Wiadomość z formularza kontaktowego')
   end
end