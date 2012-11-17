'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('Lions', [
  'ngCookies'
  'ngResource'
  'Lions.directives'
  'Lions.filters'
  'Lions.services'
  'Lions.controllers'
])

App.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

  $routeProvider

    .when('/start', {templateUrl: '/partials/startpage.html'})
    .when('/community', {templateUrl: '/partials/partial1.html'})
    .when('/contact', {templateUrl: '/partials/todo.html'})

    # Catch all
    .otherwise({redirectTo: '/start'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
