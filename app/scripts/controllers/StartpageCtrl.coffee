controller.controller('StartpageCtrl',
['$rootScope','$scope', 'news'
  (rootScope,scope,News) ->
    scope.news =
      [
        {
        'id': 2,
        'title': 'Razer signs on with Bracket',
        'created': '2012-11-22 12:57:00',
        'updated': '2012-11-22 13:00:00',
        'body' : '<p>This is </p><!--readmore--><p> something more</p>'
        }
        {
        'id': 3,
        'title': 'QPAD signs on with Bracket',
        'created': '2012-11-22 11:57:00',
        'updated': '2012-11-22 12:00:00',
        'body' : '<p>This is </p><!--readmore--><p> something more</p>'
        }
        {
        'id': 1,
        'title': 'QPAD signs on with Bracket',
        'created': '2012-11-22 11:57:00',
        'updated': '2012-11-22 12:00:00',
        'body' : '<p>This is </p><!--readmore--><p> something more</p>'
        }
        {
        'id': 4,
        'title': 'QPAD signs on with Bracket',
        'created': '2012-11-22 11:57:00',
        'updated': '2012-11-22 12:00:00',
        'body' : '<p>This is </p><!--readmore--><p> something more</p>'
        }
        {
        'id': 5,
        'title': 'QPAD signs on with Bracket',
        'created': '2012-11-22 11:57:00',
        'updated': '2012-11-22 12:00:00',
        'body' : '<p>This is </p><!--readmore--><p> something more</p>'
        }
      ]


    news = News.query()
    scope.getMainNews = () ->
      return scope.news[0]
    scope.getNews = () ->
      return scope.news.slice(1)
    scope.currentPage = 0
    scope.pageSize = 3
])