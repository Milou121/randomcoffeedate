class ApplicationMailer < ActionMailer::Base
  # to send a welcome email to current user

  default from: "cuppa@cuppa.com"
  layout 'mailer'
end
