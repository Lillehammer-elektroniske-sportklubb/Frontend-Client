service.factory('news', ['$resource',
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

