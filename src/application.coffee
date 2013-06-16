class @GithubChrome extends Backbone.View

  initialize: (@options) ->
    @render()
    @badge = new Badge(1)

    #chrome.alarms.create('fetch', { periodInMinutes: 1.0 })
    #chrome.alarms.onAlarm.addListener =>
    #  @badge.addIssues(1)

  render: ->
    @renderNav()
    @renderSection('repos')
    @

  renderNav: ->
    @navView = new NavView
    @.listenTo @navView, 'change:section', @renderSection
    $('body').append @navView.render().el

  renderSection: (section) ->
    switch section
      when 'repos'
        @reposView = new ReposView
        @$el.html @reposView.render().el

      when 'settings'
        @oauthView = new OauthView
        @$el.html @oauthView.render().el
