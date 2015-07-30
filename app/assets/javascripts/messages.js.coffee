$ ->
  dispatcher1 = new WebSocketRails('localhost:3000/websocket');
  dispatcher2 = new WebSocketRails('localhost:3000/websocket');
  dispatcher3 = new WebSocketRails('localhost:3000/websocket');

  channel1 = dispatcher1.subscribe("chat")
  channel2 = dispatcher2.subscribe("chat")
  channel3 = dispatcher3.subscribe("chat")

  channel1.bind "new", (message) ->
    list = $('.list#1')
    if list.data('userid').toString() == message.userId.toString()
      list.append "<div class='my-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted'>" + message.time + "</cite></footer></div>"
      list.closest('.form').find('.form-control').val ''
    else
      list.append "<div class='your-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted' title='Someone awesome'>" + message.userName + ' # ' + message.time + "</cite></footer></div>"

  channel2.bind "new", (message) ->
    list = $('.list#2')
    if list.data('userid').toString() == message.userId.toString()
      list.append "<div class='my-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted'>" + message.time + "</cite></footer></div>"
      list.closest('.form').find('.form-control').val ''
    else
      list.append "<div class='your-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted' title='Someone awesome'>" + message.userName + ' # ' + message.time + "</cite></footer></div>"

  channel3.bind "new", (message) ->
    list = $('.list#3')
    if list.data('userid').toString() == message.userId.toString()
      list.append "<div class='my-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted'>" + message.time + "</cite></footer></div>"
      list.closest('.form').find('.form-control').val ''
    else
      list.append "<div class='your-message'><p style='font-size: 15px;'>" + message.msg + "</p><footer style='width: 230px;'><cite class='text-muted' title='Someone awesome'>" + message.userName + ' # ' + message.time + "</cite></footer></div>"
