class @GithubChrome extends Backbone.View

  initialize: (@options) ->
    @render()
    @badge = new Badge(1)

  render: ->
    @navView = new NavView
    $('#main').append @navView.render().el

    @oauthView = new OauthView
    @$el.append @oauthView.render().el

    @reposView = new ReposView
    @$el.append @reposView.render().el