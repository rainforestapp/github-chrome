auth = new GithubAuth()
sync = Backbone.sync
# then override original sync function
Backbone.sync = (method, model, options) ->
  auth.authorize (token) ->
    options.headers = { 'Authorization': "token " + token }
    sync(method, model, options)

class @GithubChrome extends Backbone.View

  initialize: (@options) ->
    @repositories = new RepoCollection
    @render()
    @badge = new Badge()
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
        @repositories.set([])
        @reposView = new ReposView
          collection: @repositories
        @$el.html @reposView.render().el
        @repositories.fetch(reset: true)

        @orgs = new OrgCollection
        @orgs.fetch
          success: =>
            for url in @orgs.pluck('repos_url')
              collection = new RepoCollection
                  url: url
                  type: (localStorage['repo_type'] || 'member')
                  sort_by: (localStorage['repo_sortby'] || 'pushed')
                  sort_order: (localStorage['repo_order'] || 'desc')
              collection.fetch
                success: (coll)=>
                  @reposView.collection.add(coll.models)

      when 'issues'
        @issuesCollection = new IssueCollection
        @issuesView = new IssuesView
          collection: @issuesCollection
        @$el.html @issuesView.el
        @issuesView.collection.fetch
          success: (c) => @badge.setBadgeText(c.length)
          error: @renderErrors

      when 'new-issue'
        @newIssueView = new NewIssueView(repositories: @repositories)
        @$el.html @newIssueView.el
        @newIssueView.render()

      when 'settings'
        @settingsView = new SettingsView
        @$el.html @settingsView.render().el

  renderErrors: ->
    @$el.html "Oops. Something when wrong. Please try again."
