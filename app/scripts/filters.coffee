'use strict'

### Filters ###

angular.module('Lions.filters', [])

.filter('interpolate', [
  'version',

(version) ->
  (text) ->
    String(text).replace(/\%VERSION\%/mg, version)
])
