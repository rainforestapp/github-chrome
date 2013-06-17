class @NewIssueView extends Backbone.View

  className: 'new-issue'

  events:
    "submit form" : "onSubmit"

  initialize: (@options) ->
    @repositories = @options.repositories

  render: ->
    @$el.html(HAML['new_issue'](repositories: @repositories))
    @$('select').select2()

  onSubmit: (e) ->
    e.preventDefault()
    name = @$("[name=repository]").val()
    localStorage['new_issue_last_repo'] = name
    repository = @repositories.find (r) -> r.get('full_name') == name
    model = new IssueModel({
      body: @$("[name=body]").val()
      title: @$("[name=title]").val()
    }, {repository: repository})
    model.save {},
      success: (model) =>
        @badge = new Badge()
        @badge.addIssues(1)
        @$('.message').html("<span>Issue <a href=\"#{model.get("html_url")}\" target=\"_blank\">##{model.get('number')}</a> was created!</span>")
      error: =>
        @$('.message').html("<span>Failed to create issue :(</span>")

