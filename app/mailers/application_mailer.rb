class ApplicationMailer < ActionMailer::Base
  # to send a welcome email to current user
  default from: current_user.email
  layout 'mailer'
end
