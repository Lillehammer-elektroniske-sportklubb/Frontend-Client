controller.controller('RegisterCtrl', [
  '$rootScope', '$scope'
  (rootScope, scope) ->

    scope.gamesAvailableList = [
      {
        id: "dwdawdlad"
        title: "Counter-Strike: Global Offensive"
        guid: ""
      }
    ]
    scope.gamesSelectedList = [
      {
        id: "dwdawdladd"
        title: "StarCraft 2: Heart of The Swarm"
        guid: ""
      }
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

])