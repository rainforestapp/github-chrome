class @GithubChrome extends Backbone.View
  initialize: (@options) ->
    @render()

  render: ->
    @$el.append(HAML['index']())
