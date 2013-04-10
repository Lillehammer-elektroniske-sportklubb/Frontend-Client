service.factory('TemplateService', ['config','$resource', 'TokenHandler',
  (config, $resource, tokenHandler) ->
    resource = $resource(config.backendUrl + '/templates/:action',
      {action:'@action',port:':9000'}
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

