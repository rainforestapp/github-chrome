class @ReposView extends Backbone.View

  className: 'repo-list'
  tagName: 'ol'

  render: ->
    @renderRepos()
    @

  renderRepos: ->
    for i in [0...10] by 1
      @renderRepo('something')

  renderRepo: (repo) ->
    view = new RepoView
    @$el.append view.render().el
