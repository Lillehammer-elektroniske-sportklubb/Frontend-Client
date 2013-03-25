
controller.controller('AuthenticationCtrl', [
  '$rootScope', '$scope', 'authService','TokenHandler', '$http',
  '$cookieStore', '$location','SessionService'
  (
    rootScope, scope, authService, TokenHandler, http,
    cookieStore, location,SessionService

  ) ->
    # Holds all the requests which fail due to 401 response






    scope.login = () ->
      if(scope.user != undefined)
        if(
          scope.user.email != undefined &&
          scope.user.password != undefined
        )
          session = new SessionService
          session.username = scope.user.email
          session.password = scope.user.password

          session.$save()



])