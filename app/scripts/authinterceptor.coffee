angular.module('auth-interceptor', [])
.provider('authService', () ->
  buffer = []

  this.pushToBuffer = (config, deferred) ->
    buffer.push({
      config: config
      deferred: deferred
    })

  this.$get = ['$rootScope', '$injector', ($rootScope, $injector) ->
    #$http

    retry = (config, deferred) ->
      $http = $injector.get('$http')
      $http(config).then((response) ->
        deferred.resolve(response)
      )

    retryAll = () ->
      for i in [0..buffer.length] by 1
        retry(buffer[i].config, buffer[i].deferred)
      buffer = []

    return {
      loginConfirmed: () ->
        $rootScope.$broadcast('event:auth:loginConfirmed')
        retryAll()
    }
  ]
  return null
)
.config(['$httpProvider', 'authServiceProvider',
    ($httpProvider, authServiceProvider) ->
      interceptor = ['$rootScope', '$q', ($rootScope, $q) ->
        success = (response) ->
          console.log(response.status)
          return response

        error = (response) ->
          if(response.status == 401)
            deferred = $q.defer()
            authServiceProvider.pushToBuffer(response.config, deferred)
            console.log(response.status)
            $rootScope.$broadcast('event:auth:loginRequired')
            return deferred.promise

          return $q.reject(response)

        return (promise) ->
          return promise.then(success, error)

      ]
      $httpProvider.responseInterceptors.push(interceptor)
])
