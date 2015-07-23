module MessagesHelper
  def custom_script
    render(:template => "layouts/custom_script",
           :layout => nil,
           :locals =>
               {:realtime_token => @realtime_token,
                :realtime_domain => @realtime_domain,
                :realtime_server_url => @realtime_server_url,
                :realtime_user_id => @realtime_user_id}).to_s

  end

  def custom_handler
    render(:template =>"layouts/handler",
                  :layout => nil,
                  :locals => {}).to_s

  end
end
