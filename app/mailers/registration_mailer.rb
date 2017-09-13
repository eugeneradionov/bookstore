class RegistrationMailer < ApplicationMailer
  default from: 'noreply@mg.bookstoresupport.com'

  def checkout_registration_email(record, password)
    @record = record
    @password = password
    mail to: @record.email, subject: 'You have registered successful'
  end
end
