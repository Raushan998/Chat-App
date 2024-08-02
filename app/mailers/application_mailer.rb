# frozen_string_literal: true

# Application Mailer for handling sending mails
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
