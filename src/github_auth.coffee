class @GithubAuth
  constructor: ->
    @githubAuth = new OAuth2("github",
      client_id: "a61d88bc98e28b1c1923"
      client_secret: "aba706c11f6852a38b4c6116de078eae6dfdf852"
      api_scope: "repo"
    )

  logout: ->
    @githubAuth.clearAccessToken()

  auth: ->
    if @githubAuth.hasAccessToken()? && !@githubAuth.isAccessTokenExpired()?
      @githubAuth.getAccessToken()
    else
      @githubAuth.authorize =>
        @token = @githubAuth.getAccessToken()
        console.log(@token)
        @token
