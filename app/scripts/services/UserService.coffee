service.factory('UserService', ['config','$resource', 'TokenHandler',
  (config, $resource, tokenHandler) ->
    resource = $resource(config.backendUrl + '/user/:action/:id',
      {action:'@action', id:'@id',port:':9000'}
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

