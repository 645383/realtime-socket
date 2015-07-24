$ ->
  if window.realtime.enabled
    addMessage = (message) ->
      list = $('.list#1')
      if list.data('userid').toString() == message.userId.toString()
        list.append "<div class='my-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted'>" + message.time + "</cite></footer></div>"
        list.closest('.form').find('.form-control').val ''
      else
        list.append "<div class='your-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted' title='Someone awesome'>" + message.userName + ' # ' + message.time + "</cite></footer></div>"

    addMessage2 = (message) ->
      list = $('.list#2')
      if list.data('userid').toString() == message.userId.toString()
        list.append "<div class='my-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted'>" + message.time + "</cite></footer></div>"
        list.closest('.form').find('.form-control').val ''
      else
        list.append "<div class='your-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted' title='Someone awesome'>" + message.userName + ' # ' + message.time + "</cite></footer></div>"

    addMessage3 = (message) ->
      list = $('.list#3')
      if list.data('userid').toString() == message.userId.toString()
        list.append "<div class='my-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted'>" + message.time + "</cite></footer></div>"
        list.closest('.form').find('.form-control').val ''
      else
        list.append "<div class='your-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted' title='Someone awesome'>" + message.userName + ' # ' + message.time + "</cite></footer></div>"

      $('.list').scrollTop($('.list')[0].scrollHeight)

    window.realtime.eventBus.on "realtimeMessage", addMessage
    window.realtime.eventBus2.on "realtimeMessage", addMessage2
    window.realtime.eventBus3.on "realtimeMessage", addMessage3

  else
    console.log "Error..."

  $('.btn.btn-primary').on "ajax:success", (e, data, status, xhr) ->
    console.log data
    alert 'hello'
