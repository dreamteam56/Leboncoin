class MailboxController < ApplicationController

  def sent
    render json: current_user.mailbox.sentbox
  end

  def index
  end

  def show
    conversation = current_user.mailbox.sentbox
    puts current_user.mailbox.sentbox.where(id: 2)[0].original_message
    render json: conversation[1].original_message
    
  end

end
