
controller.controller('AuthenticationCtrl', [
  '$rootScope', '$scope', '$http'
  (rootScope, scope, http) ->
    # Holds all the requests which fail due to 401 response


    rootScope.$on('event:auth:challenge', () ->


    )

    scope.login = () ->



])