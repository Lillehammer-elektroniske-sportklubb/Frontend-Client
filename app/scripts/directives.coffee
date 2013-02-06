'use strict'

### Directives ###

# register the module with Angular
directive = angular.module('Bracket.directives', [
  # require the 'app.service' module
  'Bracket.services'
])