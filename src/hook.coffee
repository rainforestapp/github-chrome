chrome.extension.sendRequest message:"requestConfig", (response) ->
  app = new GithubChrome(el: $('#github-chrome'))

