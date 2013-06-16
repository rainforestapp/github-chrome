class @ReposView extends Backbone.View

  className: 'repo-list'
  tagName: 'ol'

  initialize: ->
    @collection = new Repositories
    for i in [0...10] by 1
      repo = new Repository(REPO_ATTRS)
      repo.id = i
      @collection.add(repo)

  render: ->
    @renderRepos()
    @

  renderRepos: ->
    @collection.each (model) =>
      @renderRepo(model)

  renderRepo: (repo) ->
    view = new RepoView(model: repo)
    @$el.append view.render().el
