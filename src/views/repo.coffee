class @RepoView extends Backbone.View

  className: 'repo'
  tagName: 'li'
  events:
    "click" : "launchRepo"

  render: ->
    @$el.html HAML['repo']()
    @