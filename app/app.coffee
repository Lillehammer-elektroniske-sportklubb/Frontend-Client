'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('Bracket', [
  'ngCookies'
  'ngResource'
  'Bracket.directives'
  'Bracket.filters'
  'Bracket.services'
  'Bracket.controllers'
  'auth-interceptor'
  'placeholders.img'
  'placeholders.txt'
  'ui.bootstrap'

])

App.config([
  '$routeProvider'
  '$locationProvider'

  ($routeProvider, $locationProvider) ->

    localization = 'no'
    baseurl = ''

    $routeProvider

      .when('/',
        {
        templateUrl: baseurl + '/partials/maintenance/login.html'
        }
      )
      .when('/user/login',
        {
          templateUrl: baseurl + '/partials/en/user/login.html'
        }
      )
      .when('/user/register',
        {
        templateUrl: baseurl + '/partials/en/user/register.html'
        }
      )
      .when('/user/profile/:id',
        {
        templateUrl: baseurl + '/partials/en/user/edit.html'
        }
      )
      .when('/tournament/dashboard/:id',
        {
        templateUrl: baseurl + '/partials/en/tournament/view.html'
        }
      )
      .when('/tournament/rules/:id',
        {
        templateUrl: baseurl + '/partials/en/tournament/rules.html'
        }
      )
      .when('/tournament/contestants/:id',
        {
        templateUrl: baseurl + '/partials/en/tournament/contestants.html'
        }
      )
      # Catch all
      .otherwise({redirectTo: '/'})

    # Without server side support html5 must be disabled.
    $locationProvider.html5Mode(false)

])

