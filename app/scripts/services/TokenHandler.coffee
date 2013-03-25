service.factory('TokenHandler', ['$rootScope','$cookieStore'
($rootScope,cookieStore) ->
  tokenHandler = {}
  token = false
  tokenHandler.set = (newToken) ->
    token = newToken
    cookieStore.put('key',token)

  tokenHandler.get = () ->
    if(!token)
      key = cookieStore.get('key')
      if(key != undefined && key != null)
        @set(key)
    return token

  tokenHandler.format = () ->
    token = tokenHandler.get()
    if(token)
      return  {
        access_token: tokenHandler.get()
      }
    else
      return {}
  tokenHandler.wrapActions = ( resource, actions) ->
    if(actions == undefined)
      actions = ['get','query', 'save', 'update', 'remove', 'delete']
    wrappedResource = resource
    for i in [0..actions.length] by 1
      tokenWrapper( wrappedResource, actions[i] )

    return wrappedResource

  tokenWrapper = (resource,action) ->
    resource['_' + action] = resource[action]
    resource[action] = ( data, success, error) ->
      return resource['_' + action](
        angular.extend({}, data || {}, tokenHandler.format()),
      success,
      error
      )

  return tokenHandler
])