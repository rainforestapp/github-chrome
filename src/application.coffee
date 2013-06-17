auth = new GithubAuth()
sync = Backbone.sync
# then override original sync function
Backbone.sync = (method, model, options) ->
  auth.authorize (token) ->
    options.headers = { 'Authorization': "token " + token }
    sync(method, model, options)

class @GithubChrome extends Backbone.View

  initialize: (@options) ->
    @render()
    @badge = new Badge(1)
    @storage = chrome.storage.local

    chrome.alarms.create('fetch', { periodInMinutes: 1.0 })
    chrome.alarms.onAlarm.addListener =>
      @badge.addIssues(1)

    @user = new User
    @user.fetch
      success: => @renderSection('repos')
      error: => @renderErrors

  render: ->
    @renderNav()
    @

  renderNav: ->
    @navView = new NavView
    @.listenTo @navView, 'change:section', @renderSection
    $('body').append @navView.render().el

  renderSection: (section) ->
    @navView.highlight section

    switch section
      when 'repos'
        @reposView = new ReposView
          collection: new RepoCollection
        @$el.html @reposView.el
        @reposView.collection.fetch()

      when 'issues'
        @issuesView = new IssuesView
          collection: new IssuesCollection
        @$el.html @issuesView.el
        @issuesView.collection.fetch()

      when 'settings'
        @oauthView = new OauthView
        @$el.html @oauthView.render().el

  renderErrors: ->
    @$el.html "Oops. Something when wrong. Please try again."

