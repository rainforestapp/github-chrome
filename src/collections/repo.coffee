class @RepoCollection extends Backbone.Collection
  model: Repo
  url: "https://api.github.com/user/repos?type=all&sort=pushed"
