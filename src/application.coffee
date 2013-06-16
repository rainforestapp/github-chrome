class @GithubChrome extends Backbone.View
  initialize: (@options) ->
    @render()
    @badge = new Badge(1)

  render: ->
    @oauthView = new OauthView
    @$el.append @oauthView.render().el

    @reposView = new ReposView
    @$el.append @reposView.render().el