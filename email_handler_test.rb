class Email_handler_test

  require './email_handler'

  emailhandler = EmailHandler.new

  emailhandler.send_mail("james.calver@serverchoice.com")


end