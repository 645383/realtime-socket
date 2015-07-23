class MessagesController < ApplicationController

  def new
    @message = Message.new
    @user_names = %w(Klaus Gunter Frida)
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      $redis.publish 'realtime_msg', {msg: @message.body, time: @message.created_at.strftime("%Y/%m/%d - %H:%M:%S"), userId: message_params[:user_id], userName: params[:message][:user_name], recipient_user_ids: [1, 2, 3]}.to_json
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
