controller.controller('UsersCtrl', [
  '$rootScope', '$scope','TokenHandler', 'UserService'
  (rootScope, scope, TokenHandler, UserService) ->

    token = TokenHandler.get()
    if(token != false)
      ## scope.user = UserService.get(token)
      return false
    scope.login = () ->
      console.log(loginForm)




])