controller.controller('FrontpageCtrl', [
  '$rootScope', '$scope',
  'UserService'
  (
    rootScope, scope,
    UserService
  ) ->
    scope.tournaments = [
      {
        _id: 'dwad2313213dawa'
        game: 'csgo'
        title: '2on2 AIM'
        venue: 'The Gathering'
        prizePool: '1500€ cash/hardware'
        signups: []
        slots: 64
        start: 23123
        signupEnds: 2312131
        currentStage: 'checkin'

      }
    ]


    return true


])