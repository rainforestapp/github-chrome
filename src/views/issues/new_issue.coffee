class @NewIssueView extends Backbone.View
  events:
    "submit form" : "onSubmit"

  initialize: (@options) ->
    @repositories = @options.repositories

  render: ->
    @$el.html(HAML['new_issue'](repositories: @repositories))

  onSubmit: (e) ->
    e.preventDefault()
    name = @$("[name=repository]").val()
    repository = @repositories.find (r) -> r.get('full_name') == name
    model = new IssueModel({
      body: @$("[name=body]").val()
      title: @$("[name=title]").val()
    }, {repository: repository})
    model.save()
     
