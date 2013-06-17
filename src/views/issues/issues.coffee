class @IssuesView extends Backbone.View

  className: 'issue-list'
  tagName: 'ol'

  initialize: (@options) ->
    @collection = @options.collection
    @.listenTo @collection, 'sync', @render

  render: ->
    @renderIssues()
    @$("abbr.timeago").timeago()
    @

  renderIssues: ->
    @collection.each (model) =>
      @renderIssue model

  renderIssue: (model) ->
    view = new IssueView
      model: model
    @$el.append view.render().el