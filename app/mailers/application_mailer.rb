class ApplicationMailer < ActionMailer::Base
  # to send a welcome email to current user

  default from: "danny@dannim.nl"
  layout 'mailer'
end
