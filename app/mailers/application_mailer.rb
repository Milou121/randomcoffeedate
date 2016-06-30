class ApplicationMailer < ActionMailer::Base
  # to send a welcome email to current user

  default from: "info@cuppapp.com"
  layout 'mailer'
end
