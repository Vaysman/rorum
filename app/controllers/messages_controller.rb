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
    @message = Message.new(:author => params[:author], :message => params[:message])#message_params)

    response_goodness(@message.save)
  end

=begin
  def show
    #@message = Message.find(params[:id])
    render json: Message.find(params[:id]).to_json
  end
=end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    response_goodness(@message.update(:author => params[:author], :message => params[:message]))
  end

  def destroy
    @message = Message.find(params[:id])
    
    response_goodness(@message.destroy)
  end

=begin
private
  def message_params
    params.require(:message).permit(:author, :message)
  end
=end

end
