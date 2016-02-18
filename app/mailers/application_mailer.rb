class ApplicationMailer < ActionMailer::Base
  default from: "chenon.p@gmail.com"
  layout 'mailer'
end

# here is the layout of the email application,
#  where I can put a header a footer to my email.
