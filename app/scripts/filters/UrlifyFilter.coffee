filter.filter('urlify', [
  () ->
    (input) ->
      return input
        .replace(/_/g, '-')
        .replace(/\ /g, '-')
        .replace(/:/g, '-')
        .replace(/\\/g, '-')
        .replace(/\//g, '-')
        .replace(/[^a-zA-Z0-9\-]+/g, '')
        .replace(/-{2,}/g, '-')
        .toLowerCase()
])
