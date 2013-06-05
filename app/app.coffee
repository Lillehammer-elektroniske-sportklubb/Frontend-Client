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
  'ui'
  'ui.bootstrap'

])

App.config([
  '$routeProvider'
  '$locationProvider'
  'config'

  ($routeProvider, $locationProvider,config) ->

    config = config()

    console.log(config)
    $routeProvider

      .when('/',
        {
          templateUrl:
            config.baseurl + '/partials/' +
            config.localization + '/maintenance/login.html'
        }
      )
      .when('/browser',
      {
        templateUrl:
          config.baseurl + '/partials/' +
          config.localization + '/cors/browser.html'
      }
      )


      .when('/user/login',
        {
          templateUrl: config.config + '/partials/en/user/login.html'
        }
      )
      .when('/user/register',
        {
        templateUrl: config.baseurl + '/partials/en/user/register.html'
        }
      )
      .when('/user/profile/:id',
        {
        templateUrl: config.baseurl + '/partials/en/user/edit.html'
        }
      )
      .when('/tournament/dashboard/:id',
        {
        templateUrl: config.baseurl + '/partials/en/tournament/view.html'
        }
      )
      .when('/tournament/rules/:id',
        {
        templateUrl: config.baseurl + '/partials/en/tournament/rules.html'
        }
      )
      .when('/tournament/contestants/:id',
        {
          templateUrl:
            config.baseurl + '/partials/' +
            config.localization + '/tournament/contestants.html'
        }
      )
      # Catch all
      .otherwise({redirectTo: '/'})

    # Without server side support html5 must be disabled.
    $locationProvider.html5Mode(false)

])
BrowserDetect =
  init: ->
    @browser = @searchString(@dataBrowser) or "An unknown browser"
    @version =
      @searchVersion(navigator.userAgent) or
      @searchVersion(navigator.appVersion) or "an unknown version"
    @OS = @searchString(@dataOS) or "an unknown OS"

  searchString: (data) ->
    i = 0

    while i < data.length
      dataString = data[i].string
      dataProp = data[i].prop
      @versionSearchString = data[i].versionSearch or data[i].identity
      dat = data[i]
      if dataString
        return dat.identity unless dataString.indexOf(dat.subString) is -1

      else return data[i].identity  if dataProp
      i++

  searchVersion: (dataString) ->
    index = dataString.indexOf(@versionSearchString)
    return  if index is -1
    parseFloat dataString.substring(index + @versionSearchString.length + 1)

  dataBrowser: [
    string: navigator.userAgent
    subString: "Chrome"
    identity: "Chrome"
  ,
    string: navigator.userAgent
    subString: "OmniWeb"
    versionSearch: "OmniWeb/"
    identity: "OmniWeb"
  ,
    string: navigator.vendor
    subString: "Apple"
    identity: "Safari"
    versionSearch: "Version"
  ,
    prop: window.opera
    identity: "Opera"
    versionSearch: "Version"
  ,
    string: navigator.vendor
    subString: "iCab"
    identity: "iCab"
  ,
    string: navigator.vendor
    subString: "KDE"
    identity: "Konqueror"
  ,
    string: navigator.userAgent
    subString: "Firefox"
    identity: "Firefox"
  ,
    string: navigator.vendor
    subString: "Camino"
    identity: "Camino"
  ,
    # for newer Netscapes (6+)
    string: navigator.userAgent
    subString: "Netscape"
    identity: "Netscape"
  ,
    string: navigator.userAgent
    subString: "MSIE"
    identity: "Explorer"
    versionSearch: "MSIE"
  ,
    string: navigator.userAgent
    subString: "Gecko"
    identity: "Mozilla"
    versionSearch: "rv"
  ,
    # for older Netscapes (4-)
    string: navigator.userAgent
    subString: "Mozilla"
    identity: "Netscape"
    versionSearch: "Mozilla"
  ]
  dataOS: [
    string: navigator.platform
    subString: "Win"
    identity: "Windows"
  ,
    string: navigator.platform
    subString: "Mac"
    identity: "Mac"
  ,
    string: navigator.userAgent
    subString: "iPhone"
    identity: "iPhone/iPod"
  ,
    string: navigator.platform
    subString: "Linux"
    identity: "Linux"
  ]

BrowserDetect.init()

