'use strict'

### Controllers ###

angular.module('Lions.controllers', [])

.controller('LionsCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'

($scope, $location, $resource, $rootScope) ->

  # Uses the url to determine if the selected
  # menu item should have the class active.
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  $scope.getClass = (id) ->
    if $scope.activeNavId.substring(0, id.length) == id
      return 'active'
    else
      return ''
])

.controller('MyCtrl1', [
  '$scope'

($scope) ->
  $scope.onePlusOne = 2
])

.controller('MyCtrl2', [
  '$scope'
($scope) ->
  $scope
])

.controller('StartpageCtrl',
  ['$rootScope','$scope','$http'
    (rootScope,scope,http) ->
      scope.news =
        [
          {
            'id': 2,
            'title': 'Razer signs on with Lions',
            'created': '2012-11-22 12:57:00',
            'updated': '2012-11-22 13:00:00',
            'body' : '<p>This is </p><!--readmore--><p> something more</p>'
          }
          {
            'id': 3,
            'title': 'QPAD signs on with Lions',
            'created': '2012-11-22 11:57:00',
            'updated': '2012-11-22 12:00:00',
            'body' : '<p>This is </p><!--readmore--><p> something more</p>'
          }
          {
            'id': 1,
            'title': 'QPAD signs on with Lions',
            'created': '2012-11-22 11:57:00',
            'updated': '2012-11-22 12:00:00',
            'body' : '<p>This is </p><!--readmore--><p> something more</p>'
          }
          {
            'id': 4,
            'title': 'QPAD signs on with Lions',
            'created': '2012-11-22 11:57:00',
            'updated': '2012-11-22 12:00:00',
            'body' : '<p>This is </p><!--readmore--><p> something more</p>'
          }
          {
            'id': 5,
            'title': 'QPAD signs on with Lions',
            'created': '2012-11-22 11:57:00',
            'updated': '2012-11-22 12:00:00',
            'body' : '<p>This is </p><!--readmore--><p> something more</p>'
          }
        ]
      scope.getMainNews = () ->
        return scope.news[0]
      scope.getNews = () ->
        return scope.news.slice(1)
      scope.currentPage = 0
      scope.pageSize = 3
  ])

.controller('NewsAdminCtrl', [
  '$rootScope','$scope','news', 'iframePost'
  (rootScope,scope, news, iframePost) ->
    scope.newsList = []
    scope.submitText = 'Add'
    scope.newsListIndexEditing = false
    scope.editNews = {
      title: '',
      body: '',
      status: 'draft',
      publishDate: Date.now()
    }

    scope.select = (index) ->
      scope.newsListIndexEditing = index
      scope.editNews = scope.newsList[scope.newsListIndexEditing]
      scope.submitText = 'Edit'



    scope.save = ->
      if(scope.submitText.toLowerCase() == 'add')
        addNews = new news()
        addNews = scope.editNews
        response = news.save({action: 'add'}, {NewsPost: addNews} )
        console.log('send broadcast')
        # rootScope.$broadcast('postMessage', {package:addNews, action: 'add'})
        scope.newsList.push(response)

      else
        addNews = new news()
        addNews = scope.editNews
        scope.newsList[scope.newsListIndexEditing] = addNews
        news.save({action: 'update'}, {NewsPost: addNews} )



    scope.getNews = () ->
      scope.newsList = news.query({action: 'get'})
      return scope.newsList




])
# Handles the register modal
.controller('RegisterWizardCtrl', [
  '$rootScope','$scope','RegisterWizard','$http'
  (rootScope,scope, RegisterWizard, http) ->
    scope.step = 1
    scope.form
    scope.User = {
      'email' : '',
      'password' : '',
      'acceptedPolicy' : false,
      Profile: {
        'country'             : 'other',
        'displayName'         : '',
        'firstName'           : '',
        'lastName'            : '',
        'dateOfBirth'         : '',
        'address'             : '',
        'alternativeAddress'  : '',
        'postcode'            : '',
        'postplace'           : '',
        'payment'             : 'none',
        'mobile'              : 'Mobile phonenumber',
      }
    }
    scope.pattern = /^\s$/
    scope.patterns = () ->
      if(scope.User.Profile.payment == 'sms')
        scope.$parent.pattern = /^4|9([0-9]){7}$/
        scope.pattern = scope.$parent.pattern
      else
        scope.$parent.pattern = /^$/
        scope.pattern = scope.$parent.pattern
        if(scope.form.$error.pattern != false)
          scope.form.$error.pattern[0].$setValidity('pattern',true)

    scope.smspattern = ->
      return scope.pattern
    scope.nextstep = ->
      scope.step = scope.step + 1
    scope.steps = []
    scope.getNationality = () ->
      switch(scope.User.Profile.country)
        when "no" then return "Norwegian"
        when "se" then return "Swedish"
        else return "International"


    scope.validateForm = (index) ->
      if(index != undefined)
        if(scope.step == index)
          scope.steps[index] = scope.form
          console.log(scope.steps)
          return 'current'
        else if(
          (scope.steps[index] != undefined && !scope.steps[index].$invalid)
        )
          return 'validated'
        else if(
          scope.step >= index ||
          (scope.steps[index] != undefined  && scope.steps[index].$invalid))
          return 'error'


])
.controller('RegisterCtrl', [
  '$rootScope','$scope','RegisterWizard', '$http'
(rootScope, scope, RegisterWizard, http) ->

  scope.mydata
  scope.start = ->
    http({method:'GET', url:'/partials/partial1.html'})
      .success((data,status,headers,config) ->
        rootScope.$broadcast('modal','/partials/register.html')
        $("#modal").modal('show')
        )
      .error((data,status,headers,config) ->
         return false
      )



    return null


  scope.footer = RegisterWizard.currentStep
])
.controller('ModalCtrl', [
  '$rootScope','$scope','Modal','RegisterWizard'
  (rootScope, scope, Modal,RegisterWizard) ->
    rootScope.$on('modal',(e,data) ->
      scope.body = data
     #scope.$apply()
    )
    scope.registerStep = (step) ->
      RegisterWizard.registerStep(step)

])

.controller('TodoCtrl', [
  '$scope'

($scope) ->

  $scope.todos = [
    text: "learn angular"
    done: true
  ,
    text: "build an angular app"
    done: false
  ]

  $scope.addTodo = ->
    $scope.todos.push
      text: $scope.todoText
      done: false

    $scope.todoText = ""

  $scope.remaining = ->
    count = 0
    angular.forEach $scope.todos, (todo) ->
      count += (if todo.done then 0 else 1)

    count

  $scope.archive = ->
    oldTodos = $scope.todos
    $scope.todos = []
    angular.forEach oldTodos, (todo) ->
      $scope.todos.push todo  unless todo.done

])
