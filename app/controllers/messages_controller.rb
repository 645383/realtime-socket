class MessagesController < ApplicationController
  # include WebsocketRails::BaseController

  def new
    @message = Message.new
    @user_names = %w(Klaus Gunter Frida)
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        WebsocketRails[:chat].trigger 'new', body
        format.json {render :show, status: :created}
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def body
    {
        msg: @message.body,
        time: @message.created_at.strftime("%Y/%m/%d - %H:%M:%S"),
        userId: @message.user_id,
        userName: params[:message][:user_name]
    }
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
