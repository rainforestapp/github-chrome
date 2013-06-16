class @GithubChrome extends Backbone.View
  initialize: (@options) ->
    @render()
    @badge = new Badge(1)

  render: ->
    # @$el.append("<div>Hello Backbone</div>")
