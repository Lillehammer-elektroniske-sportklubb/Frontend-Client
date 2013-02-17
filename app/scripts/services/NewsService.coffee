service.factory('news', ['$resource', 'TokenHandler',
  ($resource, tokenHandler) ->
    resource = $resource(
      #'http://backend.eu.Bracketek.com/:action'
      'http://localhost:port/news'
    ,
      {port: ':9000'}
    )

    return tokenHandler.wrapActions(resource)

])
