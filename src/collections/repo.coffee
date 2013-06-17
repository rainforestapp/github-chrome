class @RepoCollection extends Backbone.Collection
  model: Repo
  url: -> @_url

  comparator: (repo) ->
    new Date(repo.get('pushed_at'))

  initialize: (options = {}) ->
    type = options.type
    @_url = options.url
    @_url ||= "https://api.github.com/user/repos"
    @_url += "?type=#{type || 'all'}&sort=pushed"
