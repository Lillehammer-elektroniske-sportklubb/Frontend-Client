'use strict'

### Sevices ###

services = angular.module('Lions.services', ['ngResource'])

services.factory 'version', -> "0.0.1"

services.factory('RegisterWizard', ['$resource',
  ($resource) ->
    RegisterWizard = {
      steps: [{step: 1},{step: 2, branch: ['no','se','int']}],
      branches: [],
      currentStep: '1',
      registerStep: (step) ->
        console.log(step)
        this.currentStep = step

      resource: $resource('http://localhost:8000/page/registration/:step',
        {step:this.currentStep},
        {
          query: {method:'GET', isArray: true},
        }
      )
    }

    return RegisterWizard
  ]
)

services.factory('Modal', ['$resource',
  ($resource) ->
    Modal = {
      partial: '',
      resource: $resource('/partial/:partial',
        {},
        {
          query: {method:'GET', isArray: false},
        }
      )
    }

    return Modal

]
)

