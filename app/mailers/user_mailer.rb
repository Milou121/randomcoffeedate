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

  # def welcome(user)
  #   @user = user  # Instance variable => available in view
  #   mail(to: user.email, subject: 'Welcome to Cuppa!')
  #   # This will render a view in `app/views/user_mailer`!
  # end

  def friends_request(user, invitee)
    @user = user  # Instance variable => available in view
    @friend = invitee
    mail(to: user.email, subject: 'You sent a friend request!')
    # This will render a view in `app/views/user_mailer`!
  end

  def friends_request_invitee(user, invitee)
    @user = user  # Instance variable => available in view
    @friend = invitee
    mail(to: @friend.email, subject: 'You have a friend request!')
    # This will render a view in `app/views/user_mailer`!
  end

  def friends_confirm(user, friend)
    @user = user  # Instance variable => available in view
    @friend = friend
    mail(to: user.email, subject: 'Your friend confirmed you request!')
    # This will render a view in `app/views/user_mailer`!
  end

  def match_confirm(user)
    @user = user  # Instance variable => available in view
    mail(to: user.email, subject: 'Your friend confirmed you request!')
    # This will render a view in `app/views/user_mailer`!
  end
end
