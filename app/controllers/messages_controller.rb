class MessagesController < ApplicationController

  def response_goodness(operation)
    if operation
      render json: @message
    else
      render status: 500
    end
  end

  def index
    #@messages = Message.all
    render json: Message.all.to_json
  end

=begin
  def new
    @message = Message.new
  end
=end

  def create
    if user_signed_in?
      @message = Message.new(user_id: current_user.id, message: params[:message])#message_params)
      response_goodness(@message.save)
    end
  end

=begin
  def show
    #@message = Message.find(params[:id])
    render json: Message.find(params[:id]).to_json
  end


  def edit
    @message = Message.find(params[:id])
  end
=end

  def update
    if user_signed_in?
      @message = Message.find(params[:id])

      if @message.user_id == current_user.id
        response_goodness(@message.update(message: params[:message]))
      else
        response_goodness(false)
      end
    else
      response_goodness(false)
    end
  end

  def destroy
    if user_signed_in?
      @message = Message.find(params[:id])

      if @message.user_id == current_user.id
        response_goodness(@message.destroy)
      else
        response_goodness(false)
      end
    else
      response_goodness(false)
    end
  end

=begin
private
  def message_params
    params.require(:message).permit(:author, :message)
  end
=end

end