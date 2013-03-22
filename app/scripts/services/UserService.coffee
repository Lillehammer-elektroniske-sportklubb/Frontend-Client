service.factory('UserService', ['$resource', 'TokenHandler',
  ($resource, tokenHandler) ->
    resource = $resource('http://localhost:port/user',
      {port: ':9000'}
    )
    resource = tokenHandler.wrapActions(resource)

    return resource


])

