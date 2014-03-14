class MailboxController < ApplicationController

  def sent
    render json: current_user.mailbox.sentbox
  end

end
