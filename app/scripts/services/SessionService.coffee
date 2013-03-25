service.factory('SessionService', ['$resource', 'TokenHandler',
  ($resource, tokenHandler) ->
    resource = $resource('http://localhost:port/session/:action',
      {action:'@action', port: ':9000'}
      {
        'get':    {
          method:'JSONP', params: {callback: 'JSON_CALLBACK'}
        }
        'query':  {
          method:'JSONP', isArray:true, params: {callback: 'JSON_CALLBACK'}
        }

      }
    )
    resource = tokenHandler.wrapActions(resource)

    return resource


])

