initialize = ->
  bindSubmitFormEvent()

bindSubmitFormEvent = ->
  $('form').on 'submit', (e) ->
    e.preventDefault()
    getLocation(setQueryCoordsAndSubmit)

getLocation = (callback) ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition (position) ->
      coords =
        latitude: position.coords.latitude
        longitude: position.coords.longitude

      callback(coords)

setQueryCoordsAndSubmit = (coords) ->
  $('#query_latitude').val(coords.latitude)
  $('#query_longitude').val(coords.longitude)
  $('form').unbind('submit').submit()

ValidCoords = ->
  $('#query_latitude').val().length >= 6 && $('#query_longitude').val().length >= 6

$(document).ready(initialize)
