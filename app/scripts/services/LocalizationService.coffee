service.factory('LocalizationService', ['$resource', 'TokenHandler',
  ($resource, tokenHandler) ->
    return {
      locale: {
        id: "no"
      }
    }


])

