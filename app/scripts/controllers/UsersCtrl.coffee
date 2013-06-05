controller.controller('UsersCtrl', [
  '$rootScope', '$scope','TokenHandler', 'UserService', '$routeParams'
  (rootScope, scope, TokenHandler, UserService,routeParams) ->
    #scope.self = null
    token = TokenHandler.get()
    if(token != false && routeParams.id != undefined)
      UserService.get({id: routeParams.id.toString()},
        (data) ->
          data.profile.dateOfBirth = new Date(data.profile.dateOfBirth)
          scope.user = data
      )

    scope.register = () ->
      if(scope.registerForm.$valid)
        user = new UserService
        user.username = scope.username
        user.password = scope.password

        user.profile = {
          firstname:    scope.profile.firstname
          lastname:     scope.profile.surname
          gender:       scope.profile.gender
          mobilenumber: scope.profile.mobilenumber
          dateOfBirth:  scope.profile.dateOfBirth
          nationality:  scope.profile.nationality
          address:      scope.profile.address
          postCode:     scope.profile.postCode
          postPlace:    scope.profile.postPlace
        }


        user.$save()
    scope.update = (user) ->
      if(scope.editForm.$valid)
        console.log(user)
        user.$save()





])