githubAuth = new OAuth2("github",
  client_id: "a61d88bc98e28b1c1923"
  client_secret: "aba706c11f6852a38b4c6116de078eae6dfdf852"
  api_scope: "repo"
)

githubAuth.authorize ->
  # Ready for action, can now make requests with
  n = new Notice()
  n.create('New token', githubAuth.getAccessToken())
  #xhr.setRequestHeader('Authorization', 'OAuth ' + accessToken)