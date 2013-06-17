class @IssueModel extends Backbone.Model
  initialize: (attrs, options) ->
    if r = options.repository
      @url = "https://api.github.com/repos/#{r.get('full_name')}/issues"
  
