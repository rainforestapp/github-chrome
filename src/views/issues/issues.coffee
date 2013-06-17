class @IssuesView extends Backbone.View

  className: 'issue-list'
  tagName: 'ol'

  initialize: (@options) ->
    @collection = @options.collection
    @.listenTo @collection, 'sync', @render

  render: ->
    @badge = new Badge()
    @badge.setIssues(@collection.size())

    if @collection.isEmpty()
      @$el.html('<div class="no-issue">No issues are currently assigned to you.</div>')
    else
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
