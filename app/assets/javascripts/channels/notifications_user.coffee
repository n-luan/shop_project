App.notifications = App.cable.subscriptions.create "NotificationsUserChannel", current_user: "user.id",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    $('#notificationListUser').prepend "#{data.notification}"
    $('#notification').html data.counter
