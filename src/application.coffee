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
    @storage = chrome.storage.local

    @update_badge_count()
    chrome.alarms.create('fetch', { periodInMinutes: 1.0 })
    chrome.alarms.onAlarm.addListener =>
      @update_badge_count()

    @user = new User
    @user.fetch
      success: => @renderSection('repos')
      error: => @renderErrors

  update_badge_count: ->
    issues = new IssueCollection
    issues.fetch
      success: (collection) =>
        @badge = new Badge()
        @badge.setIssues collection.size()

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
        @repositories.fetch
          reset: true
          error: @renderErrors

        @orgs = new OrgCollection
        @orgs.fetch
          success: (orgs) =>
            todo = orgs.models
            for org in @orgs.models
              url = org.get('repos_url')
              collection = new RepoCollection
                  url: url
                  type: (localStorage['repo_type'] || 'member')
                  sort_by: (localStorage['repo_sortby'] || 'pushed')
                  sort_order: (localStorage['repo_order'] || 'desc')
                  org: org
              collection.fetch
                success: (coll)=>
                  org = coll.org
                  todo.splice(todo.indexOf(org), 1)
                  @reposView.collection.add(coll.models, silent: true)
                  @reposView.collection.trigger('add')
                  @reposView.collection.trigger("all-done") if todo.length == 0

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
