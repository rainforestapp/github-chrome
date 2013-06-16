class @NavView extends Backbone.View

  tagName: 'ul'
  className: 'nav'
  events:
    "click li"  :   "switchSection"

  render: ->
    @$el.html HAML['nav']()
    @

  switchSection: (e) ->
    section = $(e.currentTarget).attr('class')
    @.trigger 'change:section', section