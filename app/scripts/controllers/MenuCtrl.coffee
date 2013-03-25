controller.controller('MenusCtrl', [
  '$rootScope', '$scope'
  (rootScope, scope) ->

    rootScope.$watch('menus', (data) ->
      if(data != undefined && data != null)
        scope.items = data.menu
    )


])