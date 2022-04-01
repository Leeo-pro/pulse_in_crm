# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'システム <from@example.com>'
  layout 'mailer'
end
