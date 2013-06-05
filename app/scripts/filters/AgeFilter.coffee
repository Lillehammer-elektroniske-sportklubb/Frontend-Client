filter.filter('age', [
  () ->
    (input) ->
      today = new Date()
      birthDate = new Date(input)
      age = today.getFullYear() - birthDate.getFullYear()
      m = today.getMonth() - birthDate.getMonth()
      if(m < 0 || m == 0 && today.getDate() < birthDate.getDate())
        age--
      return age
])