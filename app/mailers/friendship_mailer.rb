 class FriendshipMailer < ApplicationMailer
   def friends_request(user, invitee)
    @user = user  # Instance variable => available in view
    @friend = invitee
    mail(to: user.email, subject: 'You sent a friend request!')
    # This will render a view in `app/views/user_mailer`!
  end
  def friends_request_without_account(user, invitee_email)
    @user = user  # Instance variable => available in view
    @invitee_email = invitee_email
    mail(to: user.email, subject: "You sent a friend request to #{invitee_email}!")
    # This
  end

  def friend_invite(user, invitee_email)
    @user = user  # Instance variable => available in view
    @invitee_email = invitee_email
    mail(to: @invitee_email, subject: "#{@user.username} invited you for Cuppa!")
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
end
