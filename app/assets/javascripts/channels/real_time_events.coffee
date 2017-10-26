App.poll_notifications = App.cable.subscriptions.create "RealTimeEventsChannel",
  connected: ->
    console.log("connected")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $(".real-time-events table tbody tr").last().remove()
    $(".real-time-events table tbody").prepend(
      "<tr><td>#{data["event"]}</td><td>#{data["email_type"]}</td><td>#{data["timestamp"]}</td></tr>"
    )
