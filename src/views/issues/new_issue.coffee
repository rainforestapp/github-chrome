class @NewIssueView extends Backbone.View

  className: 'new-issue'

  events:
    "submit form" : "onSubmit"

  initialize: (@options) ->
    @repositories = @options.repositories

  render: ->
    @$el.html(HAML['new_issue'](repositories: @repositories))

  onSubmit: (e) ->
    e.preventDefault()
    console.log('SUMIT')
    
