class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def registration_confirmation(user)
    @user = user
    mail(to: user.email, :subject => "Registration Confirmation")
  end

  def cuppa_match(user, invitee)
    @user = user
    @invitee = invitee
    mail(to: user.email, subject: 'You have a cuppa match!')
  end

  def cancel_notification(user)
    @user = user
    mail(to: user.email, subject: 'Your cuppa got canceled')
  end

  # def welcome(user)
  #   @user = user  # Instance variable => available in view
  #   mail(to: user.email, subject: 'Welcome to Cuppa!')
  #   # This will render a view in `app/views/user_mailer`!
  # end


  # def match_confirm(user)
  #   @user = user  # Instance variable => available in view
  #   mail(to: user.email, subject: 'Your friend confirmed you request!')
  #   # This will render a view in `app/views/user_mailer`!
  # end
end
