service.factory('TemplateService', ['$resource', 'TokenHandler',
  ($resource, tokenHandler) ->
    resource = $resource('http://localhost:port/templates/:action',
      {action:'@action', port: ':9000'}
      {
        'get':    {
          method:'JSONP', params: {callback: 'JSON_CALLBACK'}
        }
        'query':  {
          method:'JSONP', params: {callback: 'JSON_CALLBACK'}, isArray:true
        }

      }
    )
    resource = tokenHandler.wrapActions(resource)

    return resource


])

