class @GithubAuth
  constructor: ->
    @githubAuth = new OAuth2("github",
      client_id: "a61d88bc98e28b1c1923"
      client_secret: "aba706c11f6852a38b4c6116de078eae6dfdf852"
      api_scope: "user,repo"
    )

  is_logged_in: ->
    @githubAuth.hasAccessToken()

  logout: ->
    @githubAuth.clearAccessToken()

  authorize: (callback) =>
    @githubAuth.authorize =>
      callback(@githubAuth.getAccessToken())
