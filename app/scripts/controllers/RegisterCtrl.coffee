controller.controller('RegisterCtrl', [
  '$rootScope','$scope','RegisterWizard', '$http', 'news'
  (rootScope, scope, RegisterWizard, http, news) ->


    scope.submit = ->
      news.tittel = scope.news.title
      news.$query()



    scope.mydata
    scope.start = ->
      console.log('start')
      http({method:'GET', url:'/partials/partial1.html'})
        .success((data,status,headers,config) ->
          rootScope.$broadcast('modal','/partials/register.html')
          $("#modal").modal('show')
        )
        .error((data,status,headers,config) ->
          return false
        )



      return null


    scope.footer = RegisterWizard.currentStep
])