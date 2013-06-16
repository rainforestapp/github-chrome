class @GithubChrome extends Backbone.View

  initialize: (@options) ->
    @render()
    @badge = new Badge(1)

  render: ->
    @renderNav()
    @renderSection('repos')
    @

  renderNav: ->
    @navView = new NavView
    $('#main').append @navView.render().el

  renderSection: (section) ->
    switch section
      when 'repos'
        # @oauthView = new OauthView
        # @$el.append @oauthView.render().el

        @reposView = new ReposView
        @$el.append @reposView.render().el