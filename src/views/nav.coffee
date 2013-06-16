class @NavView extends Backbone.View

  tagName: 'ul'
  className: 'nav'

  render: ->
    @$el.html HAML['nav']()
    @