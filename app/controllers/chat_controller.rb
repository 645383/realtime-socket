class ChatController < WebsocketRails::BaseController
  def create(msg)
    if msg
      send_message :create_success, msg
    else
      send_message :create_fail, msg
    end
  end
end