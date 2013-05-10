controller.controller('BracketCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  'SessionService'
  'TokenHandler'
  'TemplateService'
  '$cookieStore'

  (
    $scope, $location, $resource, $rootScope,SessionService,TokenHandler,
    TemplateService, cookieStore
  ) ->

    nonCORS = () ->
      $location.path('/browser')

    switch BrowserDetect.browser
      when "Explorer"
        if(BrowserDetect.version < 10)
          nonCORS()
      when "Firefox"
        if(BrowserDetect.version <= 3)
          nonCORS()
      when "Safari"
        if(BrowserDetect.version < 4)
          nonCORS()
      when "Opera"
        if(BrowserDetect.version < 12)
          nonCORS()
      when "Opera Mini"
        nonCORS()
      when "Opera Mobile"
        if(BrowserDetect.version < 12)
          nonCORS()





    updateMenus = () ->
      $rootScope.menus = ts.$get(
        null
        (data) ->
          $rootScope.menus = data
      )
    # Uses the url to determine if the selected
    # menu item should have the class active.
    $rootScope.pageTitle = "Oslo Lions Elektroniske Sportsklubb"
    $rootScope.config = {
      maintenance: false
      baseUrl: '//cdn.bracket.no'
      backendUrl: '//locahost:port'
    }

    ###
      Authenticate Guest
    ###
   # $rootScope.auth = User.get()
    $rootScope.menus = []
    ts = new TemplateService

    if(!TokenHandler.get())
      $rootScope.auth = SessionService.save(
        null
        (data) ->

      )
      updateMenus()
    else
      updateMenus()




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

    $rootScope.$on('event:auth:newkey', (obj,key) ->
      TokenHandler.set(key)
      cookieStore.put('key', key)
      updateMenus()
    )
    $rootScope.$on('event:auth:loginRequired', () ->
      TokenHandler.set(false)
      if(!$rootScope.config.maintenance)
        $location.path('/user/login')
      else
        $location.path('/')


    )



])