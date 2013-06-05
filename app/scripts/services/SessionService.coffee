service.factory('SessionService', ['config','$resource', 'TokenHandler',
  (config,$resource, tokenHandler) ->
    resource = $resource(config().backendUrl + '/session/:action',
      {action:'@action', port: ':9000'}
    )
    resource = tokenHandler.wrapActions(resource)

    return resource


])

