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
services.factory('news', ['$resource',
  ($resource) ->
    return $resource(
      'http://backend.eu.lionsek.com/:action'
      # 'http://localhost:port/:action'
      ,
      {callback: 'JSON_CALLBACK'},
      {
        query: {method:'JSONP', isArray: true}
      })
  ])
services.factory('iframePost', ['$rootScope'
  (rootScope) ->
# src = 'http://ec2-54-246-106-179.eu-west-1.compute.amazonaws.com:port/:action'
    rootScope.src = 'http://localhost:9000/'
    rootScope.iframe = $('#postMessageIframe')
    rootScope.iframe.attr('src',rootScope.src).attr('height',0)
   # rootScope.postMessage = $.postMessage
    rootScope.$on('postMessage', (e, data) ->
          console.log('consume broadcast')
          console.log(data)
          parent_url = decodeURIComponent(
              document.location.hash.replace( /^#/, '')
          )
          $.postMessage(
            JSON.stringify(data.package),
            'http://localhost:3333/',
            parent
          )
    )
    return rootScope.iframe
])

