class @ReposView extends Backbone.View

  className: 'repo-list'
  tagName: 'ol'

  initialize: (@options) ->
    @collection = @options.collection
    @.listenTo @collection, 'sync', @render

  render: =>
    @renderRepos()
    @$("abbr.timeago").timeago()
    @

  renderRepos: ->
    @collection.each (model) =>
      @renderRepo(model)

  renderRepo: (repo) ->
    view = new RepoView(model: repo)
    @$el.append view.render().el
