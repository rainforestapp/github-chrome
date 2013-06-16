class @ReposView extends Backbone.View

  className: 'repo-list'
  tagName: 'ol'

  initialize: ->
    @collection = new RepoCollection
    @collection.fetch
      success: @render

  render: =>
    @renderRepos()
    @

  renderRepos: ->
    @collection.each (model) =>
      @renderRepo(model)

  renderRepo: (repo) ->
    view = new RepoView(model: repo)
    @$el.append view.render().el
