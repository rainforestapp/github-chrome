class @Badge
  setIssues: (count)->
    @count = count
    @render()

  addIssues: (count)->
    @count += count
    @render()

  removeIssues: (count)->
    @count -= count
    @render()

  setBadgeText: (text)->
    chrome.browserAction.setBadgeText({text: "" + text})

  render: ->
    if @count > 0
      @setBadgeText(''+@count)
    else
      # Reset to no badge
      @setBadgeText('')
