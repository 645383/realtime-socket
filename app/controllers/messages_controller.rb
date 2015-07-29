class MessagesController < ApplicationController
  # include WebsocketRails::BaseController

  def new
    @message = Message.new
    @user_names = %w(Klaus Gunter Frida)
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      WebsocketRails[:chat].trigger 'new', @message.body
    end

    respond_to do |format|
      if @message.save
        format.json {render :show, status: :created}
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def realtime_user_id
    1
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
