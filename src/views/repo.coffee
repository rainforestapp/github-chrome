class @RepoView extends Backbone.View

  className: 'repo'
  tagName: 'li'

  render: ->
    @$el.html '<div class="title">Some repo name</div>
          <ul class="meta">
            <li class="issues">
              13 issues
              <span class="assigned">3 assigned to you</span>
            </li>
            <li class="prs">
              2 open pull requests
            </li>
            <li class="updated">
              last updated 2 months ago
            </li>
          </ul>'

    @