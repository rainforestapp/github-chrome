class @IssueCollection extends Backbone.Collection
  model: IssueModel
  url: "https://api.github.com/user/issues"