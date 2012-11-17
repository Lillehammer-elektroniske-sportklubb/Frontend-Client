'use strict'

### Directives ###

# register the module with Angular
angular.module('Lions.directives', [
  # require the 'app.service' module
  'Lions.services'
])

.directive('appVersion', [
  'version'

(version) ->

  (scope, elm, attrs) ->
    elm.text(version)
])
