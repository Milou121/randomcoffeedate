 class CupMailer < ApplicationMailer
  def cuppa_match(cup, user)
    @cup = cup
    @user = user
    mail(to: user.email, subject: 'You have a cuppa match!')
  end
end
