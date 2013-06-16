class @RepoView extends Backbone.View

  className: 'repo'
  tagName: 'li'

  render: ->
    @$el.html HAML['repo'](model: @model)
    @
