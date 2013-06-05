controller.controller('RegisterCtrl', [
  '$rootScope', '$scope', 'UserService'
  (rootScope, scope, UserService) ->

    scope.gamesAvailableList = [

    ]
    scope.gamesSelectedList = [

    ]
    scope.selectGame = (game) ->
      scope.gamesAvailableList.splice(
        $.inArray(game,scope.gamesAvailableList),
        1
      )
      scope.gamesSelectedList.push(game)

    scope.deselectGame = (game) ->
      scope.gamesSelectedList.splice($.inArray(game,scope.gamesSelectedList),1)
      scope.gamesAvailableList.push(game)

    scope.register = () ->
      if(
        scope.username != undefined &&
        scope.password != undefined &&
        scope.profile != undefined
      )
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
          postcode:     scope.profile.postcode
          postplace:    scope.profile.postplace
        }


        user.$save()






])