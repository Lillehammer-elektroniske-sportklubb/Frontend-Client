controller.controller('BracketCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'

  ($scope, $location, $resource, $rootScope) ->

    # Uses the url to determine if the selected
    # menu item should have the class active.
    $rootScope.pageTitle = "Oslo Lions Elektroniske Sportsklubb"

    $scope.$location = $location
    $scope.$watch('$location.path()', (path) ->
      $scope.activeNavId = path || '/'
    )

    # getClass compares the current url with the id.
    # If the current url starts with the id it returns 'active'
    # otherwise it will return '' an empty string. E.g.
    #
    #   # current url = '/products/1'
    #   getClass('/products') # returns 'active'
    #   getClass('/orders') # returns ''
    #
    $scope.getClass = (id) ->
      if $scope.activeNavId.substring(0, id.length) == id
        return 'active'
      else
        return ''

    $rootScope.$on('event:auth:loginRequired', (data) ->
      $location.path('/user/login')
    )

    $rootScope.config = {
      baseUrl: '//cdn.bracket.no'
    }
])