controller.controller('ModalCtrl', [
  '$rootScope','$scope','Modal','RegisterWizard'
  (rootScope, scope, Modal,RegisterWizard) ->
    rootScope.$on('modal',(e,data) ->
      scope.body = data
      #scope.$apply()
    )
    scope.registerStep = (step) ->
      RegisterWizard.registerStep(step)

])