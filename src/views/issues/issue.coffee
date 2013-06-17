class @IssueView extends Backbone.View

  className: 'issue'
  tagName: 'li'

  initialize: (@options) ->
    @model = @options.model

  render: ->
    @$el.html HAML['issue'](model: @model)
    @
