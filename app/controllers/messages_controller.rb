class MessagesController < ApplicationController
  before_action :check_if_trip
  before_action :set_receiver


  def index
    @user = current_user
    @received = @user.messages
    @sent = @user.created_messages
  end

  def new
    @message = Message.new
    render partial: 'form'
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      if @trip
            redirect_to @trip ,notice: "Message sent!"
      else
            redirect_to @receiver, notice: "Message sent!"
      end
      # if request.xhr?
      #   if @trip
      #     render @trip , layout: false
      #   else
      #     redirect_to @receiver, layout: false
      #   end
      # else
      #   if @trip
      #       redirect_to @trip ,notice: "Message sent!"
      #   else
      #       redirect_to @receiver, notice: "Message sent!"
      #   end
      # end
    else
      render 'new'
    end
  end

private

  def check_if_trip
    @trip = Trip.find(params[:trip_id]) if params[:trip_id]
  end

  def set_receiver
    @receiver = User.find(params[:user_id]) if params[:user_id]
  end


  def message_params
    if @trip
      params.require(:message).permit(:title,:content, :wrote_at).merge(messageable_id: @trip.id, messageable_type: 'Trip', creator_id: current_user.id)
    else
      params.require(:message).permit(:title,:content, :wrote_at).merge(messageable_id: @receiver.id, messageable_type: 'User', creator_id: current_user.id)
    end
  end
end
