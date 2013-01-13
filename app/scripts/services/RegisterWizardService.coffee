service.factory('RegisterWizard', ['$resource',
  ($resource) ->
    RegisterWizard = {
    steps: [{step: 1},{step: 2, branch: ['no','se','int']}],
    branches: [],
    currentStep: '1',
    registerStep: (step) ->
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
