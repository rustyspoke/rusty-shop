class ApplicationMailer < ActionMailer::Base
  default from: 'shop@rustyspoke.org', to: 'internal@rustyspoke.org'

  layout 'mailer'
end
