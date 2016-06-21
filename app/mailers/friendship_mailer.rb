 class FriendshipMailer < ApplicationMailer
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
end
