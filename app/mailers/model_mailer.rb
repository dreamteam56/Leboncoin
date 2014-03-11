class ModelMailer < ActionMailer::Base
  default from: "me@sandbox21042.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.signal_annonce.subject
  #
  def signal_annonce
    @greeting = "Hi"

    mail to: "recipient@sandbox21042.org", subject: "Success! You dit it."
  end
end
