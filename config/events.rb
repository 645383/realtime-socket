WebsocketRails::EventMap.describe do
  subscribe :create, :to => ChatController, :with_method => :create
end
