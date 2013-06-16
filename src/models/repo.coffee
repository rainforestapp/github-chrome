class @Repo extends Backbone.Model
  issuesUrl: -> [@get("html_url"), "issues"].join("/")
  pullRequestsUrl: -> [@get("html_url"), "pulls"].join("/")
  commitsUrl: -> [@get("html_url"), "commits"].join("/")
  pullRequests: ->
    new PullRequestsCollection(this)
