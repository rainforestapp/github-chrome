class @RepoView extends Backbone.View

  className: 'repo'
  tagName: 'li'

  render: ->
    @$el.html HAML['repo'](model: @model)
    @renderPullRequests()
    @

  renderPullRequests: =>
    pull_requests = @model.pullRequests()
    pull_requests.fetch
      success: (collection) => 
        @$('.pull-requests-count').text(collection.length)
