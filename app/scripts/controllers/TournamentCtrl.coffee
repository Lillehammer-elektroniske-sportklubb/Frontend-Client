controller.controller('TournamentCtrl', [
  '$rootScope', '$scope'
  (rootScope, scope) ->

    scope.tournament = {
      _id: 'dwad2313213dawa'
      game: {
        abrv: 'csgo'
        name: 'Counter-Strike: Global Offensive'
      }

      creator: {
        _id: "132312dadaw"
        name: "Lions EK"
      }
      title: '2on2 AIM'
      venue: 'Vikingskipet, Hamar, Norway'
      prizePool: '1500€ cash/hardware'
      signups: [
        {
          name: "Lions EK"
          collapsed: true
          members: [
            {
              name: "Monk"
            }
            {
              name: "Kjartan"
            }
          ]
        }
        {
        name: "Lions EK"
        collapsed: true
        members: [
          {
          name: "Monk"
          }
          {
          name: "Kjartan"
          }
        ]
        }
      ]
      slots: 64
      start: 23123
      signupEnds: 2312131
      currentStage: 'checkin'
      format: "2on2"
      groupPlay: null
      playoffs: null
      requirements: {
        numplayers: 2
        invite: false
        guid: true
      }


      news: [
        {
          _id: "awdwadawd2312"
          created: 213123321
          creator: "dwadadawdwa"
          title: "adw213dawd213"
          content: "dwadwadw23123"
        }
        {
          _id: "awdwadawd2312"
          created: 213123321
          creator: "dwadadawdwa"
          title: "adw213dawd213"
          content: "dwadwadw23123"
        }
      ]

      }

])