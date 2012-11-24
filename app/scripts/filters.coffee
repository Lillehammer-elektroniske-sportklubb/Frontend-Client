'use strict'

### Filters ###

angular.module('Lions.filters', [])

.filter('interpolate', [
  'version',

(version) ->
  (text) ->
    String(text).replace(/\%VERSION\%/mg, version)
])
.filter('age', [
  () ->
    (input) ->
        today = new Date()
        birthDate = new Date(input)
        age = today.getFullYear() - birthDate.getFullYear()
        m = today.getMonth() - birthDate.getMonth()
        if(m < 0 || m == 0 && today.getDate() < birthDate.getDate())
          age--
        return age
  ])
.filter('paginate', [
    () ->
      (input,start) ->
        start = +start
        return input.slice(start)


])
.filter('urlify', [
  () ->
    (input) ->
      return input
        .replace(/_/g, '-')
        .replace(/\ /g, '-')
        .replace(/:/g, '-')
        .replace(/\\/g, '-')
        .replace(/\//g, '-')
        .replace(/[^a-zA-Z0-9\-]+/g, '')
        .replace(/-{2,}/g, '-')
        .toLowerCase()
])
