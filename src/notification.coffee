# Note: There's no need to call webkitNotifications.checkPermission().
# Extensions that declare the notifications permission are always
# allowed create notifications.

# Create a simple text notification:
# icon url - can be relative
# notification title
notification = webkitNotifications.createNotification("/assets/notification_icon_48.png", "Hello!", "Lorem ipsum...") # notification body text

# Or create an HTML notification:
notification = webkitNotifications.createHTMLNotification("/notification.html") # html url - can be relative

# Then show the notification.
notification.show()