class ApplicationMailer < ActionMailer::Base
  default from: 'support@codeforuse.herokuapp.com'
  layout 'mailer'
end
