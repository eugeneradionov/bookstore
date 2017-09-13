class RegistrationMailer < ApplicationMailer
  default from: 'noreply@mg.bookstoresupport.com'

  def checkout_registration_email(record)
    @record = record
    mail to: 'eugene.radionov@gmail.com', subject: 'You have registered successful'
  end
end
