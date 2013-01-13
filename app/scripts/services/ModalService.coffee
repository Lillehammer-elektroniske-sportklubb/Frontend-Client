service.factory('Modal', ['$resource',
  ($resource) ->
    Modal = {
    partial: '',
    resource: $resource('/partial/:partial',
      {},
      {
      query: {method:'GET', isArray: false},
      }
    )
    }

    return Modal

]
)
