class @Notice

  create: (title, body)->
    n = webkitNotifications.createNotification("/assets/notification_icon_48.png", title, body)
    n.show()
    n