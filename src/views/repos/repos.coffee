class @ReposView extends Backbone.View

  className: 'repo-list'
  tagName: 'ol'

  initialize: (@options) ->
    @repoViews = []
    @collection = @options.collection
    @.listenTo @collection, 'add reset sync', @render
    @.listenTo @collection, 'all-done', =>
      for v in @repoViews
        v.renderPullRequests()


  render: =>
    @$el.html('')
    @repoViews = []
    @renderRepos()
    @$("abbr.timeago").timeago()
    @

  renderRepos: ->
    @collection.each (model) =>
      @renderRepo(model)

  renderRepo: (repo) ->
    view = new RepoView(model: repo)
    @repoViews.push view
    @$el.append view.render().el
