class @PullRequestsCollection extends Backbone.Collection
  initialize: (repo) ->
    @repo = repo

  model: PullRequest
  url: -> ['https://api.github.com/repos', @repo.get('full_name'), "pulls"].join("/")
