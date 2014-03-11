class ModelMailer < ActionMailer::Base
  default from: "me@leboncoin.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.signal_annonce.subject
  #
  def signal_annonce(admin)
    @admins = admin
    @greeting = "Hi"

    mail to: @admins[0]["email"], subject: "Success! You dit it."
  end
end
