service.factory('TemplateService', ['config','$resource', 'TokenHandler',
  (config, $resource, tokenHandler) ->

    resource = $resource(config().backendUrl + '/templates/:action',
      {action:'@action', port:':9000'}
    )
    resource = tokenHandler.wrapActions(resource)

    return resource


])

