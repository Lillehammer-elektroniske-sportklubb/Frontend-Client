# Handles the register modal
controller.controller('RegisterWizardCtrl', [
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