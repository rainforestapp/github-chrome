# Save this script as `options.js`
keys = ['repo_type', 'repo_sortby']

# Saves options to localStorage.
save_options = ->
  _.each keys, (key) ->
    select = document.getElementById(key)
    localStorage[key] = select.children[select.selectedIndex].value

  # Update status to let user know options were saved.
  status = document.getElementById("status")
  status.innerHTML = "Options Saved."
  setTimeout (->
    status.innerHTML = ""
  ), 750

# Restores select box state to saved value from localStorage.
restore_options = ->
  _.each keys, (key) ->
    setting_value = localStorage[key]
    return unless setting_value
    select = document.getElementById(key)
    i = 0

    while i < select.children.length
      child = select.children[i]
      if child.value is setting_value
        child.selected = "true"
        break
      i++

check_auth = ->
  gh = new GithubAuth()

  if gh.is_logged_in()?
    token = gh.authorize()
    $('#authorzied').html("You are authorized with OAuth2.")
    $('#gh-logout').show().click ->
      gh.logout()
      if gh.is_logged_in()?
        $('#gh-logout').hide()
      else
        $('#gh-logout').html("Failed.")
  else
    $('#authorzied').html('Login here').click ->
      gh.authorize()

document.addEventListener "DOMContentLoaded", restore_options
document.addEventListener "DOMContentLoaded", check_auth
document.querySelector("#save").addEventListener "click", save_options


