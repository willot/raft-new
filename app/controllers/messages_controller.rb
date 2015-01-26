class MessagesController < ApplicationController
  def index
    @user = current_user
    @received = @user.received_messages
    @sent = @user.created_messages
  end

  def new
    @message = Message.new
    @user = User.find(params[:user_id])
  end

  def create
    @message = Message.new(message_params)
    @message.creator = current_user
    @receiver = User.find(params[:user_id])
    @message.recipient = @receiver
    @message.save

    redirect_to @receiver, notice: "Your message has been sent!"
  end

  def message_params
    params.require(:message).permit(:title, :content, :wrote_at)
  end
end
