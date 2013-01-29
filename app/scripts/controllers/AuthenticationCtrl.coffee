
controller.controller('AuthenticationCtrl', [
  '$rootScope', '$scope', 'authService','TokenHandler', '$http'
  (rootScope, scope, authService, TokenHandler, http) ->
    # Holds all the requests which fail due to 401 response


    scope.submit = () ->
      http.post('http://localhost:9000/user/login'
      ,scope.user).success((data) ->
        TokenHandler.set(data)
        console.log(data)
      )




    rootScope.$on('event:auth:loginRequired', () ->


    )

    scope.login = () ->



])