class ModelMailer < ActionMailer::Base
  default from: "Leboncoin@ensiie.fr"

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

  def newsletter(user)
    @user = user
    mail to: @user[0]["email"], subject: "Newsletter Leboncoin !"
  end
end
