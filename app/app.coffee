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

])

App.config([
  '$routeProvider'
  '$locationProvider'

  ($routeProvider, $locationProvider, config) ->

    $routeProvider

      .when('/start', {templateUrl: '/partials/startpage.html'})
      # User
      .when('/user/login', {templateUrl: '/partials/user/login.html'})
      .when('/user/register', {templateUrl: '/partials/user/register.html'})
      .when('/user/recover', {templateUrl: '/partials/user/recover.html'})

      .when('/community', {templateUrl: '/partials/partial1.html'})
      .when('/contact', {templateUrl: '/partials/todo.html'})
      .when('/lekadmin/news', {templateUrl: '/partials/admin/news/add.html'})

      # Catch all
      .otherwise({redirectTo: '/start'})

    # Without server side support html5 must be disabled.
    $locationProvider.html5Mode(true)

])

