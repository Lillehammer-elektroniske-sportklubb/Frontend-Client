service.factory('iframePost', ['$rootScope'
  (rootScope) ->
  #src='http://ec2-54-246-106-179.eu-west-1.compute.amazonaws.com:port/:action'
    rootScope.src = 'http://localhost:9000/'
    rootScope.iframe = $('#postMessageIframe')
    rootScope.iframe.attr('src',rootScope.src).attr('height',0)
    # rootScope.postMessage = $.postMessage
    rootScope.$on('postMessage', (e, data) ->
      console.log('consume broadcast')
      console.log(data)
      parent_url = decodeURIComponent(
        document.location.hash.replace( /^#/, '')
      )
      $.postMessage(
        JSON.stringify(data.package),
      'http://localhost:3333/',
      parent
      )
    )
    return rootScope.iframe
])