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
        'payment'             : '',
        'mobile'              : 'Mobile phonenumber',
      }
    }
    scope.patterns = (pattern) ->
      if(pattern == 'sms')
        if(scope.User.Profile.payment == 'sms')
          return /^4|9([0-9]){7}$/

      return /^\s$/
    scope.smspattern = ->
      return scope
    scope.nextstep = ->
      scope.step = scope.step + 1
    scope.steps = new Array()
    scope.User

    scope.validateForm = (index) ->

      console.log(index)
      if(scope.step == index)
        scope.steps[index] = scope.form
        return 'current'
      else if((scope.steps[index] != undefined && !scope.steps[index].$invalid))
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
      console.log(data)
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
